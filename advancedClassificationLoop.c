// #include <stdio.h>
// #include "NumClass.h"

// long power(long, long);
// int powerforamstrong(int);

// int powerforamstrong(int p)
// {
// 	int x = p;
// 	int count = 0;
// 	while (x != 0)
// 	{
// 		x = x / 10;
// 		count++;
// 	}
// 	return count;
// }

// long power(long base, long power)
// {
// 	int sum = 1;
// 	for (int i = 1; i <= power; i++)
// 	{
// 		sum = base * sum;
// 	}

// 	return sum;
// }

// int isArmstrong(int p)
// {
// 	int x = p;
// 	int currentdigit = 0;
// 	int sum = 0;
// 	int powero = powerforamstrong(p);
// 	while (x != 0)
// 	{
// 		currentdigit = x % 10;
// 		sum = sum + power(currentdigit, powero);
// 		x = x / 10;
// 	}
// 	if (sum == p)
// 	{
// 		return true;
// 	}
// 	return false;
// }

// int isPalindrome(int x)
// {
// 	int duplicateX = 0;
// 	int sameasx = x;

// 	int remainder = 0;
// 	while (sameasx != 0)
// 	{
// 		remainder = sameasx % 10;
// 		duplicateX = duplicateX * 10 + remainder;
// 		sameasx = sameasx / 10;
// 	}
// 	if (x == duplicateX)
// 	{
// 		return true;
// 	}
// 	return false;
// }


#include "NumClass.h"
#include <stdio.h>



/**
 * A strong number is the factorial sum of its digits, equal to the number itself.
 * 
*/
int isArmstrong(int numInt){
    int  orginalnum = numInt;
    int remainder;
    int pow = 0;     

    int result = 0;

    for ( int i = 0; orginalnum!=0 ; i++)
    {
        orginalnum /= 10;
        pow += 1;
    }
    
    int temp;
    for(orginalnum = numInt; orginalnum!=0; orginalnum/=10)
    {

        remainder = orginalnum%10;    
        temp = remainder;
       
        for (int i = 1; i < pow; i++)
        {
            remainder *= temp;
        }
        
        result += remainder;

    }

    if(result == numInt){
        return 1;
    }


    
    return 0;
}



/**
 * Strong number is a special number whose sum of the factorial of digits is equal to the original number. 
 * For Example: 145 is strong number. Since, 1! + 4! + 5! = 145. 
 * @return 1 if numInt is strong number.
*/
int isPalindrome(int numInt){
    int remainder;
    int sum = 0;
    int numberOrginal = numInt;
    while(numInt>0)    
    {    
        remainder = numInt %10;    
        sum = (sum*10) + remainder;    
        numInt = numInt/10;    
    }     
  
    if(numberOrginal==sum)
    {
          
        return 1;
    }  
 
     
    
    return 0;
}