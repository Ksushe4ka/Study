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
	NewUnion un; // ����������� ������� �����������

	un.a = 5; // �������� 2 ����
	cout << "a = " << un.a << endl;

	un.b = 15412241; // �������� 4 ����
	cout << "b = " << un.b << endl;

	cout << "a = " << un.a << " - �����" << endl;
	
	un.c = 141.14; // �������� 8 �����
	cout << "c = " << un.c << endl;
}
