#include "prb/Approx.hpp"
#include <gsl/gsl_chebyshev.h>

double gsl_f(double x, void* func)
{
    auto& f = *static_cast<std::function<double(double)>*>(func);
    return f(x);
}

class ChebyshevApprox : public cfl::IApprox
{
    public:
        ChebyshevApprox(const std::function<unsigned(double)> &rSize,
        double dLeft=0., 
        double dRight=0.)
        : _sizeF(rSize),
          _a(dLeft),
          _b(dRight),
          _nodes(_sizeF(_b - _a)),
          _cs(gsl_cheb_alloc(_sizeF(_b - _a) - 1), &gsl_cheb_free)
        {
            auto N(_sizeF(_b - _a));
            for(auto i=0; i<N; i++)
            {
                _nodes[i] = 0.5*(_b - _a)*cos(M_PI*(N - i - 0.5)/N) + 0.5*(_a + _b);
            }
        }

        IApprox* newApprox(double dLeft, double dRight) const
        {
            return new ChebyshevApprox(_sizeF, dLeft, dRight);
        }
 
        const std::vector<double>& arg() const
        {
            return _nodes;
        }
 
        cfl::Function approximate(const std::vector<double> &rValues) const
        {
            std::function<double(double)> u_func = [vals = rValues, args = _nodes](double dX)
            {
                double x_up = dX + std::numeric_limits<double>::epsilon();
                double x_low = dX - std::numeric_limits<double>::epsilon();

                int i = std::distance(args.begin(), 
                                    std::find_if(args.begin(), 
                                    args.end(),
                                    [x_up, x_low](double val)
                                    {
                                        return (val < x_up) && (val > x_low);
                                    }
                                )
                            );
                return vals[i]; 
            };
            
            gsl_function F;
            F.function = gsl_f;
            F.params = &u_func;
            gsl_cheb_init (_cs.get(), &F, _a, _b);

            std::function<double(double)> resultsF = [cheb_series = _cs](double dX)
            {
                return gsl_cheb_eval(cheb_series.get(), dX);
            };

            return cfl::Function(resultsF);
        }
    
    private:
        std::function<unsigned(double)> _sizeF;
        double _a, _b;
        std::vector<double> _nodes;
        std::shared_ptr<gsl_cheb_series> _cs;
};

cfl::Approx 
prb::NApprox::chebyshev(const std::function<unsigned(double)> &rSize)
{
    return cfl::Approx(new ChebyshevApprox(rSize));
}