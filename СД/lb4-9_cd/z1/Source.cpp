
#include <iostream>
#include <fstream>
#include <string.h>
#include <string>

using namespace std;


struct Date {
	string name;
	int group;
	int year;
};

int Size = 0;
int filesize;
string file;

string stroka;
char imya[99];
char gruppa[99];
char god[7];

Date* person = new Date[100];

//����
void print_menu() {
	setlocale(LC_ALL, "Russian");
	printf("��� �� ������ �������?\n");

	//lb4
	printf("1. ����� ������� �� �������\n");

	//lb5
	printf("2. �������� �������\n");
	printf("3. �������� ������ � ����\n");   
	printf("4. ��������� ������ �� �����\n");
	printf("5. ������� ������ � �������\n");

	//lb6
	printf("6. ������� ������\n");
	printf("7. �������� ��������� �������\n");
	printf("8. ������� ��������� �������\n");

	//lb7
	printf("9. ����������� ������\n");

	//lb8
	printf("10. ���������� \n");

	//lb9
	printf("11. ����� \n");

	printf("12. �����\n");
	printf(">");
}


//����� ������� �� �������
void findByIndex()
{
	system("cls");
	int find;
	int k = 0;
	cout << "������� ������ ��������: ";
	cin >> find;
	if (Size >= find) {
		for (int i = 0; i < Size; i++)
		{
			if (i == find) {
				cout << (i + 1) << ")" << "��� : " << person[i].name << endl;
				cout << "  ����� ������: " << person[i].group << endl;
				cout << "  ��� ��������: " << person[i].year << endl;
			}
		}
		system("pause");
		system("cls");
	}
	else
	{
		cout << "������ �������� �� ����������!" << endl;

		system("pause");
		system("cls");
	}
}


//�������� �������
void addElem()
{
	cout << "������� ���" << endl;
	cin >> person[Size].name;
	cout << "������� ����� ������" << endl;
	cin >> person[Size].group;
	cout << "������� ��� �������� : ";
	cin >> person[Size].year;
	Size++;
	system("cls");
}


//�������� ������ � ����
void writeInFile() {
	system("cls");
	ofstream FileOut("file.txt", ios_base::out | ios_base::trunc);

	for (int i = 0; i < Size; i++) {
		FileOut << person[i].name << endl;
		FileOut << person[i].group << endl;
		FileOut << person[i].year << endl;

	}
	FileOut.close();
	cout << "������ ��������" << endl;
	system("pause");
	system("cls");
}

//��������� ������ �� �����
void readFromFile() {

	system("cls");
	int i = 0;
	int g, y;
	ifstream fromFile("file3.txt", ios_base::in);
	while (!fromFile.eof())
	{
		fromFile.getline(imya, 99);
		fromFile.getline(gruppa, 99);
		fromFile.getline(god, 7);
		person[i].name = imya;
		g = atoi(gruppa);
		person[i].group = g;
		y = atoi(god);
		person[i].year = y;
		i++;
		++Size;
	}
	fromFile.close();
	cout << "��������!" << endl;
	system("pause");
	system("cls");
}


//������� ������ � �������
void OutArray()
{
	system("cls");
	for (int i = 0; i < Size; i++) {
		cout << (i + 1) << ")" << "��� : " << person[i].name << endl;
		cout << "  ����� ������: " << person[i].group << endl;
		cout << "  ��� ��������: " << person[i].year << endl;
	}
	if (Size == 0) {
		cout << "������ ����" << endl;
	}

	system("pause");
	system("cls");
}


//������� ��������� �������
void delElem()
{
	system("cls");
	Date* newperson = new Date[100];
	int dElem;
	int k = 0;
	cout << "������� ������ ��������: ";
	cin >> dElem;
	if (Size >= dElem) {
		for (int i = 0; i < Size; i++)
		{
			if (i == dElem) {

			}
			else
			{
				newperson[k] = person[i];
				k++;
			}

		}
		Size--;
		for (int i = 0; i < Size; i++)
		{
			person[i] = newperson[i];
		}
		delete[]newperson;
		cout << "������ �������!" << endl;
		system("pause");
		system("cls");
	}
	else
	{
		cout << "������ �������� �� ����������!" << endl;

		system("pause");
		system("cls");
	}
}


