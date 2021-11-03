#include <iostream>

using namespace std;

#define L 0
#define R 1
#define A 'A'
#define B 'B'
#define C 'C'
#define D 'D'
#define E 'E'
#define INV(X) X=(X+1)%2 

int main() {
	string entrada;
	int n, l1, l2, l3;

	cin >> n;
	for(int i=0; i<n; i++) {
		l1 = l2 = l3 = L;
		cin >> entrada;
		for(char e: entrada) {
			if(e == A) {
				if(l1 == L) cout << D;
				else {
					if(l2 == L) cout << D;
					else cout << E;
					INV(l2);
				}
				INV(l1);
			} else if(e == B) {
				if(l2 == L) cout << D;
				else cout << E;
				INV(l2);
			} else /*e==C*/{
				if(l3 == L) {
					if(l2 == L) cout << D;
					else cout << E;
					INV(l2);
				} else cout << E;
				INV(l3);
			}
		}
		cout << endl;
	}	
	return 0;
}
