#include<iostream>
#include<map>
using namespace std;

bool Verifica(string subS, string S){
	map <char, int> m;
	map <char, int>::iterator it;
	int i;
	for (i = 0; i < S.length(); i++)
		m[S[i]]++;
	for (i = 0; i < subS.length(); i++)
		m[subS[i]]--;
	for (it = m.begin(); it != m.end(); it++)
		if (it->second != 0)
			return false;
	return true;
}

int ContaAnagramas(string subS, string S) {
	int cont = 0, i;
	for (i = 0; i < S.length()-subS.length()+1; i++) {
		if (Verifica(S.substr(i, subS.length()), subS))
			cont++;
	}
	return cont;
}

int main() {
	string S1, S2;
	int NCasos, i;
	
	cin >> NCasos;
	for (i = 0; i < NCasos; i++) {
    cin >> S1 >> S2;
    if (S2.length() > S1.length())
      cout << "ERRO" << endl;
    else
      cout << ContaAnagramas(S2, S1) << endl;
  }
	
	return 0;
}
