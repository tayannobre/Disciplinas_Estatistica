# 1. Introdução

O banco de dados happiness.xls contém dados sobre o grau de felicidade de 122 países, a aprtir das variáveis, 
**Hemisphere**, **HDI**, **GDP_PerCapita**, **Beer_PerCapita**, **Spirit_PerCapita** e **Wine_PerCapita**.

---

# 1.1. Neste relatório, serão realizadas:

-   análise descritiva;

-   correções de variáveis;

-   estudo de correlação com base no código fornecido.


# 2. Importação e preparação dos dados

``` r 
# IMPORTANDO O ARQUIVO happiness.xlsx

# 2.1. Instalando o pacote
install.packages("readxl")

# 2.2 Carregando o pacote
library(readxl)

# 2.3 Leitura do arquivo do arquivo 
happiness = read_excel("p41b.xlsx")

# 2.4 Visualização as primeiras 5 linhas do arquivo
head(happiness)

```

# 3. Visualizando outliers em **GDP_PerCapita**

``` r
# 3.1. Instalando pacote necessário
install.packages("ggplot2")

# 3.2. Carregando o pacote
library(ggplot2)

