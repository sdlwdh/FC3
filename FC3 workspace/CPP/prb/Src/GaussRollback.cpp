#include "prb/GaussRollback.hpp"
#include <gsl/gsl_linalg.h>
#include <vector>
#include <iostream>

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
            _M = ceil(_var/(2. * _h*_h *_p));
            _q = std::min((_var/(2. * (_h)*(_h) * _M)), _p);
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

            std::vector<double> diag(_N, 1.+2*_q);
            diag[0] = 1;
            diag[_N-1] = 1;
            gsl_vector_const_view diagView = gsl_vector_const_view_array(&diag.front(), diag.size());

            std::vector<double> e(_N-1, -_q);
            e[0] = 0;
            gsl_vector_const_view eView = gsl_vector_const_view_array(&e.front(), e.size());
            std::vector<double> f(_N-1, -_q);
            f[_N-2] = 0;
            gsl_vector_const_view fView = gsl_vector_const_view_array(&f.front(), f.size());

            std::unique_ptr<gsl_vector, decltype(&gsl_vector_free)> X(gsl_vector_alloc(_N), &gsl_vector_free);
            for(auto m = 0; m < _M; m++)
            {
                gsl_vector_const_view b = gsl_vector_const_view_array(std::begin(rValues), rValues.size());
                gsl_linalg_solve_tridiag(&diagView.vector, &eView.vector, &fView.vector, &b.vector, X.get());  
                gsl_vector_set(X.get(), 0, rValues[0]);
                gsl_vector_set(X.get(), _N-1, rValues[_N-1]);

                for(auto i = 0; i < _N; i++)
                {
                    rValues[i] = gsl_vector_get(X.get(), i);
                }
            }
        }

    private:
        double _p, _q;
        unsigned int _N, _M;
};

class CrankNicolson : public cfl::IGaussRollback
{
    public:
        CrankNicolson(double dR, unsigned iSize = 0., double dH = 0., double dVar = 0.)
        : _r(dR),
          _N(iSize)
        {
            PRECONDITION(0 < _r);
            _M = ceil(dVar/(dH *_r));
            _q = dVar/(2. * dH*dH * _M);
        }
    
        IGaussRollback* newObject (unsigned iSize, double dH, double dVar) const
        {
            return new CrankNicolson(_r, iSize, dH, dVar);
        }

        void rollback(std::valarray<double> &rValues) const
        {
            PRECONDITION(rValues.size() == _N);
            std::valarray<double> _vals(_N);   

            std::vector<double> diag(_N, 1.+_q);
            diag[0] = 1;
            diag[_N-1] = 1;
            gsl_vector_const_view diagView = gsl_vector_const_view_array(&diag.front(), diag.size());

            std::vector<double> e(_N-1, -_q/2);
            e[0] = 0;
            gsl_vector_const_view eView = gsl_vector_const_view_array(&e.front(), e.size());
            std::vector<double> f(_N-1, -_q/2);
            f[_N-2] = 0;
            gsl_vector_const_view fView = gsl_vector_const_view_array(&f.front(), f.size());

            std::unique_ptr<gsl_vector, decltype(&gsl_vector_free)> X(gsl_vector_alloc(_N), &gsl_vector_free);

            for(auto m = 0; m < _M; m++)
            {
                 _vals[0] = rValues[0] - 2*rValues[1] + rValues[2];
                for(int n = 1; n < _N-1; n++)
                {
                    _vals[n] = rValues[n-1] -2*rValues[n] + rValues[n+1];
                }
                _vals[_N-1] = _vals[_N-2];
                rValues = rValues + (_q/2)*_vals;
                
                gsl_vector_const_view b = gsl_vector_const_view_array(std::begin(rValues), rValues.size());
                gsl_linalg_solve_tridiag(&diagView.vector, &eView.vector, &fView.vector, &b.vector, X.get());  
                gsl_vector_set(X.get(), 0, rValues[0]);
                gsl_vector_set(X.get(), _N-1, rValues[_N-1]);

                for(auto i = 0; i < _N; i++)
                {
                    rValues[i] = gsl_vector_get(X.get(), i);
                }
            }
        }

    private:
        double _r, _q;
        unsigned int _N, _M;
};

class ChainGaussRollback : public cfl::IGaussRollback
{
    public:
        ChainGaussRollback(const cfl::GaussRollback &rFast,
			    unsigned iExplSteps,
                double dExplP,
			    unsigned iImplSteps,
                double dImplP,
                double dH=0.,
                double dVar=0.)
            : _fast(rFast),
              _Nexp(iExplSteps),
              _Nimp(iImplSteps),
              _pExp(dExplP),
              _pImp(dImplP),
              _h(dH),
              _var(dVar)
        {
            _Texp = 2.*dH*dH*_pExp*_Nexp;
            _Timp = 2.*dH*dH*_pImp*_Nimp;
        }

         IGaussRollback* newObject (unsigned iSize, double dH, double dVar) const
        {
            return new ChainGaussRollback(_fast, _Nexp, _pExp, _Nimp, _pImp, dH, dVar);
        }

        void rollback(std::valarray<double> &rValues) const
        {
            if(_var <= _Timp + _Texp)
            {
                cfl::GaussRollback exp(prb::NGaussRollback::explic(_pExp));
                exp.assign(rValues.size(), _h, _var);
                exp.rollback(rValues);
            }
            else
            {
                cfl::GaussRollback exp(prb::NGaussRollback::explic(_pExp));
                exp.assign(rValues.size(), _h, _Texp);
                exp.rollback(rValues);

                cfl::GaussRollback crank_nicol(_fast);
                crank_nicol.assign(rValues.size(), _h, _var - _Texp - _Timp);
                crank_nicol.rollback(rValues);

                cfl::GaussRollback imp(prb::NGaussRollback::implicit(_pImp));
                imp.assign(rValues.size(), _h, _Timp);
                imp.rollback(rValues);
            }
            
        }
    
    private:
        cfl::GaussRollback _fast;
        unsigned int _Nexp, _Nimp;
        double _pExp, _pImp, _Texp, _Timp, _h, _var;

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

cfl::GaussRollback 
prb::NGaussRollback::crankNicolson(double dR)
{
    return cfl::GaussRollback(new CrankNicolson(dR));
}

cfl::GaussRollback 
prb::NGaussRollback::chain(const cfl::GaussRollback &rFast,
			    unsigned iExplSteps,
                double dExplP,
			    unsigned iImplSteps,
                double dImplP)
{
    return cfl::GaussRollback(new ChainGaussRollback(rFast, iExplSteps, dExplP, iImplSteps, dImplP));
}
