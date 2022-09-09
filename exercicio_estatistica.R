##Concurso

library(readr)

install.packages("readr")

tabela <- read.csv2("notas_concurso2.csv")

summary(tabela)

quantile(tabela$Nota.Final)

probs = seq(.1,.9,by = .1)

quantile(tabela$Nota.Final,probs = seq(.1,.9,by=.1))

quantile(tabela$Nota.Final,probs = seq(.1,.99,by=.01))

mean(tabela$Nota.Final)

median(tabela$Nota.Final)

boxplot(tabela,ylab='Notas.Finais')

breaks <- seq(from=min(tabela$Nota.Final),to=max(tabela$Nota.Final),length=11)

notas_frequencia <- cut(tabela$Nota.Final, breaks= breaks, right = TRUE, include.lowest = TRUE)

table(notas_frequencia)

hist(tabela$Nota.Final,breaks=breaks)

hist(tabela$Nota.Final,freq=FALSE)

lines(density(tabela$Nota.Final),lwd=3,col="blue")



##Precipitacao
tabela1 <- read.csv2('precipitacao_df.csv')
summary(tabela1)

quantile(tabela1$Precipitacao)

probs1 = seq(.1,.9,by = .1)

quantile(tabela1$Precipitacao,probs = seq(.1,.9,by=.1))

mean(tabela1$Precipitacao)

median(tabela1$Precipitacao)

boxplot(tabela1,ylab='Precipitacao')

breaks <- seq(from=min(tabela1$Precipitacao),to=max(tabela1$Precipitacao),length=11)

notas_frequencia <- cut(tabela1$Precipitacao, breaks= breaks, right = TRUE, include.lowest = TRUE)

table(notas_frequencia)

hist(tabela1$Precipitacao,breaks=breaks)

hist(tabela1$Precipitacao,freq=FALSE)

lines(density(tabela1$Precipitacao),lwd=3,col="blue")

