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
    cout << "Выберите что хотите узнать: \n1-отличие кода прписной и строчной буквы латинского алфавита в Windows-1251. \n2-отличие кода прописной и строчной буквы русского алфавита в Windows-1251. \n3- определить код символа, соответствующий цифре." << endl << endl;
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

    default: puts("Нет такого варианта");
        break;
    }

    } while (k < 4);
    return 0;
}

