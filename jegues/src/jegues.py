import collections
import sys

competidores = sys.stdin.readlines()

def telemetria(checkpoint, dados):
    dados = list(sorted(dados.items()))
    print('{} {} {} {}'.format(checkpoint, dados[0][1],dados[1][1],dados[2][1]))
    

venc_t1 = {}
venc_t2 = {}
venc_chegada = {}
for comp in competidores:
    nome, t1, t2, chegada = comp.rstrip('\n').split(' ')
    venc_t1[int(t1)] = nome
    venc_t2[int(t2)] = nome
    venc_chegada[int(chegada)] = nome

telemetria('T1', venc_t1)
telemetria('T2', venc_t2)
telemetria('CHEGADA', venc_chegada)