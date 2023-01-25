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

	//�������� ������� �������� � ������
	void pop_front();

	//���������� �������� � ����� ������
	void push_back(T data);

	// �������� ������
	void clear();

	// �������� ���������� ��������� � ������
	int GetSize() { return Size; }

	// ������������� �������� [] 
	T& operator[](const int index);

	//���������� �������� � ������ ������
	void push_front(T data);

	//���������� �������� � ������ �� ���������� �������
	void insert(T data, int index);

	//�������� �������� � ������ �� ���������� �������
	void removeAt(int index);

	//�������� ���������� �������� � ������
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
		cout << "���������� �������� - 1" << endl;
		cout << "�������� �������� - 2" << endl;
		cout << "����� ��������� - 3" << endl;
		cout << "���������� �������� �� �������� - 4" << endl;
		cout << "�������� ������ � ���� - 5" << endl;
		cout << "��������� ������ �� ����� - 7" << endl;
		cout << "����� �� ��������� - 6" << endl;

		cin >> k;

		switch (k)
		{
		case 1:
			system("cls");
			cout << "���������� �������� � ������ ������ - 1" << endl;
			cout << "���������� �������� � ����� ������ - 2" << endl;
			cout << "���������� �������� � ������ �� ���������� ������� - 3" << endl;
			int j;
			cin >> j;
			switch (j)
			{
			case 1:
				addElem();
				lst.push_front(NewPerson);
				cout << "������� �������� � ������ ������" << endl;
				system("pause");
				system("cls");
				break;

			case 2:
				addElem();
				lst.push_back(NewPerson);
				cout << "������� �������� � ����� ������" << endl;
				system("pause");
				system("cls");
				break;

			case 3:
				addElem();
				int p;
				cout << "������� ����� � ������:" << endl;
				cin >> p;
				lst.insert(NewPerson, (p - 1));
				cout << "������� �������� � " << p << " �����" << endl;
				system("pause");
				system("cls");
				break;

			default:
				system("cls");
				cout << "������!" << endl;
				system("pause");
				system("cls");
				break;
			}
			break;

		case 2:
			system("cls");
			cout << "�������� ������� �������� - 1" << endl;
			cout << "�������� ���������� �������� - 2" << endl;
			cout << "�������� �������� �� ���������� ������� - 3" << endl;
			cout << "�������� ������ - 4" << endl;
			int l;
			cin >> l;
			switch (l)
			{
			case 1:
				system("cls");
				lst.pop_front();
				cout << "����� ������� �����" << endl;
				system("pause");
				system("cls");
				break;

			case 2:
				system("cls");
				lst.pop_back();
				cout << "��������� ������� �����" << endl;
				system("pause");
				system("cls");
				break;

			case 3:
				system("cls");
				int p;
				cout << "������� ����� � ������:" << endl;
				cin >> p;
				lst.removeAt(p - 1);
				cout << p << " ������� �����" << endl;
				system("pause");
				system("cls");
				break;

			case 4:
				system("cls");
				lst.clear();
				cout << "������ ������" << endl;
				system("pause");
				system("cls");
				break;

			default:
				system("cls");
				cout << "������!" << endl;
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
			cout << "����� �� ������� - 1" << endl;
			cout << "����� �� ��������� - 2" << endl;
			cout << "����� �� �������� - 3" << endl;
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
				cout << "������!" << endl;
				system("pause");
				system("cls");
				break;
			}
			break;

		case 5:
			system("cls");
			writeListInFile();
			cout << "������ ������� � ����" << endl;
			system("pause");
			system("cls");
			break;
			break;

		case 6:
			system("cls");
			cout << "������ ��������." << endl;
			break;

		case 7:
			system("cls");
			lst.clear();
			readFromFile();
			lst.push_back(NewPerson);

			break;

		default:
			system("cls");
			cout << "������!" << endl;
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
	cout << "������� �������:" << endl;
	cin >> NewPerson.surname;

	cout << "������� ���������:" << endl;
	cin >> NewPerson.post;

	cout << "������� ��������, ���. ���.:" << endl;
	cin >> NewPerson.salary;

}

void outputList()
{
	system("cls");
	for (int i = 0; i < +lst.GetSize(); i++) {
		cout << (i + 1) << ")" << "�������: " << lst[i].surname << endl;
		cout << "  ���������: " << lst[i].post << endl;
		cout << "  ��������: " << lst[i].salary << " ���. ���." << endl;
		cout << endl;
	}
	if (+lst.GetSize() == 0) {
		cout << "� ������ ����������� ��������" << endl;
	}

	system("pause");
	system("cls");
}

void findBySalary()
{
	system("cls");
	cout << "������� ��������:" << endl;
	bool resolt = false;
	cin >> salary_bithday;
	for (int i = 0; i < lst.GetSize(); i++) {
		if (salary_bithday == lst[i].salary) {
			place = i + 1;
			cout << "����� � ������: " << place << endl;
			cout << "�������: " << lst[i].surname << endl;
			cout << "���������: " << lst[i].post << endl;
			cout << "��������: " << lst[i].salary << " ���. ���." << endl;
			seclst.push_back(lst[i]);
			resolt = true;
		}
		if (resolt == false) {
			cout << "����� �������� �����������" << endl;
		}
	}
	system("pause");
	system("cls");
}

void findByJob()
{
	bool resolt = false;
	system("cls");
	cout << "������� ���������:" << endl;
	cin >> foundBySurname_Month;
	for (int i = 0; i < lst.GetSize(); i++) {
		if (foundBySurname_Month == lst[i].post) {
			place = i + 1;
			cout << "����� � ������: " << place << endl;
			cout << "�������: " << lst[i].surname << endl;
			cout << "���������: " << lst[i].post << endl;
			cout << "��������: " << lst[i].salary << " ���. ���." << endl;
			seclst.push_back(lst[i]);
			resolt = true;
		}
		if (resolt == false) {
			cout << "����� �������� �����������" << endl;
		}
	}
	system("pause");
	system("cls");
}

void findByName()
{
	bool resolt = false;
	system("cls");
	cout << "������� �������:" << endl;
	cin >> foundBySurname_Month;
	for (int i = 0; i < lst.GetSize(); i++) {
		if (foundBySurname_Month == lst[i].surname) {
			place = i + 1;
			cout << "����� � ������: " << place << endl;
			cout << "�������: " << lst[i].surname << endl;
			cout << "���������: " << lst[i].post << endl;
			cout << "��������: " << lst[i].salary << " ���. ���." << endl;
			seclst.push_back(lst[i]);
			resolt = true;
		}
		if (resolt == false) {
			cout << "����� �������� �����������" << endl;
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