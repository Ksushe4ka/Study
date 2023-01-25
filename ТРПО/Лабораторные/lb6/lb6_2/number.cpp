#include "Header.h"

void number() {
    char cif;
    puts("Введите цифру от 0 до 9");
    std::cin >> cif;
    if (cif >= '0' && cif <= '9') {
        printf("Код цифры %c = %x \n\n", cif, cif);
    }
}