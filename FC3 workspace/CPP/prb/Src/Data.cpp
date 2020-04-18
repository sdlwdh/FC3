#include "prb/Data.hpp"
#include "cfl/Error.hpp"
#include <math.h>

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
                                