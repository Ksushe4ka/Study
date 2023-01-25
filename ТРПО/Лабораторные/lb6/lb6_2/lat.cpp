#include "Header.h"

void lat() {
   
    char symbol_1, symbol_2;
    std::cout << "Введите букву латинского алфавита в строчном и прописном виде: ";
    std::cin >> symbol_1 >> symbol_2;
    while (int(symbol_1) < int('a') || int(symbol_1) > int('z') || int(symbol_2) < int('A') || int(symbol_2) > ('Z')) {
        std::cout << "Введите букву латинского алфавита в строчном и прописном виде: ";
        std::cin >> symbol_1 >> symbol_2;
    }
    std::cout<< "Разница равна = " << symbol_1 - symbol_2;
}