2 + 2

sqrt(2)

# creando variables
raiz_dos <- sqrt(2)
mi_primera_variable <- sqrt(2)

# los variables no se actualizan automaticamente como en Excel
x <- 2
y <- x + 2
x<-3
y <- x + 2

vector1 <- c(3, 5, 2)
vector1

vector2 <- 5:50
vector2

mi_media <- mean(vector2)


vector1 <- c(3, 5, 6.1, 7)
vector1[2]

vector1[4]
vector1[-4]

vector7 <- c(2, "hola")
vector7

lista1 <- list(2, "hola")

mi_agenda <- list(Carlos = c(tel = 41232342),
                  Maria = c(tel = 25362819, edad = 25))
mi_agenda$Carlos

library("readr")

install.packages("readr")

library("tidyverse")

?sum

Vector1 # error

# puedo especificar el paquete al que pertenece la funcion
stats::filter()

dplyr::filter()

filter()

# hola soy violeta

mes <- 1:30

library(readr)
decisiones_asilo_peru <- read_csv("data/decisiones_asilo_peru.csv")
View(decisiones_asilo_peru)

str(decisiones_asilo_peru)



