#include "prb/Ind.hpp"
#include <iostream>

class NaiveInd : public cfl::IInd
{
    public:
        void indicator(std::valarray<double> &rValues, double dBarrier) const
        {
            for(auto i = 0; i < rValues.size(); i++)
            {
                if(rValues[i] >= dBarrier)
                    rValues[i] = 1.;
                else
                    rValues[i] = 0;
            }
        }
};

class LinearInd : public cfl::IInd
{
    public: 
        void indicator(std::valarray<double> &rValues, double dBarrier) const
        {
            size_t N(rValues.size());
            std::valarray<double> u(N);
            u = rValues - dBarrier;
            std::valarray<double> a(N+1);
            a[0] = u[0] >=0 ? 1 : 0;
            a[N] = u[N-1] >=0 ? 1 : 0;
            for(auto i = 1; i < N; i++)
            {
                if(u[i-1] != u[i])
                    a[i] = (std::max(u[i-1], 0.) - std::max(u[i], 0.))/(u[i-1] - u[i]);
                else
                    a[i] = 1;
            }
            for(auto i=0; i < N; i++)
            {
                rValues[i] = 0.5*(a[i] + a[i+1]) + 0.;
            }
        }

};

class QuadraticInd : public cfl::IInd
{
    public: 
        void indicator(std::valarray<double> &rValues, double dBarrier) const
        {
            size_t N(rValues.size());
            std::valarray<double> u(N);
            u = rValues - dBarrier;
            std::valarray<double> a(N), b(N);
            a[0] = u[0] >=0 ? 1 : 0;
            b[N-1] = u[N-1] >=0 ? 1 : 0;
            for(auto i = 1; i < N; i++)
            {
                if(u[i-1] < 0 && u[i] >= 0)
                {
                    a[i] = 1 - pow(u[i-1]/(u[i-1] - u[i]), 2);
                    b[i-1] = pow(u[i]/(u[i] - u[i-1]), 2);
                }
                else if(u[i-1] >= 0 && u[i] < 0)
                {
                    a[i] = pow(u[i-1]/(u[i-1] - u[i]), 2);
                    b[i-1] = 1 - pow(u[i]/(u[i] - u[i-1]), 2);
                }
                else if(u[i-1] >=0 && u[i] >= 0)
                {
                    a[i] = 1;
                    b[i-1] = 1;
                }
                else
                {
                    a[i] = 0;
                    b[i-1] = 0;
                }
                
            }
            for(auto i=0; i < N; i++)
            {
                rValues[i] = 0.5*(a[i] + b[i]) + 0.;
            }
        }

};

cfl::Ind 
prb::NInd::naive()
{
    return cfl::Ind(new NaiveInd());
}

cfl::Ind 
prb::NInd::linear()
{
    return cfl::Ind(new LinearInd());
}

cfl::Ind 
prb::NInd::quadratic()
{
    return cfl::Ind(new QuadraticInd());
}