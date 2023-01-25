
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

//Меню
void print_menu() {
	setlocale(LC_ALL, "Russian");
	printf("Что вы хотете сделать?\n");

	//lb4
	printf("1. Найти элемент по индексу\n");

	//lb5
	printf("2. Добавить элемент\n");
	printf("3. Записать массив в файл\n");   
	printf("4. Прочитать массив из файла\n");
	printf("5. Вывести массив в консоль\n");

	//lb6
	printf("6. Удалить массив\n");
	printf("7. Изменить указанный элемент\n");
	printf("8. Удалить выбранный элемент\n");

	//lb7
	printf("9. Сортировать массив\n");

	//lb8
	printf("10. Фильтрация \n");

	//lb9
	printf("11. Поиск \n");

	printf("12. Выход\n");
	printf(">");
}


//Найти элемент по индексу
void findByIndex()
{
	system("cls");
	int find;
	int k = 0;
	cout << "Введите индекс элемента: ";
	cin >> find;
	if (Size >= find) {
		for (int i = 0; i < Size; i++)
		{
			if (i == find) {
				cout << (i + 1) << ")" << "Имя : " << person[i].name << endl;
				cout << "  Номер группы: " << person[i].group << endl;
				cout << "  Год рождения: " << person[i].year << endl;
			}
		}
		system("pause");
		system("cls");
	}
	else
	{
		cout << "Такого элемента не существует!" << endl;

		system("pause");
		system("cls");
	}
}


//Добавить элемент
void addElem()
{
	cout << "Введите имя" << endl;
	cin >> person[Size].name;
	cout << "Введите номер группы" << endl;
	cin >> person[Size].group;
	cout << "Введите год рождения : ";
	cin >> person[Size].year;
	Size++;
	system("cls");
}


//Записать массив в файл
void writeInFile() {
	system("cls");
	ofstream FileOut("file.txt", ios_base::out | ios_base::trunc);

	for (int i = 0; i < Size; i++) {
		FileOut << person[i].name << endl;
		FileOut << person[i].group << endl;
		FileOut << person[i].year << endl;

	}
	FileOut.close();
	cout << "Данные записаны" << endl;
	system("pause");
	system("cls");
}

//Прочитать массив из файла
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
	cout << "Прочтено!" << endl;
	system("pause");
	system("cls");
}


//Вывести массив в консоль
void OutArray()
{
	system("cls");
	for (int i = 0; i < Size; i++) {
		cout << (i + 1) << ")" << "Имя : " << person[i].name << endl;
		cout << "  Номер группы: " << person[i].group << endl;
		cout << "  Год рождения: " << person[i].year << endl;
	}
	if (Size == 0) {
		cout << "Массив пуст" << endl;
	}

	system("pause");
	system("cls");
}


//Удалить выбранный элемент
void delElem()
{
	system("cls");
	Date* newperson = new Date[100];
	int dElem;
	int k = 0;
	cout << "Введите индекс элемента: ";
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
		cout << "Данные удалены!" << endl;
		system("pause");
		system("cls");
	}
	else
	{
		cout << "Такого элемента не существует!" << endl;

		system("pause");
		system("cls");
	}
}


//Изменить указанный элемент
void ChangeEl()
{
	system("cls");
	string newname;
	int  newgroup, newyear;
	int chEl;
	int k = 0;
	cout << "Введите индекс элемента: ";
	cin >> chEl;
	if (Size >= chEl) {
		for (int i = 0; i < Size; i++)
		{
			if (i == chEl) {
				cout << "Введите имя" << endl;
				cin >> newname;
				person[i].name = newname;
				cout << "Введите номер группы" << endl;
				cin >> newgroup;
				person[i].group = newgroup;
				cout << "Введите год : ";
				cin >> newyear;
				person[i].year = newyear;
			}
		}
		system("pause");
		system("cls");
	}
	else
	{
		cout << "Такого элемента не существует!" << endl;

		system("pause");
		system("cls");
	}
}


//Удалить массив
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

//Функция фильтрации по имени
void FilterName(string stroka) {
	system("cls");
	int k = 0;
	for (int i = 0; i < Size; i++)
	{
		if (person[i].name.find(stroka) != string::npos) {
			cout << (i + 1) << ")" << "Имя : " << person[i].name << endl;
			cout << "  Номер группы: " << person[i].group << endl;
			cout << "  Год рождения : " << person[i].year << endl;
		}
	}
	system("pause");
	system("cls");
}

