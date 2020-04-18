#include "prb/Fit.hpp"
#include "cfl/Error.hpp"
#include <gsl/gsl_multifit.h>
#include <gsl/gsl_blas.h>

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
            
            gsl_multifit_linear_workspace *work = gsl_multifit_linear_alloc (rArg.size(), _basisF.size());

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