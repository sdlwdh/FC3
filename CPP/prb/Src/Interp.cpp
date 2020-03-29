#include "prb/Interp.hpp"
#include "cfl/Error.hpp"
#include <gsl/gsl_spline.h>

using namespace cfl;
using namespace prb;

class Linear_Interp_Function : public IFunction 
{
  public:
    Linear_Interp_Function(const std::vector<double> &rArg, 
                          const std::vector<double> &rVal)
    : m_uSpline(gsl_spline_alloc(gsl_interp_linear, rArg.size()), &gsl_spline_free),
    m_uAcc(gsl_interp_accel_alloc(), &gsl_interp_accel_free)
    {
      PRECONDITION(rArg.size() == rVal.size());
      PRECONDITION(rArg.size() > 1);
      PRECONDITION(std::equal(rArg.begin()+1, rArg.end(), rArg.begin(), std::greater<double>()));

      gsl_spline_init(m_uSpline.get(), rArg.data(), rVal.data(), rArg.size());
      m_dLeft = rArg.front();
      m_dRight = rArg.back();

      POSTCONDITION(m_dLeft < m_dRight);
    }

    double operator()(double dX) const
    {
      bool bBelongs = belongs(dX);
      PRECONDITION(bBelongs);
      if(!bBelongs)
      {
        throw(NError::range("interpolation"));
      }
      return gsl_spline_eval(m_uSpline.get(), dX, m_uAcc.get());
    }

    bool belongs( double dX) const
    {
      return (dX >= m_dLeft && dX <= m_dRight);
    }
  
  private:
    std::unique_ptr<gsl_spline, decltype(&gsl_spline_free)> m_uSpline;
    std::unique_ptr<gsl_interp_accel, decltype(&gsl_interp_accel_free)> m_uAcc;
    double m_dLeft, m_dRight;
};

class Linear_Interp : public IInterp
{
  public:
    Function interpolate(const std::vector<double> &rArg, const std::vector<double> &rVal) const
    {
      return Function(new Linear_Interp_Function(rArg, rVal));
    }
};

cfl::Interp prb::NInterp::linear()
{
  return Interp(new Linear_Interp());
}

class Cspline_Interp_Function : public IFunction
{
  public:
    Cspline_Interp_Function(const std::vector<double> &rArg, const std::vector<double> &rVal)
    : m_uSpline(gsl_spline_alloc(gsl_interp_cspline, rArg.size()), &gsl_spline_free),
      m_uAcc(gsl_interp_accel_alloc(), &gsl_interp_accel_free)
    {
      PRECONDITION(rArg.size() == rVal.size());
      PRECONDITION(rArg.size() > 1);
      PRECONDITION(std::equal(rArg.begin()+1, rArg.end(), rArg.begin(), std::greater<double>()));

      gsl_spline_init(m_uSpline.get(), rArg.data(), rVal.data(), rArg.size());
      m_dLeft = rArg.front();
      m_dRight = rArg.back();

      POSTCONDITION(m_dLeft < m_dRight);
    } 

    double operator()(double dX) const
    {
      bool bBelongs = belongs(dX);
      PRECONDITION(bBelongs);
      if (!bBelongs)
      {
        throw(NError::range("interpolation"));
      }
      return gsl_spline_eval(m_uSpline.get(), dX, m_uAcc.get());
    } 

    bool belongs(double dX) const
    {
      return (dX >= m_dLeft) && (dX <= m_dRight);
    }

  private:
    std::unique_ptr<gsl_spline, decltype(&gsl_spline_free)> m_uSpline;
    std::unique_ptr<gsl_interp_accel, decltype(&gsl_interp_accel_free)> m_uAcc;
    double m_dLeft, m_dRight;
};

class Cspline_Interp : public IInterp
{
  Function interpolate(const std::vector<double> &rArg, const std::vector<double> &rVal) const
  {
    return Function(new Cspline_Interp_Function(rArg, rVal));
  }
};

cfl::Interp prb::NInterp::cspline()
{
  return Interp(new Cspline_Interp());
}