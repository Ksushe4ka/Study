#include "Header.h"

void rus() {
    char symb_1, symb_2;
    std::cout << "������� ����� �������� �������� � �������� ��� ��������� ����: ";
    std::cin >> symb_1 >> symb_2;
    while (int(symb_1) > int('�') || int(symb_1) < int('�') || int(symb_2) > int('�') || int(symb_2) < int('�')) {
        std::cout << "������� ����� �������� �������� � �������� ��� ��������� ����: ";
        std::cin >> symb_1 >> symb_2;
    }
    std::cout << "������� ����� = " << symb_1 - symb_2;
}