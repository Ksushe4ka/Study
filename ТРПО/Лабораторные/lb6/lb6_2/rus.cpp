#include "Header.h"

void rus() {
    char symb_1, symb_2;
    std::cout << "Введите букву русского алфавита в строчном или прописном виде: ";
    std::cin >> symb_1 >> symb_2;
    while (int(symb_1) > int('я') || int(symb_1) < int('а') || int(symb_2) > int('Я') || int(symb_2) < int('А')) {
        std::cout << "Введите букву русского алфавита в строчном или прописном виде: ";
        std::cin >> symb_1 >> symb_2;
    }
    std::cout << "Разница равна = " << symb_1 - symb_2;
}