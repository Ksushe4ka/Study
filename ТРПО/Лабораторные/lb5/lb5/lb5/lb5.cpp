#include <iostream>
using namespace std;
unsigned char cif;
int main()

{
  setlocale(LC_CTYPE, "Russian");
  
  int k;
  puts("�������� ��� ������ ������: 1-������� ���� �������� � �������� ����� ���������� �������� � Windows-1251. 2-������� ���� ��������� � �������� ����� �������� �������� � Windows-1251. 3- ���������� ��� �������, ��������������� �����.");
  cin >> k;
  switch (k)
  {
  case 1: puts("��� ��������� ��������� ����� ���������� �� ���� �������� ����� �� 20 �������"); break;
  case 2: puts("��� ��������� ������� ����� ���������� �� ���� �������� ����� �� 20 �������"); break;
  case 3: puts("������� ����� �� 0 �� 9");
    cin >> cif;
    if (cif >= '0' && cif <= '9') {
      printf("��� ����� %c = %x", cif, cif);
    } break;
  default: puts("��� ������ ��������"); break;
  }
  return 0;
}