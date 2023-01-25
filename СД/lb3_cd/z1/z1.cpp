#include <iostream>
#include <string.h>
#include <fstream>
#include <string.h>
#include <string>
#include <windows.h>

using namespace std;

template <typename T>
class List
{
public:
	List();
	~List();

	//удаление первого элемента в списке
	void pop_front();

	//добавление элемента в конец списка
	void push_back(T data);

	// очистить список
	void clear();

	// получить количество елементов в списке
	int GetSize() { return Size; }

	// перегруженный оператор [] 
	T& operator[](const int index);

	//добавление элемента в начало списка
	void push_front(T data);

	//добавление элемента в список по указанному индексу
	void insert(T data, int index);

	//удаление элемента в списке по указанному индексу
	void removeAt(int index);

	//удаление последнего элемента в списке
	void pop_back();

private:

	template<typename T>
	class Node
	{
	public:
		Node* pNext;
		T data;

		Node(T data = T(), Node* pNext = nullptr)
		{
			this->data = data;
			this->pNext = pNext;
		}
	};
	int Size;
	Node<T>* head;
};

template<typename T>
List<T>::List()
{
	Size = 0;
	head = nullptr;
}

template<typename T>
List<T>::~List()
{
	clear();
}

template<typename T>
void List<T>::pop_front()
{
	Node<T>* temp = head;

	head = head->pNext;

	delete temp;

	Size--;
}

template<typename T>
void List<T>::push_back(T data)
{
	if (head == nullptr)
	{
		head = new Node<T>(data);
	}
	else
	{
		Node<T>* current = this->head;

		while (current->pNext != nullptr)
		{
			current = current->pNext;
		}
		current->pNext = new Node<T>(data);
	}
	Size++;
}

template<typename T>
void List<T>::clear()
{
	while (Size)
	{
		pop_front();
	}
}

template<typename T>
T& List<T>::operator[](const int index)
{
	int counter = 0;

	Node<T>* current = this->head;

	while (current != nullptr)
	{
		if (counter == index)
		{
			return current->data;
		}
		current = current->pNext;
		counter++;
	}
}

template<typename T>
void List<T>::push_front(T data)
{
	head = new Node<T>(data, head);
	Size++;
}

template<typename T>
void List<T>::insert(T data, int index)
{

	if (index == 0)
	{
		push_front(data);
	}
	else
	{
		Node<T>* previous = this->head;

		for (int i = 0; i < index - 1; i++)
		{
			previous = previous->pNext;
		}

		Node<T>* newNode = new Node<T>(data, previous->pNext);

		previous->pNext = newNode;

		Size++;
	}
}

template<typename T>
void List<T>::removeAt(int index)
{
	if (index == 0)
	{
		pop_front();
	}
	else
	{
		Node<T>* previous = this->head;
		for (int i = 0; i < index - 1; i++)
		{
			previous = previous->pNext;
		}

		Node<T>* toDelete = previous->pNext;

		previous->pNext = toDelete->pNext;

		delete toDelete;

		Size--;
	}
}

template<typename T>
void List<T>::pop_back()
{
	removeAt(Size - 1);
}


struct Person {
	string surname;
	string post;
	int salary;
};

List<struct Person> seclst;
List<struct Person> lst;
List<struct Person> LIF;
List<struct Person> flist;

int k;
string foundBySurname_Month;
int salary_bithday;
int place = 0;
int age = 0;
int sumSAlary = 0;
int numOfList;
char reading[100];

ofstream list("list.txt");
ifstream ilist("list.txt", ios_base::in);

struct Person NewPerson;

void addElem();
void outputList();
void findBySalary();
void findByJob();
void findByName();
void writeListInFile();


