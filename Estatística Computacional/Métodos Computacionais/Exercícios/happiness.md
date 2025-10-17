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
library(ggplot2

# 3.2. Plotando box plot para a visualização de outliers
ggplot(happiness, aes(x = "", y = GDP_PerCapita)) +
  geom_boxplot(fill = "lightblue", outlier.color = "red", outlier.shape = 8) +
  labs(title = "Boxplot do PIB per capita", y = "GDP per capita") +
  theme_minimal() + 
  coord_flip()

´´´
