#include <iostream>

using namespace std;

union NewUnion {
	short int a;
	int b;
	double c;
};

int main()
{
	setlocale(LC_ALL, "rus");
	NewUnion un; // определение объекта объединения

	un.a = 5; // занимает 2 бита
	cout << "a = " << un.a << endl;

	un.b = 15412241; // занимает 4 бита
	cout << "b = " << un.b << endl;

	cout << "a = " << un.a << " - мусор" << endl;
	
	un.c = 141.14; // занимает 8 битов
	cout << "c = " << un.c << endl;
}
