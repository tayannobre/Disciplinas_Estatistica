# NOME: TAYAN DA SILVA NOBRE 

# QUESTÃO 1: Se x0 = 5 e xn = 3x(n-1) mod150, encontre x1,x2,...,x30.

gcl <- function(n = 30, x0 = 5, mod = 150) {
  x <- numeric(n + 1)
  x[1] <- x0
  for (i in 2:(n + 1)) {
    x[i] <- (3 * x[i - 1]) %% mod
  }
  
  return(x)
}

gcl(30)

# QUESTÃO 2: Se x0 = 3 e xn = (5xn-1+7) mod150, encontre x1,x2,...,x10.

gcl2 <- function(n = 10, x0 = 3, a = 5, c = 7, mod = 150) {
  x <- numeric(n + 1)
  x[1] <- x0
  
  for (i in 2:(n + 1)) {
    x[i] <- (a * x[i - 1] + c) %% mod
  }
  
  return(x)
}

gcl2(10)


# QUESTÃO 3: Compare sua estimativa com o valor exato

# a) ∫_0^1 exp(-x^2) dx

set.seed(1234)

n = 10000

u = runif(n,0,1); u

mean(exp(-u^2)) * (1-0)

# b) ∫_0^1 (1 - x^2)^3 dx

u = runif(n,0,1)

mean((1-u^2)^3) * (1-0)

# c) ∫_-2^2 exp(x + x^2) dx

u <- runif(n, -2, 2)
mean(exp(u + u^2)) * (2 - (-2))