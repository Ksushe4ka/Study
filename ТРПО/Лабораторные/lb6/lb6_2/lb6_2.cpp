#include <iostream>
#include <Windows.h>
#include "Header.h"
using namespace std;

int main() {
    setlocale(LC_ALL, "ru");
    SetConsoleOutputCP(1251);
    SetConsoleCP(1251);

    int k;
    do {
    cout << "�������� ��� ������ ������: \n1-������� ���� �������� � �������� ����� ���������� �������� � Windows-1251. \n2-������� ���� ��������� � �������� ����� �������� �������� � Windows-1251. \n3- ���������� ��� �������, ��������������� �����." << endl << endl;
    cin >> k;

    switch (k) {
        
    case 1: 
        lat();
        cout << endl << endl;
        break;

    case 2: 
        rus();
        cout << endl << endl;
        break;

    case 3: 
        number();
        break;

    default: puts("��� ������ ��������");
        break;
    }

    } while (k < 4);
    return 0;
}

