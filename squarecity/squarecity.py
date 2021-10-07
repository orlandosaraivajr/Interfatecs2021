import math
x = int(input(''))

M = []
for i in range(x):
    linha = []
    for j in range(x):
        linha.append('0')
    M.append(linha)

c = math.ceil(x/2)-1
for i in range(x):
    for j in range(x):
        D = max(abs(i-c),abs(j-c))
        M[i][j] = D


#for i in range(x):
#    print(M[i])

cont = 0 
for i in range(x):
    for j in range(x):
        if M[i][j] % 2 != 0:
            M[i][j] = 'C'
        else:
            M[i][j] = 'R'

        if i == j:
            M[i][j] = 'A'

        if M[i][j] == 'C':
            cont = cont + 1

#for i in range(x):
#    print(M[i])

print(cont)