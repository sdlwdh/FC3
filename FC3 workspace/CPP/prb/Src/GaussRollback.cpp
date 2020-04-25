#include "prb/GaussRollback.hpp"
#include <gsl/gsl_linalg.h>
#include <vector>

class Explicit : public cfl::IGaussRollback
{
    public:
        Explicit(double dP, unsigned iSize = 0., double dH = 0., double dVar = 0.)
        : _p(dP),
          _h(dH),
          _var(dVar),
          _N(iSize)
        {
            PRECONDITION(0 < _p && _p <= 1/2);
            _M = ceil(_var/(2 * _h*_h *_p));
            _q = std::min((_var/(2 * (_h)*(_h) * _M)), _p);
            POSTCONDITION(0 < _q && _q <= _p);
        }
    
        IGaussRollback* newObject (unsigned iSize, double dH, double dVar) const
        {
            return new Explicit(_p, iSize, dH, dVar);
        }

        void rollback(std::valarray<double> &rValues) const
        {
            PRECONDITION(rValues.size() == _N);
            std::valarray<double> _vals(_N);
            if(_N >= 3)
            {
                for(auto m = 0; m < _M; m++)
                {
                    _vals[0] = rValues[0] - 2*rValues[1] + rValues[2];
                    for(int n = 1; n < _N-1; n++)
                    {
                        _vals[n] = rValues[n-1] -2*rValues[n] + rValues[n+1];
                    }
                    _vals[_N-1] = _vals[_N-2];
                    rValues = rValues + _q*_vals;
                }
            }
        }

    private:
        double _p, _h, _var, _q;
        unsigned int _N, _M;
};

class Implicit : public cfl::IGaussRollback
{
    public:
        Implicit(double dP, unsigned iSize = 0., double dH = 0., double dVar = 0.)
        : _p(dP),
          _N(iSize)
        {
            PRECONDITION(0 < _p && _p <= 1/2);
            _M = ceil(dVar/(2. * dH*dH *_p));
            _q = std::min((dVar/(2. * dH*dH * _M)), _p);
            POSTCONDITION(0 < _q && _q <= _p);
        }
    
        IGaussRollback* newObject (unsigned iSize, double dH, double dVar) const
        {
            return new Implicit(_p, iSize, dH, dVar);
        }

        void rollback(std::valarray<double> &rValues) const
        {
            PRECONDITION(rValues.size() == _N);
            std::valarray<double> vals(_N);

            std::vector<double> diag(_N-2, 1.+2*_q);
            gsl_vector_const_view diagView = gsl_vector_const_view_array(&diag.front(), diag.size());

            std::vector<double> e(_N-3, -_q);
            gsl_vector_const_view eView = gsl_vector_const_view_array(&e.front(), e.size());
            std::vector<double> f(_N-3, -_q);
            gsl_vector_const_view fView = gsl_vector_const_view_array(&f.front(), f.size());

            std::unique_ptr<gsl_vector, decltype(&gsl_vector_free)> X(gsl_vector_alloc(_N-2), &gsl_vector_free);

            gsl_vector_const_view b  = gsl_vector_const_view_array(std::begin(rValues)+1, rValues.size()-2);

            for(auto m = 0; m < _M; m++)
            {
                vals[0] = rValues[0];
                gsl_linalg_solve_tridiag(&diagView.vector, &eView.vector, &fView.vector, &b.vector, X.get());  

                for(auto i = 1; i < _N-1; i++)
                {
                    vals[i] = gsl_vector_get(X.get(), i-1);
                }
                vals[_N-1] = rValues[_N-1];
                rValues = vals;
            }
        }

    private:
        double _p, _q;
        unsigned int _N, _M;
};

cfl::GaussRollback 
prb::NGaussRollback::explic(double dP)
{
    return cfl::GaussRollback(new Explicit(dP));
}

cfl::GaussRollback
prb::NGaussRollback::implicit(double dP)
{
    return cfl::GaussRollback(new Implicit(dP));
}