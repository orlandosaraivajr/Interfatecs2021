def simetria(x,y):
    if (x <= 0 or y <= 0 or (x==y)):
      return 'ERRO'

    return '{} {}\n{} {}\n{} {}\n{} {}\n{} {}\n{} {}\n{} {}\n{} {}'.format(
      x,y,
      y,x,
      y,-x,
      x,-y,
      -x,-y,
      -y,-x,
      -y,x,
      -x,y,
    )

x, y = input('').split(' ')
print(simetria(int(x),int(y)))

