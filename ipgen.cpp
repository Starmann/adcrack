#include <iostream>

int main()
{
	unsigned short int i = 0, j = 0;
	for (i=0;i<256;i++)
	{
		for(j=0;j<256;j++)
		{
			std::cout << "192.168." << i << '.' << j << '\n';
		}
	}
return 0;
}
