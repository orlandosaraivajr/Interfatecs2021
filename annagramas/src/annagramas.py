def incdec(d, carac, v):
    if carac not in d:
        d[carac] = v
    else:
        d[carac] += v
    return d

def verifica(subS, S):
    d = {}
    for s in S:
        d = incdec(d, s, 1)
    for s in subS:
        d = incdec(d, s, -1)
    return 1 if all(valor == 0 for valor in d.values()) else 0

NCasos = int(input())
for contCasos in range(NCasos):
    S1 = input().strip()
    S2 = input().strip()
    if len(S2) > len(S1):
        print('ERRO')
    else:
        ContResult = 0
        janelaS1 = (S1[i:i+len(S2)] for i in (a for a in range(len(S1)-len(S2)+1)))
        for parteS1 in janelaS1:
            ContResult += verifica(S2, parteS1)
        print(ContResult)
