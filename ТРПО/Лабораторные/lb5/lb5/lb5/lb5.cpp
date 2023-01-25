#include <iostream>
using namespace std;
unsigned char cif;
int main()

{
  setlocale(LC_CTYPE, "Russian");
  
  int k;
  puts("Выберите что хотите узнать: 1-отличие кода прписной и строчной буквы латинского алфавита в Windows-1251. 2-отличие кода прописной и строчной буквы русского алфавита в Windows-1251. 3- определить код символа, соответствующий цифре.");
  cin >> k;
  switch (k)
  {
  case 1: puts("Код прописной латинской буквы отличается от кода строчной буквы на 20 пунктов"); break;
  case 2: puts("Код прописной русской буквы отличается от кода строчной буквы на 20 пунктов"); break;
  case 3: puts("Введите цифру от 0 до 9");
    cin >> cif;
    if (cif >= '0' && cif <= '9') {
      printf("Код цифры %c = %x", cif, cif);
    } break;
  default: puts("Нет такого варианта"); break;
  }
  return 0;
}