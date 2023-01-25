
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

	//�������� ������� �������� � ������
	void pop_front();

	//���������� �������� � ����� ������
	void push_back(T data);

	// �������� ������
	void clear();

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

	// �������� ���������� ��������� � ������
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

//���������� ��������� Worker:
struct Worker {
	string name;
	string post;
	int salary;
};

//������
List<struct Worker> liist;
List<struct Worker> stlist;
List<struct Worker> LIF;
List<struct Worker> flist;
List<struct Worker> llll;

//��������� NWorker
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

//������� ������ ����
void print_menu() {
	setlocale(LC_ALL, "Russian");
	system("cls");  // ������� �����
	printf("1. �������� ������� � ������\n");
	printf("2. �������� ������� � �����\n");
	printf("3. ������� �������� ������ � �������\n");
	printf("4. ������� �������� �������\n");
	printf("5. �������� ������\n");
	printf("6. ����� ��������� ������ �� ����� ����������\n");
	printf("7. �������� ������ � ����\n");
	printf("8. ��������� ������ �� �����\n");
	printf("9. �����\n");
	printf(">");
}


//���������� ������ ��������
void addElem()
{
	system("cls");
	cout << "������� ���:" << endl;
	cin >> NWorker.name;
	cout << "������� ���������:" << endl;
	cin >> NWorker.post;
	cout << "������� ��������, ���. ���.:" << endl;
	cin >> NWorker.salary;
}

//������� ������ ��������� ������
void OutList()
{
	system("cls");
	for (int i = 0; i < +liist.GetSize(); i++) {
		cout << (i + 1) << ")" << "  ���: " << liist[i].name << endl;
		cout << "  ���������: " << liist[i].post << endl;
		cout << "  ��������: " << liist[i].salary << " ���. ���." << endl;
		cout << endl;
	}
	if (+liist.GetSize() == 0) {
		cout << "� ������ ����������� ��������" << endl;
	}

	system("pause");
	system("cls");
}

//������� ������ �� ��������� �������� ������
void findByIndex() {
	bool resolt = false;
	system("cls");
	cout << "������� ������:" << endl;
	cin >> year;
	for (int i = 0; i < liist.GetSize(); i++) {
		if (year == +i) {
			place = i + 1;
			cout << "����� � ������: " << place << endl;
			cout << "  ���: " << liist[i].name << endl;
			cout << "  ���������: " << liist[i].post << endl;
			cout << "  ��������: " << liist[i].salary << " ���. ���." << endl;
			stlist.push_back(liist[i]);
			resolt = true;
		}
	}
	if (resolt == false) {
		cout << "����� �������� �����������" << endl;
	}

	system("pause");
	system("cls");
}

//������� ������ �� ��������
void findBySalary()
{
	system("cls");
	cout << "������� ��������:" << endl;
	bool resolt = false;
	cin >> salar;
	for (int i = 0; i < liist.GetSize(); i++) {
		if (salar == liist[i].salary) {
			place = i + 1;
			cout << "����� � ������: " << place << endl;
			cout << "  ���: " << liist[i].name << endl;
			cout << "  ���������: " << liist[i].post << endl;
			cout << "  ��������: " << liist[i].salary << " ���. ���." << endl;
			stlist.push_back(liist[i]);
			resolt = true;
		}
	}
	if (resolt == false) {
		cout << "����� �������� �����������" << endl;
	}

	system("pause");
	system("cls");
}

//������� ������ �� ���������
void findByPost()
{
	bool resolt = false;
	system("cls");
	cout << "������� ���������:" << endl;
	cin >> foundBySurname;
	for (int i = 0; i < liist.GetSize(); i++) {
		if (foundBySurname == liist[i].post) {
			place = i + 1;
			cout << "����� � ������: " << place << endl;
			cout << "  ���: " << liist[i].name << endl;
			cout << "  ���������: " << liist[i].post << endl;
			cout << "  ��������: " << liist[i].salary << " ���. ���." << endl;
			stlist.push_back(liist[i]);
			resolt = true;
		}
	}
	if (resolt == false) {
		cout << "����� �������� �����������" << endl;
	}

	system("pause");
	system("cls");
}

