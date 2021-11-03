#include <iostream>
#include <cstring>
#include <cmath>

using namespace std;

int max_attack(int power, int i_card,int n_knight, int n_card, bool hand[10], char cards[10])
{
	int attack = 0;

	if (n_knight <= 0)
		return attack;

	switch (cards[i_card])
	{
		case 'T':
			power = power+(n_knight);

			break;
		case 'R':
			power = power+(n_knight*(n_knight/2));

			break;
		case 'S':
			power = (power-(power/n_knight))+((n_knight-1)*((power/n_knight)/2)); --n_knight;

			break; 
	}

	attack = power; hand[i_card] = true;

	// for (int j = 0; j < n_card; ++j) cout << " " << hand[j]; cout << " | " << attack << endl;	

	for (int i = 0; i < n_card; ++i)
	{
		if (!hand[i])
		{
			int result = max_attack(power,i,n_knight,n_card,hand,cards);
			
			if (result > attack)
			{
				attack = result;
			}
		}
	}

	hand[i_card] = false;

	return attack;
}

int max_attack(int n_knight, int n_card, bool hand[10], char cards[10])
{
	int attack = n_knight;

	for (int i = 0; i < n_card; ++i)
	{
		int result = max_attack(n_knight,i,n_knight, n_card,hand,cards);

		if (result > attack)
		{
			attack = result;
		}
	}

	return attack;
}

int main(int argc, char const *argv[])
{
	int n_knight, n_card; cin >> n_knight >> n_card;

	char cards [10]; bool hand[10];
	
	for (int i = 0; i < n_card; ++i)
	{
		cin >> cards[i]; hand[i] = false;
	}

	cout << max_attack(n_knight,n_card, hand, cards) << endl;


	return 0;
}