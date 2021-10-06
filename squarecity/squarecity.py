x = int(input(''))

M = []
for i in range(x):
    linha = []
    for j in range(x):
        linha.append('0')
    M.append(linha)

C = round(x/2)-1

for i in range(x):
    for j in range(x):
        D = max(abs(i-C),abs(j-C))
        M[i][j] = D


#for i in range(N):
#    print(M[i])

CONT = 0 
for i in range(x):
    for j in range(x):
        if M[i][j] % 2 != 0:
            M[i][j] = 'C'
        else:
            M[i][j] = 'R'

        if i == j:
            M[i][j] = 'A'

        if M[i][j] == 'C':
            CONT = CONT + 1

#for i in range(N):
    #print(M[i])

print(CONT)