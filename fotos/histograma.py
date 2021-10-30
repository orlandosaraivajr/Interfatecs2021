import sys

nk = sys.stdin.readlines()
nk = [int(i) for i in nk]
n = sum(nk)
pr = [round(x / n,3) for x in nk]

for elem in pr:
    print('{:.3f}'.format(elem))