//Интерполяционный поиск
void IntPoisk(int key) {

	int x; //Текущая позиция массива, с которым сравнивается искомое
	int a = 0; //Левая граница области, где ведется поиск
	int b = Size - 1; //Правая граница области, где ведется поиск
	bool found = false; //Переменка-флаг, принимающая True если искомое найдено

	//Цикл поиска по массиву, пока искомое не найдено 
	//или пределы поиска еще существуют
	while (person[a].year < key && person[b].year > key)
	{
		//Вычисление интерполяцией следующего элемента, который будет сравниваться с искомым
		x = a + ((key - person[a].year) * (b - a)) / (person[b].year - person[a].year);
		//Получение новых границ области, если искомое не найдено
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

	//Если искомое найдено на границах области поиска, показать на какой границе оно
	if (person[a].year == key) {
		cout << (a + 1) << ")" << "Имя : " << person[a].name << endl;
		cout << "  Номер группы: " << person[a].group << endl;
		cout << "  Год рождения: " << person[a].year << endl;

	}
	else if (person[b].year == key) {
		cout << (b + 1) << ")" << "Имя : " << person[b].name << endl;
		cout << "  Номер группы: " << person[b].group << endl;
		cout << "  Год рождения: " << person[b].year << endl;
	}
	else if (found == true) {
		cout << (x + 1) << ")" << "Имя : " << person[x].name << endl;
		cout << "  Номер группы: " << person[x].group << endl;
		cout << "  Год рождения: " << person[x].year << endl;
	}
	else {
		cout << "Не найден" << endl;
	}
}

//Функция бинарного поиска
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
		cout << "Индекс группы " << g << " в массиве равен: " << mid << endl;
	}
	else {
		cout << "Извините, но такого элемента в массиве нет" << endl;
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
		print_menu(); // выводим меню на экран
		cin >> variant; // получаем номер выбранного пункта меню

		switch (variant) {
		case 1://Найти элемент по индексу
			findByIndex();
			system("pause");
			system("cls");
			break;

		case 2://Добавить элемент
			system("cls");
			addElem();
			cout << "Элемент добавлен" << endl;
			system("pause");
			system("cls");
			break;

		case 3://Записать массив в файл
			system("cls");
			writeInFile();
			break;

		case 4://Прочитать массив из файла
			system("cls");
			readFromFile();
			break;

		case 5://Вывести массив в консоль 
			system("cls");
			OutArray();
			break;

		case 6://Очистить список
			system("cls");
			delArray();
			cout << "Данные пусты!" << endl;
			system("pause");
			system("cls");
			break;

		case 7://Изменить выбранный элемент
			ChangeEl();
			cout << "Элемент изменён" << endl;
			system("pause");
			system("cls");
			break;

		case 8: //Удалить элемент
			system("cls");
			delElem();
			system("pause");
			system("cls");
			break;

		case 9://Сортировка
			system("cls");
			cout << "Отсортировать массив по году рождения - 1" << endl;
			cout << "Отсортировать массив по номеру группы - 2" << endl;
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
				cout << "Ошибка!" << endl;
				system("pause");
				system("cls");
				break;
			}
			break;

		case 10: //Фильтрация
			system("cls");
			cout << "Фильтрация по имени" << endl; 
			cout << "Введите строку" << endl;
			cin >> stroka;
			FilterName(stroka);
			system("pause");
			system("cls");
			break;

		case 11: //Поиск
			system("cls");
			cout << "Интерпретирующий поиск индекса по году рождения- 1" << endl;
			cout << "Бинарный поиск по номеру группы- 2" << endl;
			cin >> n;
			switch (n)
			{
			case 1:
				cout << endl << "Введите год рождения: ";
				cin >> key;
				IntPoisk(key);
				break;
			case 2:
				cout << endl << "Введите номер группы: ";
				cin >> g; // считываем ключ
				BinPoisk(g);
				break;
			default:
				system("cls");
				cout << "Ошибка!" << endl;
				system("pause");
				system("cls");
				break;
			}
			break;

		case 12://Выход
			system("cls");
			break;
		}
		if (variant != 13)
			system("pause");
	} while (variant != 13);
	return 0;

}
