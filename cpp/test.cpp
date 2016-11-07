#include "test.hpp"


int TestClass::hello()
{
    return 3;
}

void TestClass::process()
{
    int mean = 0;
    for(int i = 0 ; i < 1000 ; i++)
    {
        mean += i;
        this->list[i] = i;
    }

    mean /= 1000;

    this->list[0] = mean;
}