def calcula(a, b):
    L = list(range(1, a+1))
    p = b-1
    while len(L) > 1:
        while p >= len(L):
            p = p - len(L)
        del(L[p])
        p = p + b-1
    return L[0]
    
while True:
    try:
        s = input().split()
        a = int(s[0])
        b = int(s[1])
        print(calcula(a, b))
    except:
        break