int main()
{

	setlocale(LC_ALL, "Russian");
	system("chcp 1251");

	do   {
		cout << "Добавление элемента - 1" << endl;
		cout << "Удаление элемента - 2" << endl;
		cout << "Вывод элементов - 3" << endl;
		cout << "Нахождение элемента по значению - 4" << endl;
		cout << "Записать список в файл - 5" << endl;
		cout << "Прочитать список из файла - 7" << endl;
		cout << "Выход из программы - 6" << endl;

		cin >> k;

		switch (k)
		{
		case 1:
			system("cls");
			cout << "Добавление элемента в начало списка - 1" << endl;
			cout << "Добавление элемента в конец списка - 2" << endl;
			cout << "Добавление элемента в список по указанному индексу - 3" << endl;
			int j;
			cin >> j;
			switch (j)
			{
			case 1:
				addElem();
				lst.push_front(NewPerson);
				cout << "Элемент добавлен в начало списка" << endl;
				system("pause");
				system("cls");
				break;

			case 2:
				addElem();
				lst.push_back(NewPerson);
				cout << "Элемент добавлен в конец списка" << endl;
				system("pause");
				system("cls");
				break;

			case 3:
				addElem();
				int p;
				cout << "Введите место в списке:" << endl;
				cin >> p;
				lst.insert(NewPerson, (p - 1));
				cout << "Элемент добавлен в " << p << " место" << endl;
				system("pause");
				system("cls");
				break;

			default:
				system("cls");
				cout << "Ошибка!" << endl;
				system("pause");
				system("cls");
				break;
			}
			break;

		case 2:
			system("cls");
			cout << "Удаление первого элемента - 1" << endl;
			cout << "Удаление последнего элемента - 2" << endl;
			cout << "Удаление элемента по указанному индексу - 3" << endl;
			cout << "Очистить список - 4" << endl;
			int l;
			cin >> l;
			switch (l)
			{
			case 1:
				system("cls");
				lst.pop_front();
				cout << "Перый элемент удалён" << endl;
				system("pause");
				system("cls");
				break;

			case 2:
				system("cls");
				lst.pop_back();
				cout << "Последний элемент удалён" << endl;
				system("pause");
				system("cls");
				break;

			case 3:
				system("cls");
				int p;
				cout << "Введите место в списке:" << endl;
				cin >> p;
				lst.removeAt(p - 1);
				cout << p << " элемент удалён" << endl;
				system("pause");
				system("cls");
				break;

			case 4:
				system("cls");
				lst.clear();
				cout << "Список очищен" << endl;
				system("pause");
				system("cls");
				break;

			default:
				system("cls");
				cout << "Ошибка!" << endl;
				system("pause");
				system("cls");
				break;
			};
			break;

		case 3:
			system("cls");
			outputList();
			break;

		case 4:
			system("cls");
			cout << "Поиск по фамилии - 1" << endl;
			cout << "Поиск по должности - 2" << endl;
			cout << "Поиск по зарплате - 3" << endl;
			cin >> j;
			system("cls");
			switch (j)
			{
			case 1:

				findByName();
				break;

			case 2:

				findByJob();
				break;

			case 3:

				findBySalary();
				break;

			default:
				system("cls");
				cout << "Ошибка!" << endl;
				system("pause");
				system("cls");
				break;
			}
			break;

		case 5:
			system("cls");
			writeListInFile();
			cout << "Список записан в файл" << endl;
			system("pause");
			system("cls");
			break;
			break;

		case 6:
			system("cls");
			cout << "Работа окончена." << endl;
			break;

		case 7:
			system("cls");
			lst.clear();
			readFromFile();
			lst.push_back(NewPerson);

			break;

		default:
			system("cls");
			cout << "Ошибка!" << endl;
			system("pause");
			system("cls");
			break;
		}

	} while (k != 7);

	return 0;
}

void addElem()
{
	system("cls");
	cout << "Введите фамилию:" << endl;
	cin >> NewPerson.surname;

	cout << "Введите должность:" << endl;
	cin >> NewPerson.post;

	cout << "Введите зарплату, тыс. руб.:" << endl;
	cin >> NewPerson.salary;

}

