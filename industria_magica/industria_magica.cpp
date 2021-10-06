#include <iostream>
#include <cmath>

using namespace std;

int seleciona(int a, int b) {
	if (a==1)
		return 1;
	return (seleciona(a-1, b) + b-1) % a + 1;
}

int main() {
    int nc, a, b;

    cin >> nc;
    while(cin >> a >> b)
		cout << seleciona(a, b) << endl;
    return 0;
}
