#include "prb/Fit.hpp"
#include "cfl/Error.hpp"
#include <gsl/gsl_multifit.h>
#include <gsl/gsl_blas.h>
#include <gsl/gsl_bspline.h>
#include <iostream>

using namespace cfl;
using namespace prb;

class LinearFit : public cfl::IFit
{
    public:
        LinearFit(const std::vector<cfl::Function> &rBasisF)
        : _basisF(rBasisF),
        _cov(gsl_matrix_alloc(_basisF.size(), _basisF.size()), &gsl_matrix_free),
        _c(gsl_vector_alloc(_basisF.size()), &gsl_vector_free)
        {
            PRECONDITION(_basisF.size() > 0);
        }

        LinearFit(const std::vector<double> &rArg, 
            const std::vector<double> &rVal, 
            const std::vector<cfl::Function> &rBasisF, 
            const std::vector<double> &rW = std::vector<double>())
        : _basisF(rBasisF),
          _cov(gsl_matrix_alloc(_basisF.size(), _basisF.size()), &gsl_matrix_free),
          _c(gsl_vector_alloc(_basisF.size()), &gsl_vector_free)
        {
            PRECONDITION((rArg.size() == rVal.size()) && (rArg.size() == rW.size()));
            PRECONDITION(rArg.size() > 1);
            PRECONDITION(std::equal(rArg.begin()+1, rArg.end(), rArg.begin(), std::greater<double>()));
            PRECONDITION(rW.size()>0 ? rArg.size() == rW.size() : true);
            PRECONDITION(rBasisF.size() < rArg.size());
           
            std::unique_ptr<gsl_matrix, decltype(&gsl_matrix_free)> X(gsl_matrix_alloc(rArg.size(), _basisF.size()), &gsl_matrix_free);
            std::unique_ptr<gsl_vector, decltype(&gsl_vector_free)> y(gsl_vector_alloc(rVal.size()), &gsl_vector_free);
            
            bool weights = (rW.size() == rArg.size());
            double chol; 

            for(int i = 0; i < rArg.size(); i++)
            {
                for(int j = 0; j < _basisF.size(); j++)
                {
                    gsl_matrix_set(X.get(), i, j, _basisF[j](rArg[i]));
                }
                gsl_vector_set(y.get(), i, rVal[i]);
            }
            
            gsl_multifit_linear_workspace *work = gsl_multifit_linear_alloc(rArg.size(), _basisF.size());

            if(weights)
            {
                std::unique_ptr<gsl_vector, decltype(&gsl_vector_free)> w(gsl_vector_alloc(rW.size()), &gsl_vector_free);
                for(int i = 0; i < rW.size(); i++)
                    gsl_vector_set(w.get(), i, rW[i]);
                gsl_multifit_wlinear(X.get(), w.get(), y.get(), _c.get(), _cov.get(), &chol, work);
            }
            else
            {
                gsl_multifit_linear(X.get(), y.get(), _c.get(), _cov.get(), &chol, work);
            }
            
            gsl_multifit_linear_free(work);
            
            m_dLeft = rArg.front();
            m_dRight = rArg.back();

            POSTCONDITION(m_dLeft < m_dRight);
        }

        IFit *newObject(const std::vector< double > &rArg, const std::vector< double > &rVal) const
        {
            return new LinearFit(rArg, rVal, _basisF);
        }
 
        IFit *newObject(const std::vector< double > &rArg, const std::vector< double > &rVal, const std::vector< double > &rW) const
        {
            return new LinearFit(rArg, rVal, _basisF, rW);
        }
 
        Function fit() const
        {
            std::function<double(double)> uFit = [basis = _basisF, C = _c](double dX)
            {
                std::vector<double> bas(basis.size());
                std::transform(basis.begin(), basis.end(), bas.begin(), [dX](const Function &rF){
                    return rF(dX);
                });
                gsl_vector_const_view b = gsl_vector_const_view_array(bas.data(), bas.size());
                gsl_blas_ddot(&b.vector, C.get(), &dX);
                return dX;
            };
            return Function(uFit);
        }
        Function err() const
        {
            std::function<double(double)> err = [basis = _basisF, Cov = _cov](double dX)
            {
                std::vector<double> bas(basis.size());
                std::transform(basis.begin(), basis.end(), bas.begin(), [dX](const Function &rF)
                {
                    return rF(dX);
                });
                std::vector<double> b(bas);
                gsl_vector_const_view bView = gsl_vector_const_view_array(b.data(), b.size());
                gsl_vector_view basView = gsl_vector_view_array(bas.data(), bas.size());
                gsl_blas_dsymv(CblasUpper, 1., Cov.get(), &bView.vector, 0., &basView.vector);
                gsl_blas_ddot(&bView.vector, &basView.vector, &dX);
                ASSERT(dX >= 0);
                return sqrt(dX);
            };
            return Function(err);
        }
    private:
        std::vector<cfl::Function> _basisF;
        std::shared_ptr<gsl_matrix> _cov;
        std::shared_ptr<gsl_vector> _c;
        double m_dLeft, m_dRight;
};

cfl::Fit prb::NFit::linear(const std::vector<cfl::Function> &rBasisF)
{
    return Fit(new LinearFit(rBasisF));
}

class BSpline_Fit : public cfl::IFit
{
    public:
        BSpline_Fit(unsigned order, 
        const std::vector<double> &rBreakpoints)
        : _order(order),
          _nbp(rBreakpoints.size()),
          _workspace(gsl_bspline_alloc(_order, _nbp), &gsl_bspline_free)
        {
            gsl_vector_const_view bp = gsl_vector_const_view_array(rBreakpoints.data(), rBreakpoints.size());
            gsl_bspline_knots(&bp.vector, _workspace.get());
        }