//�������� ��������� �������
void ChangeEl()
{
	system("cls");
	string newname;
	int  newgroup, newyear;
	int chEl;
	int k = 0;
	cout << "������� ������ ��������: ";
	cin >> chEl;
	if (Size >= chEl) {
		for (int i = 0; i < Size; i++)
		{
			if (i == chEl) {
				cout << "������� ���" << endl;
				cin >> newname;
				person[i].name = newname;
				cout << "������� ����� ������" << endl;
				cin >> newgroup;
				person[i].group = newgroup;
				cout << "������� ��� : ";
				cin >> newyear;
				person[i].year = newyear;
			}
		}
		system("pause");
		system("cls");
	}
	else
	{
		cout << "������ �������� �� ����������!" << endl;

		system("pause");
		system("cls");
	}
}


//������� ������
void delArray()
{
	delete[] person;
	Size = 0;
	Date* person = new Date[100];
}


void SelectionSort() {
	int j = 0;
	string chname;
	string chsurname;
	int chday, chmonth, chyear, chgroup;
	for (int i = 0; i < Size; i++) {
		j = i;
		for (int k = i; k < Size; k++) {
			if (person[j].year >= person[k].year) {
				j = k;
			}
		}

		chname = person[i].name;
		chgroup = person[i].group;
		chyear = person[i].year;


		person[i].name = person[j].name;
		person[i].group = person[j].group;
		person[i].year = person[j].year;

		person[j].name = chname;
		person[j].group = chgroup;
		person[j].year = chyear;

	}
}

void BabbleSort()
{
	int j = 0;
	int tmp = 0;
	string chname;
	string chsurname;
	int chday, chmonth, chyear, chgroup;
	for (int i = 0; i < Size; i++) {
		for (int j = (Size - 1); j >= (i + 1); j--) {
			if (person[j].group < person[j - 1].group) {

				chname = person[j].name;
				chgroup = person[j].group;
				chyear = person[j].year;

				person[j].name = person[j - 1].name;
				person[j].group = person[j - 1].group;
				person[j].year = person[j - 1].year;


				person[j - 1].name = chname;
				person[j - 1].group = chgroup;
				person[j - 1].year = chyear;
			}
		}
	}
}

//������� ���������� �� �����
void FilterName(string stroka) {
	system("cls");
	int k = 0;
	for (int i = 0; i < Size; i++)
	{
		if (person[i].name.find(stroka) != string::npos) {
			cout << (i + 1) << ")" << "��� : " << person[i].name << endl;
			cout << "  ����� ������: " << person[i].group << endl;
			cout << "  ��� �������� : " << person[i].year << endl;
		}
	}
	system("pause");
	system("cls");
}

//���������������� �����
void IntPoisk(int key) {

	int x; //������� ������� �������, � ������� ������������ �������
	int a = 0; //����� ������� �������, ��� ������� �����
	int b = Size - 1; //������ ������� �������, ��� ������� �����
	bool found = false; //���������-����, ����������� True ���� ������� �������

	//���� ������ �� �������, ���� ������� �� ������� 
	//��� ������� ������ ��� ����������
	while (person[a].year < key && person[b].year > key)
	{
		//���������� ������������� ���������� ��������, ������� ����� ������������ � �������
		x = a + ((key - person[a].year) * (b - a)) / (person[b].year - person[a].year);
		//��������� ����� ������ �������, ���� ������� �� �������
		if (person[x].year < key) {
			a = x + 1;
		}
		else if (person[x].year > key) {
			b = x - 1;
		}
		else {
			found = true;
			break;
		}
	}

	//���� ������� ������� �� �������� ������� ������, �������� �� ����� ������� ���
	if (person[a].year == key) {
		cout << (a + 1) << ")" << "��� : " << person[a].name << endl;
		cout << "  ����� ������: " << person[a].group << endl;
		cout << "  ��� ��������: " << person[a].year << endl;

	}
	else if (person[b].year == key) {
		cout << (b + 1) << ")" << "��� : " << person[b].name << endl;
		cout << "  ����� ������: " << person[b].group << endl;
		cout << "  ��� ��������: " << person[b].year << endl;
	}
	else if (found == true) {
		cout << (x + 1) << ")" << "��� : " << person[x].name << endl;
		cout << "  ����� ������: " << person[x].group << endl;
		cout << "  ��� ��������: " << person[x].year << endl;
	}
	else {
		cout << "�� ������" << endl;
	}
}

