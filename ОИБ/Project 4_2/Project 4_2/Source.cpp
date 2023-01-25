#include<iostream>
#include<math.h>
using namespace std;

int Proverka(int a, int b) {
    int t;
    while (1) {
        t = a % b;
        if (t == 0)
            return b;
        a = b;
        b = t;
    }
}
int main() {
    setlocale(LC_ALL, "RU");

    double p = 13;
    double q = 11;
    double n = p * q; //������
    double track;
    double eiler = (p - 1) * (q - 1);
   
    double e = 7;

    //�������� ����, ��� 1 < e < ���.������ � e � ���.������ ������� ������.
    while (e < eiler) {
        track = Proverka(e, eiler);
        if (track == 1)
            break;
        else
            e++;
    }
 
    //d  ������ �������������  d * e = 1 mod ���.������
    double d1 = 1 / e;
    double d = fmod(d1, eiler);
    double M = 9;

    double c = pow(M, e); 
    c = fmod(c, n);

    double m = pow(c, d); 
    m = fmod(m, n);

    cout << "������������ ��������� = " << M << '\n';
    cout << " " << "p = " << p << '\n';
    cout << "" << "q = " << q << '\n';
    cout << "" << "n = pq = " << n << '\n';
    cout << "" << "������� ������ = " << eiler << '\n';
    cout << "" << "�������� ���� = " << e <<" & " << n << '\n';
    cout << "" << "�������� ���� = " << d << " & " << n << '\n';
    cout << "" << "������������� = " << c << '\n';
    cout << "" << "�������������� = " << m;
    return 0;
}