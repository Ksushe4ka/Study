#include "Header.h"

void number() {
    char cif;
    puts("������� ����� �� 0 �� 9");
    std::cin >> cif;
    if (cif >= '0' && cif <= '9') {
        printf("��� ����� %c = %x \n\n", cif, cif);
    }
}