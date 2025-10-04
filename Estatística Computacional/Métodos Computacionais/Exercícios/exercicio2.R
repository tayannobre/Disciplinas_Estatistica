## EXERCÍCIO 2

# Gerando uma distribuição T de n = 100 e 3 graus de liberdade
q = 1.96; q # valor crítico
df = 3; df # graus de liberdade
n = 100; n # tamanho da amostra

# Gerando a amostra
set.seed(1234) # fixando a semente
x = rt(n,df); x

# Calculando a proporção
mean(x<=q) # devolve a proporção dos valores gerados menores que 1.96


## EXERCÍCIO 2.1 - ESTIMAR O VALOR DA INTEGRAL
set.seed(123) # fixando a semente
n = 10000; n # quantidade de valores gerados
a = 0; a # intervalo a
b = 2*pi; b # intervalo b

x =  runif(n, a, b) # criando um vetor uniforme
x

i_test = (b-a) * mean((sin(x)- cos(x))^2) #  estimando a integral
i_test
