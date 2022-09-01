tabela <- read.csv2("imoveis.csv")

plot(tabela$area,tabela$valor,type = "p",pch = 16, col = "blue")

lm(tabela$valor ~ tabela$area)

abline(lm(tabela$valor ~ tabela$area))

cov(tabela)

cor(tabela)

tabela1 <- read.csv2("vazao_canal_estatistica.csv")

plot(tabela1$tempo, tabela1$volume, type = "p", pch = 16, col = "green")

lm(tabela1$volume ~ tabela1$tempo)

abline(lm(tabela1$volume ~ tabela1$tempo))

cov(tabela1)

cor(tabela1)

cor(tabela1)^2
