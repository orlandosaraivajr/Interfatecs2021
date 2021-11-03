L = 0
R = 1
A = 'A'
B = 'B'
C = 'C'
D = 'D'
INV = lambda x: (x+1) % 2

n = int(input())
for _ in range(n):
    entrada = input()
    for e in entrada:
        if e == A:
            if l1 == L:
                print(D)
            else:
                if l2 == L:
                    print(D)
                else: 
                    print(E)
                l2 = INV(l2)
            l1 = INV(l1)
        else:
            if e == B:
                if l2 == L:
                    print(D)
                else:
                    print(E)
                l2 = INV(l2)
            else:
                if l3 == L:
                    if l2 == L:
                        print(D)
                    else:
                        print(E)
                    l2 = INV(l2)
                else: 
                    print(E)
                l3 = INV(l3)
