# CARREGANDO O DATASET

fidelizacao = read.csv(file.choose(), sep = ",", header = T)
fidelizacao 

# CONVERTENDO O DATASET PARA DATAFRAME

fidelizacao = as.data.frame(fidelizacao)


# SUMÁRIO DO DATASET 

summary(fidelizacao)

# MÉDIA E MEDIANA DE CADA AVALIAÇÃO POR SITUAÇÃO

# MÉDIA POR SITUAÇÃO
aggregate(cbind(AVALIACAO.1, AVALIACAO.2, AVALIACAO.3) ~ Situacao,
          data = fidelizacao, FUN = mean)

# MEDIANA POR SITUAÇÃO
aggregate(cbind(AVALIACAO.1, AVALIACAO.2, AVALIACAO.3) ~ Situacao,
          data = fidelizacao, FUN = median)

# CORRELAÇÃO DAS VARIÁVEIS

cor(fidelizacao$AVALIACAO.1, fidelizacao$AVALIACAO.2)

cor(fidelizacao$AVALIACAO.1, fidelizacao$AVALIACAO.3)

cor(fidelizacao$AVALIACAO.2, fidelizacao$AVALIACAO.3)

# PLOTANDO GRÁFICOS DE DISPERSÃO PARA VERIFICAR A CORRELAÇÃO ENTRE AS VARIÁVEIS

plot(fidelizacao$AVALIACAO.1, fidelizacao$AVALIACAO.2)

plot(fidelizacao$AVALIACAO.1, fidelizacao$AVALIACAO.3)

plot(fidelizacao$AVALIACAO.2, fidelizacao$AVALIACAO.3)


