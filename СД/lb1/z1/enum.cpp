#include <iostream>

using namespace std;

enum Colors {RED, GREEN, BLUE};

int main()
{
    setlocale(LC_ALL, "rus");
    Colors car = RED;
    if (car == RED)
        cout << "������ �������� �����" << endl;
    else
        cout << "������ ������� ��� �����" << endl;
}