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
    double n = p * q; //модуль
    double track;
    double eiler = (p - 1) * (q - 1);
   
    double e = 7;

    //проверка того, что 1 < e < фун.эйлера и e и фун.эйлера взаимно просты.
    while (e < eiler) {
        track = Proverka(e, eiler);
        if (track == 1)
            break;
        else
            e++;
    }
 
    //d  должен удовлетворять  d * e = 1 mod фун.эйлера
    double d1 = 1 / e;
    double d = fmod(d1, eiler);
    double M = 9;

    double c = pow(M, e); 
    c = fmod(c, n);

    double m = pow(c, d); 
    m = fmod(m, n);

    cout << "Оригинальное сообщение = " << M << '\n';
    cout << " " << "p = " << p << '\n';
    cout << "" << "q = " << q << '\n';
    cout << "" << "n = pq = " << n << '\n';
    cout << "" << "Функция Эйлера = " << eiler << '\n';
    cout << "" << "открытый ключ = " << e <<" & " << n << '\n';
    cout << "" << "закрытый ключ = " << d << " & " << n << '\n';
    cout << "" << "Засекреченное = " << c << '\n';
    cout << "" << "Рассекреченное = " << m;
    return 0;
}