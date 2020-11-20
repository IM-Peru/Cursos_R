library(readxl)
DB <- read_excel("C:/Users/OIM/Desktop/Taller R - IMWG/DB.xlsx")
head(DB)
attach(DB)
str(DB)
summary(Edad)
hist(Edad)
plot(Edad, Cantidad_dias)
plot(Edad, Cantidad_dias, pch=20)

###exporting graphics

jpeg("test.jpeg") #opens a device
plot(Edad, Cantidad_dias)
dev.off() #closes the graphic device/ must do this

library(ggplot2)
# aesthetics
gr0 <- ggplot(DB, aes(x = Sexo))
gr0

# barplot
gr1 <- ggplot(DB, aes(x = Sexo)) + geom_bar()
gr1

# reduciendo el ancho de las barras

gr1 <- ggplot(DB, aes(x = Sexo)) + geom_bar(width=0.5)
gr1

# coloreando
gr1 <- ggplot(DB, aes(x = Sexo)) + geom_bar(width=0.5, colour="black", fill="blue") ##colour = border #fill=interior
gr1

# añadiendo etiquetas

gr1 <- ggplot(DB, aes(x = Sexo)) + 
  geom_bar(width=0.5, colour="black", fill="blue") +
  geom_text(aes(label=..count..),stat="count",vjust = -.25)

### change vjust por position=position_stack(0.5))

## limites a los gráficos

gr1 + scale_y_continuous(limit = c(0, 300))

#añadiendo capas para nombre de etiquetas

gr1 + xlab("Genero") + ylab ("Número de casos")# etiquetas de los ejes

#añadiendo titulos

gr1 + xlab("Sexo") + ylab ("Número de casos") + 
  ggtitle("Sexo del entrevistado")

#temas de fondo
gr1 + xlab("Sexo") + ylab ("Número de casos") + 
  ggtitle("Sexo del entrevistado") + theme_light() #theme_classic #theme_bw

#points
points<- ggplot(DB, aes(x = Edad, y = Cantidad_dias)) + 
  geom_point(aes(colour = Sexo))

points

#time-series
time<- ggplot(DB, aes(x = Fecha_llegada, y = Dinero_disponible)) +
  geom_line() +
  labs(title = "Dinero disponible por fecha de llegada",
       x = "Fecha de llegada",
       y = "Dinero disponible")
time

##con porcentajes
##Ejercicio

library(scales)

gr2 <- ggplot(DB, aes(x = Sexo)) + 
  geom_bar(aes(y = (..count..)/sum(..count..))) + 
  scale_y_continuous(labels=scales::percent, limits = c(0,1))

##Otros ejercicios
#histograma
hist <- ggplot(DB, aes(Edad)) + geom_histogram(binwidth = 10,fill="red", colour="black")
#adicional
hist + facet_grid(Sexo ~.) 

#curva de densidad
dens<-ggplot(DB, aes(Edad)) + geom_line(stat="density") + facet_grid(Sexo ~.)
dens

#juntando ambas curvas
#geom_line
dens2<-ggplot(DB, aes(Edad, colour=Sexo)) + 
  geom_line(stat="density") +
  xlim(18, 100)
dens2
#geom_density
dens3<-ggplot(DB, aes(Edad, colour=Sexo)) + 
      geom_density()
dens3

#paquetes de ayuda
#1. esquisse
install.packages("esquisse")
library(esquisse)
esquisse::esquisser() 




