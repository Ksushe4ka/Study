
#include <iostream>
#include <fstream>
#include <string.h>
#include <string>
#include <windows.h>
#include <clocale>
#include <sstream>
using namespace std;


template<typename T>
class List
{

public:
	List()
	{
		Size = 0;
		head = nullptr;
	}

	~List()
	{
		clear();
	}

	//удаление первого элемента в списке
	void pop_front();

	//добавление элемента в конец списка
	void push_back(T data);

	// очистить список
	void clear();

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

	// получить количество елементов в списке
	int GetSize() { return Size; }

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

//Объявление структуры Worker:
struct Worker {
	string name;
	string post;
	int salary;
};

//списки
List<struct Worker> liist;
List<struct Worker> stlist;
List<struct Worker> LIF;
List<struct Worker> flist;
List<struct Worker> llll;

//Структура NWorker
struct Worker NWorker;


int k, j, n, p;
string foundByname;
string foundBySurname;
string listt;
int salar;
int year;
int day;
int month;
int lfile;
int sfile;
int place = 0;

ifstream ilist("structlist.txt", ios_base::in);

//Функция вывода Меню
void print_menu() {
	setlocale(LC_ALL, "Russian");
	system("cls");  // очищаем экран
	printf("1. Добавить элемент в начало\n");
	printf("2. Добавить элемент в конец\n");
	printf("3. Вывести элементы списка в консоль\n");
	printf("4. Удалить заданный элемент\n");
	printf("5. Очистить список\n");
	printf("6. Поиск элементов списка по любым параметрам\n");
	printf("7. Записать список в файл\n");
	printf("8. Прочитать список из файла\n");
	printf("9. Выход\n");
	printf(">");
}


//Добавление нового элемента
void addElem()
{
	system("cls");
	cout << "Введите имя:" << endl;
	cin >> NWorker.name;
	cout << "Введите должность:" << endl;
	cin >> NWorker.post;
	cout << "Введите зарплату, тыс. руб.:" << endl;
	cin >> NWorker.salary;
}

//Функция вывода элементов списка
void OutList()
{
	system("cls");
	for (int i = 0; i < +liist.GetSize(); i++) {
		cout << (i + 1) << ")" << "  Имя: " << liist[i].name << endl;
		cout << "  Должность: " << liist[i].post << endl;
		cout << "  Зарплата: " << liist[i].salary << " тыс. руб." << endl;
		cout << endl;
	}
	if (+liist.GetSize() == 0) {
		cout << "В списке отсутствуют элементы" << endl;
	}

	system("pause");
	system("cls");
}

//Функция поиска по заданному значению номера
void findByIndex() {
	bool resolt = false;
	system("cls");
	cout << "Введите индекс:" << endl;
	cin >> year;
	for (int i = 0; i < liist.GetSize(); i++) {
		if (year == +i) {
			place = i + 1;
			cout << "Место в списке: " << place << endl;
			cout << "  Имя: " << liist[i].name << endl;
			cout << "  Должность: " << liist[i].post << endl;
			cout << "  Зарплата: " << liist[i].salary << " тыс. руб." << endl;
			stlist.push_back(liist[i]);
			resolt = true;
		}
	}
	if (resolt == false) {
		cout << "Такой работник отсутствует" << endl;
	}

	system("pause");
	system("cls");
}

//Функция поиска по зарплате
void findBySalary()
{
	system("cls");
	cout << "Введите зарплату:" << endl;
	bool resolt = false;
	cin >> salar;
	for (int i = 0; i < liist.GetSize(); i++) {
		if (salar == liist[i].salary) {
			place = i + 1;
			cout << "Место в списке: " << place << endl;
			cout << "  Имя: " << liist[i].name << endl;
			cout << "  Должность: " << liist[i].post << endl;
			cout << "  Зарплата: " << liist[i].salary << " тыс. руб." << endl;
			stlist.push_back(liist[i]);
			resolt = true;
		}
	}
	if (resolt == false) {
		cout << "Такой работник отсутствует" << endl;
	}

	system("pause");
	system("cls");
}

//Функция поиска по должности
void findByPost()
{
	bool resolt = false;
	system("cls");
	cout << "Введите должность:" << endl;
	cin >> foundBySurname;
	for (int i = 0; i < liist.GetSize(); i++) {
		if (foundBySurname == liist[i].post) {
			place = i + 1;
			cout << "Место в списке: " << place << endl;
			cout << "  Имя: " << liist[i].name << endl;
			cout << "  Должность: " << liist[i].post << endl;
			cout << "  Зарплата: " << liist[i].salary << " тыс. руб." << endl;
			stlist.push_back(liist[i]);
			resolt = true;
		}
	}
	if (resolt == false) {
		cout << "Такой работник отсутствует" << endl;
	}

	system("pause");
	system("cls");
}

//Функция поиска по имени
void findByName()
{
	bool resolt = false;
	system("cls");
	cout << "Введите имя:" << endl;
	cin >> foundByname;
	for (int i = 0; i < liist.GetSize(); i++) {
		if (foundByname == liist[i].name) {
			place = i + 1;
			cout << "Место в списке: " << place << endl;
			cout << "  Имя: " << liist[i].name << endl;
			cout << "  Должность: " << liist[i].post << endl;
			cout << "  Зарплата: " << liist[i].salary << " тыс. руб." << endl;
			stlist.push_back(liist[i]);
			resolt = true;
		}
	}
	if (resolt == false) {
		cout << "Такой работник отсутствует" << endl;
	}

	system("pause");
	system("cls");
}

int siize = 0;

//Функция записи списка в файл structlist

void wListFile()
{
	ofstream listt("structlist.txt", ios_base::out );
	LIF.clear();
	for (int i = 0; i < +liist.GetSize(); i++) {
		LIF.push_back(liist[i]);
	}

	for (int i = 0; i < +LIF.GetSize(); i++) {
		listt << LIF[i].name << endl;
		listt << LIF[i].post << endl;
		listt << LIF[i].salary << endl;
		siize++;
	}
}

char imya[99];
char familiya[99];
char dolznost[99];
char zarplata[99];

//Функция чтения из файла structlist
void readFromFile() {
	system("cls");
	Worker* person = new Worker[100];
	int d, m, y, s;
	int i = liist.GetSize();
	ifstream jsxd("File.txt", ios_base::in);
	while (!jsxd.eof())
	{
		jsxd.getline(imya, 99);
		jsxd.getline(dolznost, 99);
		jsxd.getline(zarplata, 99);

		person[i].name = imya;
		person[i].post = dolznost;
		s = atoi(zarplata);
		person[i].salary = s;
		liist.push_back(person[i]);
		i++;
	}
	cout << "прочтено" << endl;
	delete[] person;
}


//Функция с вопросом для записи в файл изменённого списка
void wrf() {
	cout << "Записать изменённый список в файл? Да(1)/Нет(2)" << endl;
	cin >> lfile;

	switch (lfile)
	{
	case 1:
		system("cls");
		cout << "Результаты сохранены" << endl;
		wListFile();
		system("pause");
		system("cls");
		break;

	case 2:
		system("cls");
		break;

	default:
		system("cls");
		cout << "Ошибка!" << endl;
		system("pause");
		system("cls");
		break;
	}

}

//Основная функция
int main()
{
	setlocale(LC_ALL, "Russian");
	system("chcp 1251");
	system("cls");
	int variant;
	do {
		print_menu(); // выводим меню на экран
		cin >> variant; // получаем номер выбранного пункта меню

		switch (variant) {
		case 1://Добавить элемент в начало
			addElem();
			liist.push_front(NWorker);
			cout << "Элемент добавлен в начало списка" << endl;
			wrf();
			break;

		case 2://Добавить элемент в конец
			addElem();
			liist.push_back(NWorker);
			cout << "Элемент добавлен в конец списка" << endl;
			wrf();
			break;

		case 3://Вывести элементы списка в консоль
			OutList();
			break;

		case 4://Удалить заданный элемент
			cout << "Удалить первый элемент - 1" << endl;
			cout << "Удалить последний элемент - 2" << endl;
			cout << "Удалить элемент по его положению в списке - 3" << endl;
			int l;
			cin >> l;
			switch (l)
			{
			case 1://Удалить первый элемент
				liist.pop_front();
				cout << "Перый элемент удалён" << endl;
				system("pause");
				system("cls");
				wrf();
				break;


			case 2://Удалить последний элемент
				liist.pop_back();
				cout << "Последний элемент удалён" << endl;
				system("pause");
				system("cls");
				wrf();
				break;

			case 3://Удалить элемент по его положению в списке
				int p;
				cout << "Введите место в списке:" << endl;
				cin >> p;
				liist.removeAt(p - 1);
				cout << p << "Выбранный элемент удалён" << endl;
				system("pause");
				system("cls");
				wrf();
				break;

			default://Выполняется, если ни один вариант не подошел
				system("cls");
				cout << "Ошибка!" << endl;
				system("pause");
				system("cls");
				break;
			};
			break;

		case 5://Очистить список
			system("cls");
			liist.clear();
			cout << "Список очищен" << endl;
			system("pause");
			system("cls");
			break;

		case 6://Поиск элементов списка по любым параметрам 
			system("cls");
			cout << "Поиск по имени - 1" << endl;
			cout << "Поиск по должности - 2" << endl;
			cout << "Поиск по зарплате - 3" << endl;
			cin >> j;
			system("cls");
			switch (j)
			{

			case 1://Поиск по имени
				findByName();
				break;

			case 2://Поиск по должности
				findByPost();
				break;

			case 3://Поиск по зарплате
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

		case 7://Записать список в файл
			system("cls");
			wListFile();
			cout << "Список записан в файл" << endl;
			system("pause");
			system("cls");
			break;

		case 8://Прочитать список из файла
			system("cls");
			readFromFile();
			break;

		case 9://Выход
			system("cls");
			liist.clear();
			stlist.clear();
			break;
		}
		if (variant != 9)
			system("pause");
	} while (variant != 9);
	return 0;
};