#include "prb/Data.hpp"
#include "cfl/Error.hpp"
#include <math.h>
#include "prb/Fit.hpp"
#include <cmath>

using namespace cfl;
using namespace prb;

bool check(const std::vector<double> &rTime, const std::vector<double> &rVal, double dInitialTime)
{
    bool res = ((rTime.size() == rVal.size()) && rTime.size() > 0);
    res = res && (rTime.front() > dInitialTime);
    res = res && (std::equal(rTime.begin() + 1, rTime.end(), rTime.begin(), std::greater<double>()));
    return res;
}

cfl::Function prb::NData::discountYieldInterp(const std::vector<double> &rTime, 
                                  const std::vector<double> &rDF, 
                                  double dInitialTime, 
                                  const cfl::Interp &rInterp)
{
    PRECONDITION(check(rTime, rDF, dInitialTime));
    std::vector<double> yields(rTime.size());
    std::transform(rTime.begin(), rTime.end(), rDF.begin(), yields.begin(), 
        [dInitialTime](double dT, double dF)
        { ASSERT(dT > dInitialTime + std::numeric_limits<double>::epsilon());
          return -log(dF)/(dT - dInitialTime); 
        });
    Function yieldInterp = rInterp.interpolate(rTime.begin(), rTime.end(), yields.begin());
    Function uDiff([dInitialTime](double dT){ return dT - dInitialTime;});
    return exp(-yieldInterp * uDiff);
}

cfl::Function
prb::NData::discountLogInterp(const std::vector<double> &rTime, 
                  const std::vector<double> &rDF,
                  double dInitialTime, 
                  const cfl::Interp &rInterp)
{
    PRECONDITION(check(rTime, rDF, dInitialTime));
    std::vector<double> ulog(rTime.size() + 1);
    std::vector<double> newTime(rTime.size() + 1);
    
    newTime.front() = dInitialTime;
    std::copy(rTime.begin(), rTime.end(), newTime.begin() + 1);
    ulog.front() = log(1);
    
    std::transform(rDF.begin(), rDF.end(), ulog.begin() + 1, [](double dF){return log(dF); });
    Function logInterp = rInterp.interpolate(newTime.begin(), newTime.end(), ulog.begin());
    
    return exp(logInterp);
}

cfl::Function
prb::NData::volatilityVarInterp(const std::vector<double> &rTime, 
                    const std::vector<double> &rVol,
                    double dInitialTime, 
                    const cfl::Interp &rInterp)
{
    PRECONDITION(check(rTime, rVol, dInitialTime));
    std::vector<double> uVol(rTime.size() + 1);
    std::vector<double> newTime(uVol.size());

    uVol.front() = 0;
    newTime.front() = dInitialTime;
    std::copy(rTime.begin(), rTime.end(), newTime.begin() + 1);

    std::transform(rTime.begin(), rTime.end(), rVol.begin(), uVol.begin() + 1, 
                  [dInitialTime](double dT, double nu){
                        return nu*nu*(dT - dInitialTime);
                  }
    );
    Function volInterp(rInterp.interpolate(newTime.begin(), newTime.end(), uVol.begin()));
    Function uDiff([dInitialTime](double dT){return dT - dInitialTime; });

    return sqrt(volInterp/uDiff);
}

cfl::Function
prb::NData::discountYieldFit(const std::vector<double> &rTime, 
                            const std::vector<double> &rDF,
                            double dInitialTime, 
                            cfl::Fit &rFit, 
                            cfl::Function &rErr)
{
    PRECONDITION(check(rTime, rDF, dInitialTime));
    std::vector<double> yields(rTime.size());
    std::transform(rTime.begin(), rTime.end(), rDF.begin(), yields.begin(), 
        [dInitialTime](double dT, double dF)
        { ASSERT(dT > dInitialTime + std::numeric_limits<double>::epsilon());
          return -log(dF)/(dT - dInitialTime); 
        });
    rFit.assign(rTime.begin(), rTime.end(), yields.begin());
    Function yieldFit = rFit.fit();
    Function uDiff([dInitialTime](double dT){ return dT - dInitialTime;});
    Function dT = exp(-yieldFit * uDiff);
    rErr = dT * rFit.err() * uDiff;
    return dT;
}

