#Matrizes(elementos de mesma classe)

e <- matrix(ncol = 2, nrow = 2, data = 1:4)
e[2,1]
e
e[2,]
e[,2]
e[1:2]
e[,1:2]
e[1:2,1]
as.data.frame(e) #Converte matriz e vetor em dataframe

#Lista (um tipo especial de vetores com diferentes classes)

i<-list(2, 3,"c", "d", FALSE, 2+3i, 4+2i)
class(i[1])
class(i[5])

#Ordenação de dados

library(dslabs)
install.packages("dslabs")
data(murders)

#Sort (bota os elementos em ordem crescente)
sort(murders$total)
index <- order(murders$total)
murders$total[index]

#Order (responde a pergunta: "No vetor oroginal, qual a posição do 1 elemento após a ordenação?")
order(murders$total, decreasing = TRUE)

x <- c(31,4,15,92,65)
x[1]
x
sort(x)
index <- order(x)
x[index]

#Rank(mostra qual a posição dos elementos do vetor orignal, por exemplo 31 é o 3 maior)
rank(x)

murders$state[1:10]
murders$abb[1:10]
murders$abb[index]
murders$state[index]

max(murders$total)
i_max <- which.max(murders$total)
i_max
murders$state[i_max]

i_min <- which.min(murders$total)
i_min
murders$state[i_min]
pop <- murders$population
sort(pop)
min(pop)
