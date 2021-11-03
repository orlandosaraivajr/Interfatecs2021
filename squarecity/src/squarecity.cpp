#include<iostream>
using namespace std;

int CalculaParteCamada(int x) {
  int a;
  a = (x - 1) / 2;
  if (a % 2 == 0)
    return 0;
  else
    return (x - 2) * 4 + 2;
}

int main() {
	int x, i, casas;
	
	cin >> x;
	casas = 0;
	for (i = 3; i <= x; i+=2) {
	  casas += CalculaParteCamada(i);
  }
  printf("%d\n", casas);
	
	return 0;
}
