# 1. Introdução

O banco de dados happiness.xls contém dados sobre o grau de felicidade de 122 países, a aprtir das variáveis: 
- **Hemisphere**
- **HDI (Indice de Desenvolvimento Humano)**
- **GDP_PerCapita (PIB Per Capita)**
- **Beer_PerCapita (Consumo de cerveja)**
- **Spirit_PerCapita (Consumo de álcool destilado)**
- **Wine_PerCapita (Consumo de vinho)**

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

```

![Image](https://github.com/user-attachments/assets/dc34217e-f11a-4007-910e-5aa594fe94f5)

📌 Comentários
- O boxplot mostra a existência de outliers (11) na distribuição, sendo todos eles no limite superior
- Quais países representam esses outliers outliers ?


### Descobrindo quais países são oultiers

``` r
## Calculando os limites do box plot
happiness_out = boxplot(happiness$GDP_PerCapita, plot = F)
outliers = happiness_out$out

## Mostrando países que são ouliers
happiness[happiness$GDP_PerCapita %in% outliers, c("Country", "GDP_PerCapita")]

```

| Country        | GDP_PerCapita |
|----------------|---------------|
| Denmark        | 53.6          |
| Switzerland    | 79.9          |
| Iceland        | 60.5          |
| Norway         | 70.9          |
| Australia      | 49.9          |
| Sweden         | 51.8          |
| United States  | 57.6          |
| Ireland        | 64.1          |
| Luxembourg     | 101.0         |
| Singapore      | 55.2          |
| Qatar          | 59.3          |

📌 Comentários
- Após a execução do código, foi gerada uma tabela que apresenta os países que são outliers, conforme ilustrado acima

# 4.  Analise Descritiva da variável Wine_PerCapita

``` r

attach(happiness)

# Sumário da variável
summary(Wine_PerCapita)

# Variância da variável
var(Wine_PerCapita)

# Desvio padrão da variável
sd(Wine_PerCapita)

```

📌 Comentários
- Após a execução do código, foi gerado os seguintes resultados abaixo:

| Medida         | Resultado |
|----------------|---------------|
| Minimo         | 1.0         |
| 1 quartil      | 5.0          |
| Mediana        | 16.0          |
| Média          | 66.6          |
| 3 quartil      | 112.8          |
| Máximo         | 370.0          |
| Desvio padrão  | 88.1215          |
| Variância      | 7765.399          |

## Visualiando a assimetria da distribuição e verifcando a existência de outliers

```r
ggplot(happiness, aes(x = "", y = Wine_PerCapita)) +
  geom_boxplot(fill = "lightblue", outlier.color = "red", outlier.shape = 8) +
  labs(title = "Boxplot do PIB per capita", y = "Wine per capita") +
  theme_minimal() + 
  coord_flip()

````

![Image](https://github.com/user-attachments/assets/be2f6e8a-37b1-48af-b8e0-11a09c579be0)

📌 Comentários 
- Como pode ser visto no boxplot acima, temos uma distribuição assimetrica a direita;
- A **mediana** está mais próxima da parte inferior da caixa, mostrando que a maior parte da distribuição está concentrada nos
  valores menores;
- Alguns outliers puxam a cauda para a direita