        BSpline_Fit(unsigned order, double dL, double dR, unsigned breakpoints)
        : _order(order),
          _nbp(breakpoints),
          _workspace(gsl_bspline_alloc(_order, breakpoints), &gsl_bspline_free)
        {
            gsl_bspline_knots_uniform(dL, dR, _workspace.get());
        }

        BSpline_Fit(const unsigned order, 
            const unsigned nbp,
            const std::shared_ptr<gsl_bspline_workspace> &rws,
            const std::vector<double> &rArg, 
            const std::vector<double> &rVal, 
            const std::vector< double > &rW = std::vector<double>())
        : _order(order),
          _nbp(nbp),
          _workspace(rws),
          _cov(gsl_matrix_alloc(_nbp + _order - 2, _nbp + _order - 2), &gsl_matrix_free),
          _c(gsl_vector_alloc(_nbp + _order - 2), &gsl_vector_free),
          _B(gsl_vector_alloc(_nbp + _order - 2), &gsl_vector_free)
        {
            PRECONDITION((rArg.size() == rVal.size()) && (rArg.size() == rW.size()));
            PRECONDITION(rArg.size() > 1);
            PRECONDITION(std::equal(rArg.begin()+1, rArg.end(), rArg.begin(), std::greater<double>()));
            PRECONDITION(rW.size()>0 ? rArg.size() == rW.size() : true);
            
            const size_t ncoeff = _nbp + _order - 2;
            std::unique_ptr<gsl_matrix, decltype(&gsl_matrix_free)> X
                (gsl_matrix_alloc(rArg.size(), ncoeff), &gsl_matrix_free);
            std::unique_ptr<gsl_vector, decltype(&gsl_vector_free)> y
                (gsl_vector_alloc(rArg.size()), &gsl_vector_free);


            bool weights = (rW.size() == rArg.size());
            double chol;

            for(int i = 0; i < rArg.size(); i++)
            {
                gsl_bspline_eval(rArg[i], _B.get(), _workspace.get());
                for(int j = 0; j < ncoeff; j++)
                {
                    double Bj = gsl_vector_get(_B.get(), j);
                    gsl_matrix_set(X.get(), i, j, Bj);
                }
                gsl_vector_set(y.get(), i, rVal[i]);
            }
            
            std::shared_ptr<gsl_multifit_linear_workspace> work(
                gsl_multifit_linear_alloc (rArg.size(), ncoeff), 
                &gsl_multifit_linear_free);

            if(weights)
            {
                std::unique_ptr<gsl_vector, decltype(&gsl_vector_free)> w(
                    gsl_vector_alloc(rW.size()), 
                    &gsl_vector_free);

                for(int i = 0; i < rW.size(); i++)
                    gsl_vector_set(w.get(), i, rW[i]);
                gsl_multifit_wlinear(X.get(), w.get(), y.get(), _c.get(), _cov.get(), &chol, work.get());
            }
            else
            {
                gsl_multifit_linear(X.get(), y.get(), _c.get(), _cov.get(), &chol, work.get());
            }
        }

        
        IFit *newObject(const std::vector< double > &rArg, const std::vector< double > &rVal) const
        {
            return new BSpline_Fit(_order, _nbp, _workspace, rArg, rVal);
        }
 
        IFit *newObject(const std::vector< double > &rArg, const std::vector< double > &rVal, const std::vector< double > &rW) const
        {
            return new BSpline_Fit(_order, _nbp, _workspace, rArg, rVal, rW);
        }

        Function fit() const
        {
            std::function<double(double)> uFit = [bsp = _B, C = _c, bsws = _workspace](double dX)
            {
                gsl_bspline_eval(dX, bsp.get(), bsws.get());
                gsl_blas_ddot(bsp.get(), C.get(), &dX);
                return dX;
            };
            return Function(uFit);
        }

        Function err() const
        {
            std::function<double(double)> err = [bsp = _B, bsws = _workspace, Cov = _cov, ncof = _nbp+_order](double dX)
            {
                //std::vector<double> vec(ncof-2);
                //gsl_vector_view vecView = gsl_vector_view_array(vec.data(), vec.size());
                //std::vector<double> vec2(vec);
                // gsl_vector_const_view vec2View = gsl_vector_const_view_array(vec2.data(), vec2.size());
                //gsl_blas_dsymv(CblasUpper, 1., Cov.get(), &vec2View.vector, 0., &vecView.vector);
                //gsl_blas_ddot(&vec2View.vector, &vecView.vector, &dX);
                
                gsl_bspline_eval(dX, bsp.get(), bsws.get());
                std::shared_ptr<gsl_vector> b(gsl_vector_alloc(ncof-2), &gsl_vector_free);
                gsl_vector_memcpy(b.get(), bsp.get());
                gsl_blas_dsymv(CblasUpper, 1., Cov.get(), b.get(), 0., bsp.get());
                gsl_blas_ddot(b.get(), bsp.get(), &dX);
                ASSERT(dX >= 0);
                return sqrt(dX);
            };
            return Function(err);
        }

    private:
        unsigned int _order, _nbp;
        std::shared_ptr<gsl_bspline_workspace> _workspace;
        std::shared_ptr<gsl_matrix> _cov;
        std::shared_ptr<gsl_vector> _c;
        std::shared_ptr<gsl_vector> _B;
};

cfl::Fit prb::NFit::bspline(unsigned iOrder, const std::vector<double> &rBreakpoints)
{
    return Fit(new BSpline_Fit(iOrder, rBreakpoints));
}

cfl::Fit prb::NFit::bspline(unsigned iOrder, double dL, double dR, unsigned iBreakpoints)
{
    return Fit( new BSpline_Fit(iOrder, dL, dR, iBreakpoints));
}