cfl::Function
prb::NData::discountLogFit(const std::vector<double> &rTime, 
                        const std::vector<double> &rDF,
                        double dInitialTime, 
                        cfl::Fit &rFit, 
                        cfl::Function &rErr)
{
    PRECONDITION(check(rTime, rDF, dInitialTime));
    std::vector<double> ulog(rTime.size() + 1);
    std::vector<double> newTime(rTime.size() + 1);
    
    newTime.front() = dInitialTime;
    std::copy(rTime.begin(), rTime.end(), newTime.begin() + 1);
    ulog.front() = log(1);
    
    std::transform(rDF.begin(), rDF.end(), ulog.begin() + 1, [](double dF){return log(dF); });
    rFit.assign(rTime.begin(), rTime.end(), ulog.begin()+1);
    Function logFit = rFit.fit();
    Function dT = exp(logFit);
    rErr = dT * rFit.err();
    return dT;
}

cfl::Function
prb::NData::discountNelsonSiegelFit(const std::vector<double> &rTime, 
                                   const std::vector<double> &rDF,
                                   double dLambda, 
                                   double dInitialTime, 
                                   cfl::Function &rErr)
{
    std::function<double(double)> rT1 = [dLambda](double dT){ return 1.;};
    std::function<double(double)> rT2 = [dLambda, dInitialTime](double dT){
        double diff = dLambda*(dT - dInitialTime);
        return ((1. - exp(-diff))/diff);
    };
    
    std::function<double(double)> rT3 = [dLambda, dInitialTime](double dT){
        double diff = dLambda*(dT - dInitialTime);
        return (((1. - exp(-diff))/diff) - exp(-diff));
    };

    std::vector<cfl::Function> basisF(3);
    basisF[0] = Function(rT1);
    basisF[1] = Function(rT2);
    basisF[2] = Function(rT3);

    cfl::Fit uFit = prb::NFit::linear(basisF);
    uFit.assign(rTime.begin(), rTime.end(), rDF.begin());
    return discountYieldFit(rTime, rDF, dInitialTime, uFit, rErr);
}

cfl::Function
prb::NData::discountSvensonFit(const std::vector<double> &rTime, 
                              const std::vector<double> &rDF,
                              double dLambda1, 
                              double dLambda2, 
                              double dInitialTime, 
                              cfl::Function &rErr)
{
    std::function<double(double)> rT1 = [dLambda1](double dT){ return 1.;};
    std::function<double(double)> rT2 = [dLambda1, dInitialTime](double dT){
        double diff = dLambda1*(dT - dInitialTime);
        return ((1. - exp(-diff))/diff);
    };
    
    std::function<double(double)> rT3 = [dLambda1, dInitialTime](double dT){
        double diff = dLambda1*(dT - dInitialTime);
        return (((1. - exp(-diff))/diff) - exp(-diff));
    };

    std::function<double(double)> rT4 = [dLambda2, dInitialTime](double dT){
        double diff = dLambda2*(dT - dInitialTime);
        return (((1. - exp(-diff))/diff) - exp(-diff));
    };

    std::vector<cfl::Function> basisF(4);
    basisF[0] = Function(rT1);
    basisF[1] = Function(rT2);
    basisF[2] = Function(rT3);
    basisF[3] = Function(rT4);

    cfl::Fit uFit = prb::NFit::linear(basisF);
    uFit.assign(rTime.begin(), rTime.end(), rDF.begin());
    return discountYieldFit(rTime, rDF, dInitialTime, uFit, rErr);
}

cfl::Function
prb::NData::volatilityBlackFit(const std::vector<double> &rTime, 
                              const std::vector<double> &rVol,
                              double dLambda, 
                              double dInitialTime, 
                              cfl::Function &rErr)
{
    PRECONDITION(check(rTime, rVol, dInitialTime));

    std::function<double(double)> volF = [dLambda, dInitialTime](double dT){
        double diff = dLambda*(dT - dInitialTime);
        return sqrt((1. - exp(-2*diff))/diff);
        };
    std::vector<cfl::Function> basisF(1);
    basisF[0] = cfl::Function(volF);
    
    cfl::Fit uFit = prb::NFit::linear(basisF);
    uFit.assign(rTime.begin(), rTime.end(), rVol.begin());
    rErr = uFit.err();
    return uFit.fit();
}