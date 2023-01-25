#include <iostream>

using namespace std;

struct Employee
{
    short id;
    int age;
    double salary;
};

void printInformation(Employee employee)
{
    cout << "ID: " << employee.id << "\n";
    cout << "Age: " << employee.age << "\n";
    cout << "Salary: " << employee.salary << "\n";
}

int main()
{
    setlocale(LC_ALL, "rus");
    Employee john = { 5, 27, 45000.0 };
    Employee james = { 6, 29 }; //  james.salary = 0.0 (инициализация по умолчанию)  

    printInformation(john);
    cout << "\n";
    printInformation(james);
}