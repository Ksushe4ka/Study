#include <iostream>

using namespace std;


//Объявление структуры Дата :
struct Date {
    int year;
    int month;
    int day;
};

//Объявление структуры Персона, содержащей структуру Дата :
struct Worker {
    char firstname[30];
    char secondname[30];
    char post[30];
    int salary;
    Date Birthday;
};



//Функция вывода структуры Worker :

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



    cout << "Размер структуры Дата : " << sizeof(Date) << endl;


    //Инициализация объекта структуры Персона:

    Worker student1{ "Имя", "Фамилия", "Должность", 2000, {2003, 8, 10} };

    // Вывод:
    PrintInformation(student1);
}