//������� ������ �� �����
void findByName()
{
	bool resolt = false;
	system("cls");
	cout << "������� ���:" << endl;
	cin >> foundByname;
	for (int i = 0; i < liist.GetSize(); i++) {
		if (foundByname == liist[i].name) {
			place = i + 1;
			cout << "����� � ������: " << place << endl;
			cout << "  ���: " << liist[i].name << endl;
			cout << "  ���������: " << liist[i].post << endl;
			cout << "  ��������: " << liist[i].salary << " ���. ���." << endl;
			stlist.push_back(liist[i]);
			resolt = true;
		}
	}
	if (resolt == false) {
		cout << "����� �������� �����������" << endl;
	}

	system("pause");
	system("cls");
}

int siize = 0;

//������� ������ ������ � ���� structlist

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

//������� ������ �� ����� structlist
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
	cout << "��������" << endl;
	delete[] person;
}


//������� � �������� ��� ������ � ���� ���������� ������
void wrf() {
	cout << "�������� ��������� ������ � ����? ��(1)/���(2)" << endl;
	cin >> lfile;

	switch (lfile)
	{
	case 1:
		system("cls");
		cout << "���������� ���������" << endl;
		wListFile();
		system("pause");
		system("cls");
		break;

	case 2:
		system("cls");
		break;

	default:
		system("cls");
		cout << "������!" << endl;
		system("pause");
		system("cls");
		break;
	}

}

//�������� �������
int main()
{
	setlocale(LC_ALL, "Russian");
	system("chcp 1251");
	system("cls");
	int variant;
	do {
		print_menu(); // ������� ���� �� �����
		cin >> variant; // �������� ����� ���������� ������ ����

		switch (variant) {
		case 1://�������� ������� � ������
			addElem();
			liist.push_front(NWorker);
			cout << "������� �������� � ������ ������" << endl;
			wrf();
			break;

		case 2://�������� ������� � �����
			addElem();
			liist.push_back(NWorker);
			cout << "������� �������� � ����� ������" << endl;
			wrf();
			break;

		case 3://������� �������� ������ � �������
			OutList();
			break;

		case 4://������� �������� �������
			cout << "������� ������ ������� - 1" << endl;
			cout << "������� ��������� ������� - 2" << endl;
			cout << "������� ������� �� ��� ��������� � ������ - 3" << endl;
			int l;
			cin >> l;
			switch (l)
			{
			case 1://������� ������ �������
				liist.pop_front();
				cout << "����� ������� �����" << endl;
				system("pause");
				system("cls");
				wrf();
				break;


			case 2://������� ��������� �������
				liist.pop_back();
				cout << "��������� ������� �����" << endl;
				system("pause");
				system("cls");
				wrf();
				break;

			case 3://������� ������� �� ��� ��������� � ������
				int p;
				cout << "������� ����� � ������:" << endl;
				cin >> p;
				liist.removeAt(p - 1);
				cout << p << "��������� ������� �����" << endl;
				system("pause");
				system("cls");
				wrf();
				break;

			default://�����������, ���� �� ���� ������� �� �������
				system("cls");
				cout << "������!" << endl;
				system("pause");
				system("cls");
				break;
			};
			break;

		case 5://�������� ������
			system("cls");
			liist.clear();
			cout << "������ ������" << endl;
			system("pause");
			system("cls");
			break;

		case 6://����� ��������� ������ �� ����� ���������� 
			system("cls");
			cout << "����� �� ����� - 1" << endl;
			cout << "����� �� ��������� - 2" << endl;
			cout << "����� �� �������� - 3" << endl;
			cin >> j;
			system("cls");
			switch (j)
			{

			case 1://����� �� �����
				findByName();
				break;

			case 2://����� �� ���������
				findByPost();
				break;

			case 3://����� �� ��������
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

		case 7://�������� ������ � ����
			system("cls");
			wListFile();
			cout << "������ ������� � ����" << endl;
			system("pause");
			system("cls");
			break;

		case 8://��������� ������ �� �����
			system("cls");
			readFromFile();
			break;

		case 9://�����
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