void outputList()
{
	system("cls");
	for (int i = 0; i < +lst.GetSize(); i++) {
		cout << (i + 1) << ")" << "Фамилия: " << lst[i].surname << endl;
		cout << "  Должность: " << lst[i].post << endl;
		cout << "  Зарплата: " << lst[i].salary << " тыс. руб." << endl;
		cout << endl;
	}
	if (+lst.GetSize() == 0) {
		cout << "В спеске отсутствуют элементы" << endl;
	}

	system("pause");
	system("cls");
}

void findBySalary()
{
	system("cls");
	cout << "Введите зарплату:" << endl;
	bool resolt = false;
	cin >> salary_bithday;
	for (int i = 0; i < lst.GetSize(); i++) {
		if (salary_bithday == lst[i].salary) {
			place = i + 1;
			cout << "Место в списке: " << place << endl;
			cout << "Фамилия: " << lst[i].surname << endl;
			cout << "Должность: " << lst[i].post << endl;
			cout << "Зарплата: " << lst[i].salary << " тыс. руб." << endl;
			seclst.push_back(lst[i]);
			resolt = true;
		}
		if (resolt == false) {
			cout << "Такой работник отсутствует" << endl;
		}
	}
	system("pause");
	system("cls");
}

void findByJob()
{
	bool resolt = false;
	system("cls");
	cout << "Введите должность:" << endl;
	cin >> foundBySurname_Month;
	for (int i = 0; i < lst.GetSize(); i++) {
		if (foundBySurname_Month == lst[i].post) {
			place = i + 1;
			cout << "Место в списке: " << place << endl;
			cout << "Фамилия: " << lst[i].surname << endl;
			cout << "Должность: " << lst[i].post << endl;
			cout << "Зарплата: " << lst[i].salary << " тыс. руб." << endl;
			seclst.push_back(lst[i]);
			resolt = true;
		}
		if (resolt == false) {
			cout << "Такой работник отсутствует" << endl;
		}
	}
	system("pause");
	system("cls");
}

void findByName()
{
	bool resolt = false;
	system("cls");
	cout << "Введите фамилию:" << endl;
	cin >> foundBySurname_Month;
	for (int i = 0; i < lst.GetSize(); i++) {
		if (foundBySurname_Month == lst[i].surname) {
			place = i + 1;
			cout << "Место в списке: " << place << endl;
			cout << "Фамилия: " << lst[i].surname << endl;
			cout << "Должность: " << lst[i].post << endl;
			cout << "Зарплата: " << lst[i].salary << " тыс. руб." << endl;
			seclst.push_back(lst[i]);
			resolt = true;
		}
		if (resolt == false) {
			cout << "Такой работник отсутствует" << endl;
		}
	}
	system("pause");
	system("cls");
}

int siize = 0;

void writeListInFile()
{
	ofstream listt("structlist.txt", ios_base::out | ios_base::trunc);
	LIF.clear();
	for (int i = 0; i < +lst.GetSize(); i++) {
		LIF.push_back(lst[i]);
	}

	for (int i = 0; i < +LIF.GetSize(); i++) {
		listt << LIF[i].surname << endl;
		listt << LIF[i].post << endl;
		listt << LIF[i].salary << endl;
		siize++;
	}
}

char familiya[99];
char dolznost[99];
char zarplata[99];

void readFromFile() {
	system("cls");

	List<struct Person> liist;
	int d, m, y, s;
	ifstream ilist("structlist.txt", ios_base::in);
	for (int i = 0; i < +liist.GetSize() ; i++)
	{
		ilist.getline(familiya, 99);
		ilist.getline(dolznost, 99);
		ilist.getline(zarplata, 99);

		flist[i].surname = familiya;
		flist[i].post = dolznost;
		s = atoi(zarplata);
		flist[i].salary = s;

		liist.push_back(flist[i]);
		i++;
	}
}