//������� ��������� ������
void BinPoisk(int g) {
	bool flag = false;
	int l = 0;
	int r = Size; 
	int mid;

	while ((l <= r) && (flag != true)) {
		mid = (l + r) / 2; 

		if (person[mid].group == g) flag = true; 
		if (person[mid].group > g) r = mid - 1; 
		else l = mid + 1;
	}

	if (flag) {
		cout << "������ ������ " << g << " � ������� �����: " << mid << endl;
	}
	else {
		cout << "��������, �� ������ �������� � ������� ���" << endl;
	}
}



int main()
{
	system("chcp 1251"); 
	system("cls"); 
	int variant;
	int n;
	int t;
	int g;
	int key;

	do {
		print_menu(); // ������� ���� �� �����
		cin >> variant; // �������� ����� ���������� ������ ����

		switch (variant) {
		case 1://����� ������� �� �������
			findByIndex();
			system("pause");
			system("cls");
			break;

		case 2://�������� �������
			system("cls");
			addElem();
			cout << "������� ��������" << endl;
			system("pause");
			system("cls");
			break;

		case 3://�������� ������ � ����
			system("cls");
			writeInFile();
			break;

		case 4://��������� ������ �� �����
			system("cls");
			readFromFile();
			break;

		case 5://������� ������ � ������� 
			system("cls");
			OutArray();
			break;

		case 6://�������� ������
			system("cls");
			delArray();
			cout << "������ �����!" << endl;
			system("pause");
			system("cls");
			break;

		case 7://�������� ��������� �������
			ChangeEl();
			cout << "������� ������" << endl;
			system("pause");
			system("cls");
			break;

		case 8: //������� �������
			system("cls");
			delElem();
			system("pause");
			system("cls");
			break;

		case 9://����������
			system("cls");
			cout << "������������� ������ �� ���� �������� - 1" << endl;
			cout << "������������� ������ �� ������ ������ - 2" << endl;
			cin >> n;
			switch (n)
			{
			case 1:
				SelectionSort();
				system("cls");
				break;
			case 2:
				BabbleSort();
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

		case 10: //����������
			system("cls");
			cout << "���������� �� �����" << endl; 
			cout << "������� ������" << endl;
			cin >> stroka;
			FilterName(stroka);
			system("pause");
			system("cls");
			break;

		case 11: //�����
			system("cls");
			cout << "���������������� ����� ������� �� ���� ��������- 1" << endl;
			cout << "�������� ����� �� ������ ������- 2" << endl;
			cin >> n;
			switch (n)
			{
			case 1:
				cout << endl << "������� ��� ��������: ";
				cin >> key;
				IntPoisk(key);
				break;
			case 2:
				cout << endl << "������� ����� ������: ";
				cin >> g; // ��������� ����
				BinPoisk(g);
				break;
			default:
				system("cls");
				cout << "������!" << endl;
				system("pause");
				system("cls");
				break;
			}
			break;

		case 12://�����
			system("cls");
			break;
		}
		if (variant != 13)
			system("pause");
	} while (variant != 13);
	return 0;

}
