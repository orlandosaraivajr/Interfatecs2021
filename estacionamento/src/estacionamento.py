import sys

placas = sys.stdin.readlines()

TOTAL_VAGAS = 15
vagas = {}
for placa in placas:
    p = list(placa.strip())
    posicao = 0
    for c in p:
        v = ord(c) if c.isalpha else c
        posicao = posicao + int(v)

    if not ((posicao % TOTAL_VAGAS)+1) in vagas:
        vagas[(posicao % TOTAL_VAGAS)+1] = placa.rstrip('\n')
    
for k,v in sorted(vagas.items()):
    print('{} {}'.format(k,v))