#include <stdio.h>

int seleciona(int a, int b) {
	if (a==1)
		return 1;
	return (seleciona(a-1, b) + b-1) % a + 1;
}

int main() {
    int a, b, r;

	while(scanf("%d %d", &a, &b) != EOF) {
		r = seleciona(a, b);
		printf("%d\n", r);
	}
    return 0;
}
