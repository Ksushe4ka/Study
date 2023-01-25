#include <iostream>

using namespace std;

class List  //класс, описывающих объект "связанный список"
{
	struct Node
	{
		int data;
		Node* next;
	};

	Node* head = NULL;

public:
	//метод, добавляющий новый узел в список
	void addNode(int d)
	{
		Node* nd = new Node;

		nd->data = d;  //задаем узлу данные
		nd->next = NULL;

		if (head == NULL)
			head = nd;
		else    //если узел уже не первый
		{
			Node* current = head;

			//ищем в цикле предшествующий последнему узел
			while (current->next != NULL)
				current = current->next;

			//предшествующий указывает на последний
			current->next = nd;
		}
	}

	

	//метод, выводящий связанный список на экран
	void printList()
	{
		Node* current = head;

		while (current != NULL)
		{
			cout << current->data << endl;
			current = current->next;
		}
	}
};

int main()
{
	List myList;
	
	myList.addNode(25);
	myList.addNode(20);
	myList.addNode(15);
	myList.addNode(10);
	myList.addNode(5);
	myList.printList();
	return 0;
}