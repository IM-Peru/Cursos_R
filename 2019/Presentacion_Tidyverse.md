---
title: "Introducci�n al tidyverse"
author: "GTRM Peru"
date: "25/11/2019"
output: 
  ioslides_presentation:
    logo: assets/img/lama_gtrm.png
    css: test.css
    transition: slower
    widescreen: true
    smaller: true

---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
```

# Transformaci�n de datos en R

Introducci�n al tidyverse!


## Qu� es el tidyverse?

El "tidyverse" es un grupo de paquetes utilizado (sobre todo) para la manipulaci�n de datos en R.

 ![](assets/img/tidyverse.png) 
 
 <br>
 <br>
 Esta sesi�n se concentrar� solo sobre algunas funcionalidades del tidyverse, en particular:
 
 - **tidyr** 
 - **dplyr**
 

## Qu� vamos a aprender

- **Importar** datos
- **Sumar y agregar** datos
- **Filtrar** valores
- **Seleccionar** variables
- **Cambiar formato** de datos (ancho-largo)
- **Crear** nuevas variables
- **Combinar** tablas



## Empezamos!

- Creamos un nuevo archivo script: File > New File > R Script
- Guardarlo como "20191125_Ejercicios R"

 ![](assets/img/screenshot.png) 

<br>

- Esto ser� el script para nuestra sesi�n. Guardarlo periodicamente!

## Instalar tidyverse

Antes de empezar, necesitamos instalar tidyverse (y un otro paquete para importar archivos Excel). Podemos ingresar este c�digo en la console:


```{r}

install.packages("tidyverse")
install.packages("readxl")

```

En nuestro script vamos a poner el c�digo siguiente:

```{r}

library("tidyverse")
library("readxl")

```

## Importar datos en R

**Para nuestro ejercicio vamos a utilizar los datos del RMRP 2020 Per�. **

Los datos son en un archivo Excel con dos pesta�as: 

- **Actividades planeadas** por los socios a nivel de departamento y de sector;
- **Proyecciones** de poblaci�n total y c�lculo de **personas con necesidades**;

Para importar los datos, vamos a utilizar la funci�n "read_excel" y guardarlos en dos tablas:

```{r}

Actividades <- read_excel(path="Datos/20191125_RMRP_Datos.xlsx", sheet="Actividades")

Proyecciones <- read_excel(path="Datos/20191125_RMRP_Datos.xlsx", sheet="Poblaci�n")

```

## Visualizar los datos

Podemos utilizar la funci�n "dim" para tener una idea de las dimensiones de nuestros datos:

```{r}

dim(Actividades)
dim(Proyecciones)

```

Utilizamos funci�n "str" para ver la estructura de los datos:


```{r}

str(Actividades)
str(Proyecciones)

```

La funci�n "summary" nos permite de ver m�s detalles:


```{r}

summary(Actividades)
summary(Proyecciones)

```

## Armonizar formatos de tablas

Las tablas incluyen datos sobre n�mero de actividades y proyecciones poblacionales a nivel de departamento.

<br>

**Sin embargo, los dos formatos son diferentes!**

<br>

- En Proyecciones, cada departamento es una fila �nica;
- En Actividades, los departamentos se repiten para cada organizaci�n y cada sector.

<br>
Para conducir un an�lisis, queremos **armonizar los formatos y juntar las tablas.**


## Antes de empezar: c�mo hacer un tubo!


Ya conocemos c�mo formular las funciones de R y asignar el valor a una nueva variable:

```{r}

Var2 <- funci�n(Var1)

```
Pero c�mo hacemos si queremos aplicar dos o m�s funciones consecutivas a una variable?

```{r}

Var2 <- funci�n1(Var1)

Var3 <- funci�n2(Var2)

Var3 <- funci�n3(Var3)

...

```

Esto es un proceso **ineficiente**.


## Antes de empezar: c�mo hacer un tubo! (2)



El paquete "dplyr" del tidyverse nos permite juntar nuestros pasos a trav�s del operador " %>% ":

```{r}

Var2 <- Var1 %>% 
  funci�n1 %>% 
  funci�n2

