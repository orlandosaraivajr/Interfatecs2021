#include <iostream>
#include <cstring>
#include <stack>

using namespace std;

int main(int argc, char const *argv[])
{

	int N, INI, FIM; 
	cin >> N >> INI >> FIM;

	int NT;
	cin >> NT;

	bool T[N+1]; 
	memset(T, false, (N+1)*sizeof(bool));

	for (int i = 0; i < NT; ++i)
	{
		int Q; cin >> Q;

		T[Q] = true;
	}

	int NP;
	cin >> NP;

	int G[N+1][N+1];  
	memset(G, 0, (N+1)*(N+1)*sizeof(int));

	for (int i = 0; i < NP; ++i)
	{
		int Q1, Q2; cin >> Q1 >> Q2;

		if (!T[Q1] && !T[Q2]) 
		{
			G[Q1][0]++;
			G[Q2][0]++;
			G[Q1][G[Q1][0]] = Q2;
			G[Q2][G[Q2][0]] = Q1;	
		}
	}

	bool V[N+1];
	memset(V, false, (N+1)*sizeof(bool));

	int ATUAL = -1;
	stack<int> pilha; pilha.push(INI);

	while (!pilha.empty() && ATUAL != FIM)
	{
		ATUAL = pilha.top(); pilha.pop();

		V[ATUAL] = true;

		for (int i = 1; i < G[ATUAL][0]+1; ++i)
		{
			if (!V[G[ATUAL][i]])
			{
				if (G[ATUAL][i] == FIM) {
					ATUAL = FIM;
					break;
				}

				pilha.push(G[ATUAL][i]);
			}
		}
	}

	if (ATUAL == FIM)
		cout << "PROSSEGUIR" << endl;
	else 
		cout << "ABORTAR" << endl;

	return 0;
}