# GERAR NÚMEROS ALEATÓRIOS DE UMA DISTRIBUIÇÃO GEOMÉTRICA(SIMULÇÃO)

# Usando a função "rgeom"

n1 = 1000
p1 = 0.5

amostra1 = rgeom(n, p)
amostra1

# Usando a função "sample"

n2 = 1000
x  = 1:4
p2 = 0.3
pro = (1-p)^(x-1)*p

amostra2 = sample(x, n2, replace = T, prob = pro)
amostra2