```

 ![](assets/img/dplyr_operator.png){ width=50% }

Pueden a�adir este operador con ctrl + shift + M.

## Sumar y agregar datos

Primero, queremos agregar los datos a nivel de sector y departamento (sin considerar las organizaciones).

Para sumar los valores, utilizamos la funci�n "summarise":

 ![](assets/img/summarise.png){ width=50% }

## Sumar y agregar datos (2)

En nuestro script:

```{r}

Actividades_Agregadas <- Actividades %>% 
  group_by(Departamento, Sector) %>% 
  summarise(Actividades_sum = sum(Actividades))

```

Hemos creado una nueva tabla "Actividades_Agregadas" con valores sumados para cada departamento y sector!


## Filtrar valores

En mi tabla, hay valores para actividades nacionales, donde no se espec�fican los departamentos.

Para nuestro ejercicio, no queremos considerar estas actividades porqu� queremos comparar los departamentos.

Los podemos filtrar a trav�s de la funci�n "filter":

 ![](assets/img/filter.png){ width=50% }
 
 <br>
 En nuestro script:

```{r}

Actividades_Agregadas <- filter(Actividades_Agregadas, Departamento != "Nacional")

```


## Cambiar estructura de la tabla

A�n no podemos comparar bien nuestras tablas. Queremos una fila �nica para cada departamento!

La funci�n "spread" nos permite hacer justamente esto:

 ![](assets/img/spread.png){ width=80% }

En nuestro script:

```{r}

Actividades_Agregadas <- Actividades_Agregadas %>% 
  spread(Sector, Actividades_sum)

```

Ahora nuestra tabla tiene una fila para cada departamento.

## Seleccionar variables

Nuestra nueva tabla "Actividades_Agregadas" contiene columnas para cada sector. Podemos seleccionar las columnas que nos interesan a trav�s de la funci�n "select":

 ![](assets/img/select.png){ width=40% }


## Seleccionar variables

Para hacer nuestro an�lisis m�s sencillo, vamos a enfocarnos solamente sobre los sectores de **Protecci�n** e **Integraci�n**:


```{r}

Actividades_Agregadas <- select(Actividades_Agregadas, Departamento, Protecci�n, Integraci�n)

```

## A�adir nuevas columnas

Antes de combinar nuestras tablas, queremos tener una columna con el **total de actividades en cada departamento**.

La funci�n "mutate" nos permite hacer esto:

 ![](assets/img/mutate.png){ width=60% }

<br>

En nuestro script:

```{r}

Actividades_Agregadas <- Actividades_Agregadas %>% 
  replace(is.na(.), 0) %>%
  mutate(Sum_Act = Protecci�n + Integraci�n)


```

## By the way..

Gracias al operador " %>% ", todos estos pasos pueden ser hechos conjuntamente!

```{r}

Actividades_Agregadas <- Actividades %>% 
  group_by(Departamento, Sector) %>% 
  summarise(Actividades_sum = sum(Actividades)) %>% 
  spread(Sector, Actividades_sum) %>% 
  replace(is.na(.), 0) %>%
  mutate(Sum_Act = Protecci�n + Integraci�n)

```

 ![](assets/img/surprised_lama.jpg){ width=20% }


## Combinar tablas

Para hacer nuestro an�lisis, queremos juntar nuestras dos tablas en una.

R nos permite hacer esto gracias a la funci�n "join".

Hay cuatro tipos de join:


 ![](assets/img/join.png) 


## Combinar tablas

Para nuestra tabla, vamos a utilizar la funci�n "left_join":

```{r}

colnames(Proyecciones)[1] <- "Departamento"

RMRP_Datos <- left_join(Proyecciones, Actividades_Agregadas, by = "Departamento")

```


Luego podemos verificar que todos los datos sean combinados:

```{r}

summary(RMRP_Datos)
summary(Actividades_Agregadas)

```


## Revisiones finales


Dado que nuestro an�lisis va a ser solo sobre Protecci�n e Integrac�on, no necesitamos otros sectores:

```{r}

RMRP_Datos <- select(RMRP_Datos, Departamento, contains("Proyeccion"), contains("Protecci�n"),
contains("Integraci�n"), Sum_Act)

```

## Para recapitular

- **Importar** datos: read_excel
- **Sumar y agregar** datos: summarise
- **Filtrar** valores: filter
- **Seleccionar** variables: select
- **Cambiar formato** de datos (ancho-largo): spread
- **Crear** nuevas variables: mutate
- **Combinar** tablas: join


