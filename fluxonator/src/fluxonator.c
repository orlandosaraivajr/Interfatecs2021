#include <stdio.h>
#include <string.h>

#define L 0
#define R 1
#define A 'A'
#define B 'B'
#define C 'C'
#define D "D\n"
#define E "E\n"
#define INV(X) X=(X+1)%2 

int main() {
	char entrada[1000], e;
	int n, l1, l2, l3, i, j;

	scanf("%d", &n);
	for(int j=0; j<n; j++) {
		l1 = l2 = l3 = L;
		scanf("%[^\n]", entrada);
		for(i = 0; i < strlen(entrada); i++) {
			e = entrada[i];
			if(e == A) {
				if(l1 == L) printf(D);
				else {
					if(l2 == L) printf(D);
					else printf(E);
					INV(l2);
				}
				INV(l1);
			} else if(e == B) {
				if(l2 == L) printf(D);
				else printf(E);
				INV(l2);
			} else /*e==C*/{
				if(l3 == L) {
					if(l2 == L) printf(D);
					else printf(E);
					INV(l2);
				} else printf(E);
				INV(l3);
			}
		}
	}	
	return 0;
}
