#include <stdio.h>
#include "NumClass.h"
int reversRec(int, int);
int newone(int, int, int);
long powe(long base, long po)
{
    if (po == 0)
    {
        return true;
    }

    else
    {
        return base * powe(base, po - 1);
    }
}

int digNum(long num)
{
    if (num == 0)
    {
        return false;
    }
    return 1 + digNum(num / 10);
}

int getSumDig(int n, long power)
{
    if (n == 0)
    {
        return false;
    }
    return (powe(n % 10, power) + getSumDig(n / 10, power));
}

int isArmstrong(int x)
{
    long powe = digNum(x);
    int sum = getSumDig(x, powe);

    if (x == sum)
    {
        return true;
    }
    return false;
}

int reversRec(int num, int rev)
{
    if (num == 0)
    {
        return rev;
    }
    rev = (rev * 10) + (num % 10);
    return reversRec(num / 10, rev); // The recursion call
    return false;
}


int isPalindrome(int number)
{
    int num = reversRec(number, 0);
    if (number == num)
    {
        return true;
    }
    return false;
}

