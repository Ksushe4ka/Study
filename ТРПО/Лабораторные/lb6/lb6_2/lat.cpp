#include "Header.h"

void lat() {
   
    char symbol_1, symbol_2;
    std::cout << "������� ����� ���������� �������� � �������� � ��������� ����: ";
    std::cin >> symbol_1 >> symbol_2;
    while (int(symbol_1) < int('a') || int(symbol_1) > int('z') || int(symbol_2) < int('A') || int(symbol_2) > ('Z')) {
        std::cout << "������� ����� ���������� �������� � �������� � ��������� ����: ";
        std::cin >> symbol_1 >> symbol_2;
    }
    std::cout<< "������� ����� = " << symbol_1 - symbol_2;
}