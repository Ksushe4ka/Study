#include <iostream>

int getSum(int x, int y) {
    return x + y;
}
int getMul(int x, int y) {
    return x * y;
}

using namespace std;

int main(int argc, char* arvg[])
{
    int parm1 = 4;
    for (int i = 0; i < 5; i++) {
        parm1 += 1;
        int parm2 = parm1 + 1;
        int result_getSum = getSum(parm1, parm2);
        cout << "i= " << i;
        cout << "getSum (" << parm1 << "," << parm2 << ") = " << result_getSum << endl;
    }
    int result_getMul = getMul(2, 3);
    cout << result_getMul << endl;


    return 0;

}