# IMPORTANDO O ARQUIVO happiness.xlsx

# 1. Instalando o pacote

install.packages("readxl")

# 1.1 Carregando o pacote

library(readxl)

# 1.2 Importando o arquivo 
happiness = read_excel("p41b.xlsx")
happiness 

head(happiness)

View(head(happiness))
# 2. Visualizando quais países são outliers em um box plot da variável 'GDP_PerCapita'

## Visualiando a distribuição geral

install.packages("ggplot2") # Instalando a biblioteca

library(ggplot2) # Carregando a biblioteca


## Gerando o box plot

ggplot(happiness, aes(x = "", y = GDP_PerCapita)) +
  geom_boxplot(fill = "lightblue", outlier.color = "red", outlier.shape = 8) +
  labs(title = "Boxplot do PIB per capita", y = "GDP per capita") +
  theme_minimal() + 
  coord_flip()


# Descobrindo quais países são ouliers

## Calculando os limites do box plot
happiness_out = boxplot(happiness$GDP_PerCapita, plot = F)
outliers = happiness_out$out

## Mostrando países que são ouliers

happiness[happiness$GDP_PerCapita %in% outliers, c("Country", "GDP_PerCapita")]


# 3. Fazendo uma análise descritiva da variável 'Wine_PerCapita', visualizar se segue uma distribuição simétrica.
# Se tem outliers e o que acontece a assimteria e coms os outliers quando é feita uma transformação logarítmica da variável (logwine).

attach(happiness)

summary(Wine_PerCapita) # Sumário da variável

var(Wine_PerCapita) # Variância da variável
sd(Wine_PerCapita) # Desvio padrão da variável 

# Visualiando a simetria da distribuição e verifcando a existência de outliers

ggplot(happiness, aes(x = "", y = Wine_PerCapita)) +
  geom_boxplot(fill = "lightblue", outlier.color = "red", outlier.shape = 8) +
  labs(title = "Boxplot do PIB per capita", y = "Wine per capita") +
  theme_minimal() + 
  coord_flip()



# 4 - Analisando o banco de dados atentamente percebi que a variável 'Hemisphere'contém alguns erros, tinha hemisférios classificado como 'noth' ao inves de 'north'.

## 4.1 - Corrigindo os erros da variável 'Hemisphere'

attach(happiness)

table(Hemisphere) # Visualizando a variável 'Hemisphere' com erro

happiness$Hemisphere[happiness$Hemisphere =="noth"] ="north"

happiness$Hemisphere[happiness$Country %in% c("Brazil", "Peru", "Kenya")] = "south" # Corrigindo o erro 

happiness$Hemisphere[happiness$Country %in% c("Colombia", "Ecuador")] = "north" # Corrigindo o erro 


table(Hemisphere) # Visualizando a variavél corrigida

# 5 - Após a a correção da variável 'Hemisphere' irei mostrar através de boxplot que se há diferença na distribuição do "HappinessScore" nos países do hemuisférios norte sul.

## 5.1 - Criando o box plot

ggplot(happiness, aes(x = Hemisphere, y = HappinessScore)) +
  geom_boxplot(fill = "lightblue", width = .2, outlier.color = "red", outlier.shape = 8) +
  ggtitle("Box plot do Happiness Score por Hemisferio")

# 6 - Verificando a correlação entre 'HappinessScore' e 'Wine_PerCapita'.

## 6.1 - Calculando a correlação entre as duas variáveis

cor(HappinessScore, Wine_PerCapita) 

# Salvando o arquivo em csv

write.csv(happiness, "happiness.csv", row.names = F)