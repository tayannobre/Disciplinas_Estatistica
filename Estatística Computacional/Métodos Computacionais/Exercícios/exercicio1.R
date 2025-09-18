#Aula de Metodos Computacionais - 17-09-2025

# Questao 1 - ok!
# Maneiras diferentes de criar um vetor de 1 até 15.
x <- c(5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15); x
x <- 5:15
x <- seq(5, 15, by = 1)

mean(x) #media
sd(x) #desvio padrao
var(x) #variancia
median(x) #mediana
quantile(x, probs = seq(0.25, 0.75, by = 0.25)) # quartis(25%, 50%, 75%)
quantile(x, probs = seq(0.1, 0.9, by = 0.1)) # Decis(10%, 20%, …, 90%)
quantile(x, probs = seq(0.2, 0.8, by = 0.2)) # Quintis parciais (20%, 40%, 60%, 80%)


# Questao 2 - criar um vetor de 0 até 5 com um intervalo de 0.5
y <- seq(0, 5, by = 0.5)
y

# Questao 3 - divisão inteira e resto
14%/%7

14%%7

#Questao 4 - operações vetoriais

x <- 1:4; x 

x + c(10, 20) # aqui é repetido (10,20,10,20)

# Questao 5 - Tipos e Classes

# Tipos
typeof(1); # "double" (número real)
typeof(1L); # "integer"
typeof(1 + 0i) # "complex"

# Classes 
class(1); # "numeric"
class(1L); # "integer"
class(1 + 0i) # "complex"


### Matrizes

#Cria matriz 2x2 preenchida por colunas.
A <- matrix(
  data = c(-3, 0.2, 893, 0.17),
  nrow = 2, #linha
  ncol = 2  #colunas
)


A

# byrow = FALSE (preenche por colunas, padrão)
matrix(data = c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = FALSE)

# byrow = TRUE (preenche por linhas)
matrix(data = c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE)

# junta por colunas
cbind(c(1,4), c(2,5), c(3,6))

# junta por linhas
rbind(c(1,4), c(2,5), c(3, NA))

# Propriedades da matriz

dim(A) # dimensão da matriz 
ncol(A) # número de colunas
nrow(A) # número de linhas


A <- matrix(c(0.3, 4.5, 55.3, 91, 0.1, 105.5, -4.2, 8.2, 27.9), nrow = 3, ncol = 3)

A[1,1] # elemento da linha 1, coluna 1
A[, 2] # segunda coluna inteira
A[, -2] # todas as colunas exceto a 2


diag(A) # extrai a diagonal
diag(4)          # matriz identidade 4x4
I5 <- diag(1, nrow = 5, ncol = 5) #forma explicita, identidade 5x5
I5

# OPERAÇÕES COM MATRIZES

# escalar vezes matriz
A <- rbind(c(2,5,2) , c(6,1,4)); A
a <- 2

a*A


# SOMA
A <- cbind(c(2,5,2), c(6,1,4))
A

B <-  cbind(c(-2,3,6), c(8.1,8.2,-9.8))
B

A + B

# SUBTRAÇÃO
A - B

# multiplicação matricial
A <- rbind(c(2,5,2), c(6,1,4))

dim(A)

B <-  cbind(c(3,-1,1), c(-3,1,5))

dim(B)

A%*%B
B%*%A

### Determinante, inversa e pseudoinversa
A <- matrix(data = c(3, 4, 1, 2), nrow = 2, ncol = 2)

A

solve(A) #inversa

det(A) # determinante

MASS::ginv(A) # pseudoinversa

# EXEMPLOS COM MATRIZES

# Cria uma matriz 4x2.
H <- matrix(data = c(4.3, 3.1, 8.2, 8.2, 3.2, 0.9, 1.6, 6.5),
       ncol = 2, nrow = 4, byrow = TRUE)
H       

# Criando uma função
matrix_test_32 <- function(x){

v_saida <- NULL
for(i in 1:nrow(x)){

v_saida[i] <- all(dim(x[-i,]) == c(3,2))       
}       

all(v_saida)    
}       
       
# A função acima recebe uma matriz x e faz o seguinte:

# Para cada linha i, remove essa linha (x[-i,]).

# Verifica se a matriz resultante tem dimensão 3x2.

# Armazena TRUE/FALSE em v_saida[i].

# Retorna TRUE apenas se todas as checagens deram certo.

# Ou seja: ela testa se ao remover qualquer linha de x, a matriz resultante é sempre 3x2 (isso só acontece se x for 4x2 originalmente).