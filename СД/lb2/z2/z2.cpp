#include <iostream>

using namespace std;


//���������� ��������� ���� :
struct Date {
    int year;
    int month;
    int day;
};

//���������� ��������� �������, ���������� ��������� ���� :
struct Worker {
    char firstname[30];
    char secondname[30];
    char post[30];
    int salary;
    Date Birthday;
};



//������� ������ ��������� Worker :

void PrintInformation(Worker wrk)
{
    cout << wrk.firstname << " ";
    cout << wrk.secondname << " ";
    cout << wrk.post << " ";
    cout << wrk.salary << " ";
    cout << wrk.Birthday.day << ".";
    cout << wrk.Birthday.month << ".";
    cout << wrk.Birthday.year << endl;
}

int main()
{
    setlocale(LC_CTYPE, "Russian");



    cout << "������ ��������� ���� : " << sizeof(Date) << endl;


    //������������� ������� ��������� �������:

    Worker student1{ "���", "�������", "���������", 2000, {2003, 8, 10} };

    // �����:
    PrintInformation(student1);
}