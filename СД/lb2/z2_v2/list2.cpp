#include <iostream>
using namespace std;

struct list
{
	float number;
	list* next;
};

void insert(list*&, float); //������� ���������� ��������, ���������� ����� ������ � ������, ������� ����������� 
float del(list*&, float);   //������� ��������, ���������� ����� ������ � ������, ������� ��������� 
int IsEmpty(list*);         //�������, ������� ���������, ���� �� ������
void printList(list*);      //������� ������
void menu(void);     //�������, ������������ ����

int main()
{
	setlocale(LC_CTYPE, "Russian");
	list* first = NULL;
	int choice;
	float value;
	menu();    // ������� ���� 
	cout << " ? ";
	cin >> choice;
	while (choice != 4)
	{
		switch (choice)
		{
		case 1:  	cout << "������� ����� "; // �������� ����� � ������
			cin >> value;
			insert(first, value);
			printList(first);
			break;
		case 2:   if (!IsEmpty(first)) // ������� ����� �� ������
		{
			cout << "������� ��������� ����� ";
			cin >> value;
			if (del(first, value))
			{
				cout << "������� ����� " << value << endl;
				printList(first);
			}
			else
				cout << "����� �� �������" << endl;
		}
			  else
			cout << "������ ����" << endl;
			break;
		default:  cout << "������������ �����" << endl;
			menu();
			break;
		}
		cout << "?  ";
		cin >> choice;
	}
	cout << "�����" << endl;
	return 0;
}

void menu(void)  //����� ���� 
{
	cout << "�������� �����:" << endl;
	cout << " 1 - ���� �����" << endl;
	cout << " 2 - �������� �����" << endl;
	cout << " 4 - �����" << endl;
}

void insert(list*& p, float value) //���������� ����� � ������ 
{
	list* newP = new list;
	if (newP != NULL)     //���� �� �����?  
	{
		newP->number = value;
		newP->next = p;
		p = newP;
	}
	else
		cout << "�������� ���������� �� ���������" << endl;
}

float del(list*& p, float value)  // �������� ����� 
{
	list* previous, * current, * temp;
	if (value == p->number)
	{
		temp = p;
		p = p->next;    // ����������� ���� 
		delete temp;      //���������� ������������� ���� 
		return value;
	}
	else
	{
		previous = p;
		current = p->next;
		while (current != NULL && current->number != value)
		{
			previous = current;
			current = current->next; // ������� � ���������� 
		}
		if (current != NULL)
		{
			temp = current;
			previous->next = current->next;
			free(temp);
			return value;
		}
	}
	return 0;
}

int IsEmpty(list* p) //������  ������? (1-��, 0-���) 
{
	return p == NULL;
}



void printList(list* p)  //����� ������ 
{
	if (p == NULL)
		cout << "������ ����" << endl;
	else
	{
		cout << "������:" << endl;
		while (p != NULL)
		{
			cout << "-->" << p->number;
			p = p->next;
		}
		cout << "-->NULL" << endl;
	}
}
