# AVALIAÇÃO 1 - TAYAN DA SILVA NOBRE - MATRICULA: 542493

# QUESTÃO 1 - Se x0 = 10 e xn = 3xn-1 mod150, encontre x1, x2, ..., x10.

gcl <- function(n = 10, x0 = 10, mod = 150) {
  x <- numeric(n + 1)
  x[1] <- x0
  for (i in 2:(n + 1)) {
    x[i] <- (3 * x[i - 1]) %% mod
  }
  
  return(x)
}

gcl(10)

# QUESTÃO 2 - Crie uma função para listar os elementos de uma série de Fibonacci.

fibonacci <- function(n) {
  if (n <= 0) return(integer(0))
  if (n == 1) return(0)
  if (n == 2) return(c(0, 1))
  
  fib <- numeric(n)
  fib[1] <- 0
  fib[2] <- 1
  
  for (i in 3:n) {
    fib[i] <- fib[i - 1] + fib[i - 2]
  }
  
  return(fib)
}

fibonacci(10)

# QUESTÃO 3 - Observe o código abaixo (escolha a linguagem de preferência)

r <- 23
birthdays <- sample(1:365, r, replace = TRUE)
any(duplicated(birthdays))

set.seed(123) #reprodutibilidade

r <- 23
B <- 10000

acertos <- 0
i <- 0

repeat { 
  i <- i + 1
  bdays <- sample(1:365, r, replace = TRUE)
  acertos <- acertos + as.integer(any(duplicated(bdays)))
  if (i >= B) break
}

p_hat <- acertos / B
p_hat

# a) Comente a função - A função apresenta o problema do aniversário. Foi sorteado aleatoriamente
# 23 pessoas(r), esse experimento foi repetido 10.000 vezes, no final deu o valor 0.5073 (probabilidade de que pelo menos duas pessoas compartilhem o mesmo aniversário).

# b) Existe algum erro na função? Se sim, corrija.

# A função está correta, rodou perfeitamente bem.

