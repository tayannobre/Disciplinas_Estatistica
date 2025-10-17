# 1. Introdução

O banco de dados **p41b.xlsx** contém dados sobre o grau de felicidade de 122 países, a partir de algumas variáveis abaixo: 

- **Hemisphere (Hemisfério norte e sul)**;
- **HDI (Indice de Desenvolvimento Humano)**;
- **GDP_PerCapita (PIB Per Capita)**;
- **Beer_PerCapita (Consumo de cerveja)**;
- **Spirit_PerCapita (Consumo de álcool destilado)**;
- **Wine_PerCapita (Consumo de vinho)**;

---
# Dados. 

- **p41b.xlsx** - banco de dados que contém informações sobre o grau de felicidade de 122 países.

# 1.1. Neste relatório, serão realizadas:

-   Análise descritiva;
-   Criação de gráficos para entender a distribuição;
-   Estudo de correlação.


# 2. Importação e preparação dos dados

``` r 
# IMPORTANDO O ARQUIVO p41b.xlsx

# 2.1. Instalando o pacote
install.packages("readxl")

# 2.2 Carregando o pacote
library(readxl)

# 2.3 Leitura do arquivo do arquivo 
happiness = read_excel("p41b.xlsx")

# 2.4 Visualização as primeiras 5 linhas do arquivo
head(happiness)

```
### Tabela: Recorte do banco de dados de felicidade

A tabela abaixo apresenta um recorte do conjunto de dados, com informações sobre alguns países do Hemisfério Norte e suas respectivas variáveis socioeconômicas e de consumo.

| Nº | Country     | Region          | Hemisphere | HappinessScore |  HDI | GDP_PerCapita | Beer_PerCapita | Spirit_PerCapita | Wine_PerCapita | logwine  | loggdp  |
|----|--------------|-----------------|-------------|----------------|------|----------------|----------------|------------------|----------------|----------|---------|
| 1  | Denmark      | Western Europe  | north       | 7.526          | 928  | 53.579         | 224            | 81               | 278            | 2.444045 | 1.728995 |
| 2  | Switzerland  | Western Europe  | north       | 7.509          | 943  | 79.866         | 185            | 100              | 280            | 2.447158 | 1.902362 |
| 3  | Iceland      | Western Europe  | north       | 7.501          | 933  | 60.530         | 233            | 61               | 78             | 1.892095 | 1.781971 |
| 4  | Norway       | Western Europe  | north       | 7.498          | 951  | 70.890         | 169            | 71               | 129            | 2.110590 | 1.850585 |
| 5  | Finland      | Western Europe  | north       | 7.413          | 918  | 43.433         | 263            | 133              | 97             | 1.986772 | 1.637820 |
| 6  | Canada       | North America   | north       | 7.404          | 922  | 42.349         | 240            | 122              | 100            | 2.000000 | 1.626843 |

--

# 3. Visualizando outliers em **GDP_PerCapita**

``` r
# 3.1. Instalando pacote necessário
install.packages("ggplot2")

# 3.2. Carregando o pacote
library(ggplot2)

# 3.2. Plotando box plot para a visualização de outliers
ggplot(happiness, aes(x = "", y = GDP_PerCapita)) +
  geom_boxplot(fill = "lightblue", outlier.color = "red", outlier.shape = 8) +
  labs(title = "Boxplot do PIB per capita", y = "GDP per capita") +
  theme_minimal() + 
  coord_flip()

```

![Image](https://github.com/user-attachments/assets/dc34217e-f11a-4007-910e-5aa594fe94f5)

📌 Comentários
- O boxplot mostra a presença de 11 outliers na distribuição, todos situados no limite superior.
- Quais países representam esses outliers e o que eles têm em comum?
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
- Os paises listados na tabela acima têm em comum o **alto nível de desenvolvimento humano**, principalmente caracterizado pela **alta renda per capita**.

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
| Mínimo         | 1.0         |
| 1º quartil      | 5.0          |
| Mediana        | 16.0          |
| Média          | 66.6          |
| 3º quartil      | 112.8          |
| Máximo         | 370.0          |
| Desvio padrão  | 88.1215          |
| Variância      | 7765.399          |

## Visualizando a assimetria da distribuição e verifcando a existência de outliers

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


# 6. Box plot da variável **HapinessScore** por hemisfério

```r
ggplot(happiness, aes(x = Hemisphere, y = HappinessScore)) +
  geom_boxplot(width = .2, outlier.color = "red", outlier.shape = 8) +
  ggtitle("Box plot do Happiness Score por Hemisferio")

```
![Image](https://github.com/user-attachments/assets/98f478bb-ff61-4051-8e1b-1770f30a0514)

📌 Comentários

- O boxplot acima evidência que os países do hemisfério norte tendem apresentar maiores níveis de felicidade em comparação aos do hemisfério sul, com menor dispersão dos valores;
- Norte: distribuição aproximadamente simétrica;
- Sul: distribuição assimétrica a direita;
- Ambos gráficos não apresentam valores extremos.


# 7. Correlação entre **HapinessScore** e **Wine_PerCapita**

```r
cor(HappinessScore, Wine_PerCapita)

```
📌 Comentários

- Ao executar o código foi obtido o score de **0.4505886**, evidenciando uma correlação postiva moderada;
- Correlação não implica causualidade.
