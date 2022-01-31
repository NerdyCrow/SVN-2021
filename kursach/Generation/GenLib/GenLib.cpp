#include <iostream>

extern "C"
{
	int __stdcall llength(char* buffer, char* str)
	{
		if (str == nullptr)
			return 0;
		int len = 0;
		for (int i = 0; i < 256; i++)
			if (str[i] == '\0')
			{
				len = i; break;
			}
		return len;
	}



	int __stdcall todigit(char* buffer, char* str)
	{
		/*int n = 0;
		while (*ptr >= '0' && *ptr <= '9') {
			n *= 10;
			n += *ptr++;
			n -= '0';
		}
		return n;*/
		int temp = 0; // число
		int i = 0;
		int sign = 0; // знак числа 0- положительное, 1 — отрицательное
		if (str[i] == '-')
		{
			sign = 1;
			i++;
		}
		while (str[i] >= 0x30 && str[i] <= 0x39)
		{
			temp = temp + (str[i] & 0x0F);
			temp = temp * 10;
			i++;
		}
		temp = temp / 10;
		if (sign == 1)
			temp = -temp;
		return(temp);

	}



	char* __stdcall concat(char* buffer, char* str1, char* str2)
	{
		int i = NULL, len1 = NULL, len2 = NULL;
		for (int j = 0; str1[j] != '\0'; j++)
		{
			if (i == 255)
				break;
			buffer[i++] = str1[j];
		}
		for (int j = 0; str2[j] != '\0'; j++)
		{
			if (i == 255)
				break;
			buffer[i++] = str2[j];
		}
		buffer[i] = '\0';
		return buffer;
	}

	int __stdcall outdig(int value)
	{
		std::cout << value;
		return 0;
	}

	int __stdcall outline(char* ptr)
	{
		setlocale(LC_ALL, "rus");
		if (ptr == nullptr)
		{
			std::cout << std::endl;
		}
		for (int i = 0; ptr[i] != '\0'; i++)
			std::cout << ptr[i];
		return 0;
	}
}
