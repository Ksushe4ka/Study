#include <iostream>

using namespace std;

enum Colors {RED, GREEN, BLUE};

int main()
{
    setlocale(LC_ALL, "rus");
    Colors car = RED;
    if (car == RED)
        cout << "Машина красного цвета" << endl;
    else
        cout << "Машина зеленая или синяя" << endl;
}