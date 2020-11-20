---
title: "Capacitaci�n en R"
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

## Bienvenidos

<br>

**Bienvenidos a nuestra capacitaci�n en R para manejo de informaci�n!**
<br>
<br>


Vamos a pasar este d�a aprendiendo sobre la herramienta R y todas sus funcionalidades para nuestro trabajo :)
<br>
<br>


-- Equipo GTRM Per�


## Qu� es R?

<br>
1. **Lenguaje de programaci�n** con enfoque al an�lisis estad�stico

<br>
2. Uno de los **lenguajes estad�sticos** m�s utilizados en investigaci�n cientifica

<br>
3. Una de las herramientas m�s importantes para **data science**



## Organizaciones que utilizan R

 ![](assets/img/microsoft_logo.png){ width=20% }      ![](assets/img/google_logo.jpg){ width=20% }    
 ![](assets/img/airbnb_logo.png){ width=20% }   ![](assets/img/twitter_logo.png){ width=5% }     
 ![](assets/img/facebook_logo.png){ width=5% }     ![](assets/img/uber_logo.png){ width=20% } 
 
 


## R en los sectores humanitarios y de desarrollo

**Taller en Amman (5-6 Noviembre, 2018)**  ![](assets/img/rworkshop.png){ width=50% }
 
 
**Visi�n para el futuro:**

R, c�mo lenguaje y a trav�s de las herramientas/paquetes que lo constituyen, es la opci�n de preferencia de nuestra comunidad porqu� permite:

- Abarcar las brechas con buenas pr�cticas desde las industria de data science y de la academia;

- Minimizar las dependencias de un �nico proveedor, licencia u organizaci�n;

- Construir y expander los conocimientos entre organizaciones diferentes.


<font size="2">Para m�s informaci�n: https://humanitarian-user-group.github.io/post/first-meeting/</font>







## Porqu� utilizar R en lugar de Excel?

<br>

- **Para los estad�sticos:** Fuentes de datos demasiado grandes para Excel, "Big Data"

<br>

- **M�s com�n en IM:** Ganar tiempo haciendo tareas repetitivas

<br>

- **Para ambos:** Asegurar trabajo reproducible

<br>

Y tambi�n: 100% gratuito y open source!


## Desde "clic" hacia "script" (1)

Un flujo de trabajo tradicional es el siguiente:
<br>

1. Ingresar en Kobo, ir al formulario, descargar los datos; ![](assets/img/kobo_logo.jpg){ width=7% }

<br>

2. Abrir el archivo en Excel, transformar datos manualmente (copiar, pegar, tablas din�micas, etc) y preparar gr�ficos ![](assets/img/Microsoft_Excel_2013_logo.svg.png){ width=5% }

3. Exportar datos para preparar mapas en GIS;![](assets/img/qgis_logo.png){ width=7% }

4. Abrir Word para a�adir el narrativo, copiar y pegar gr�ficos/mapas; ![](assets/img/Microsoft_Word_logo.png){ width=6% }

5. O: Juntar todo en un documento con Adobe Illustrator/InDesign. ![](assets/img/illustrator_logo.jpg){ width=5% }
<br>




## Desde "clic" hacia "script" (2)

Este flujo de trabajo **no** es lo m�s efectivo, sobre todo si el dataset utilizado cambia en continuaci�n (por ejemplo con una encuesta Kobo):

- Los datos son manipulados haciendo clic manualmente;
- Los datos son exportados desde una herramienta hacia una otra (Excel, GIS, Word), utilizando varios formatos;
- Los resultados (gr�ficos, tablas), con copiados y pegados **manualmente** en el formato de publicaci�n final.

**Este proceso es laborioso y deja un gran potencial para errores!**

![](assets/img/exhausted.png){ width=20% }



## Desde "clic" hacia "script" (3)

Unas preguntas y problemas t�picos revisando un an�lisis:

- Cuales c�lculos se hicieron para llegar a las cifras? 

- Tomaron en consideraci�n x, y, z para el an�lisis?

- Se identificaron outliers?

- Ups! Hay un error / queremos hacer una revisi�n en los datos! Podemos repetir el an�lisis? Necesitamos las cifras, gr�ficos y tablas para el informe / presentaci�n en media hora!

- Como co-autor o lector de un informe, quiero ver el proceso de investigaci�n (como llegamos a una conclusi�n) y no solo el producto final con cifras/tablas agregadas.


## Desde "clic" hacia "script" (4)

Si todos los pasos de manejo de datos, an�lisis, visualizaci�n son hechos a trav�s de una seria de comandos **escritos en script**, en lugar de **dozenas de clics**:

- Una vez identificado un error en los datos, o utilizando diferentes datasets, solo se necesita hacer cambios en el script y el informe se actualizar� automaticamente;

- El manejo de datos deviene *de facto* llenamiente documentado (no se necesitan cambios manuales en Excel);

- El an�lisis es documentado y listo para una revisi�n colaborativa;

<br>
<br>
<br>
<br>
<br>
<br>

<font size="2">Estas diapositivas son adaptadas desde la presentaci�n de Edouard Legoupil: http://edouard-legoupil.github.io/humanitaRian-data-science/</font>




# Primeros pasos en R

- La interfaz visual de RStudio
- Los paquetes de R
- Elementos b�sicos de R (paquete Swirl)
  - Primeros pasos
  - Vectores
  - Matrices y marcos de datos

## Empezamos!

Una distinci�n importante:

<br>

- **R** es el lenguaje de programaci�n
  - Instalar **R**: https://cran.r-project.org/bin/windows/base/ 

<br>

- **RStudio** es la interfaz para utilizar R
  - Instalar **RStudio**: https://www.rstudio.com/products/rstudio/download/ 

  
## Interfaz visual de RStudio


![](assets/img/rstudio2.png){ width=100% }

  

## Los paquetes de R

<br>
- R tiene una variedad enorme de usos: Si los incluyera todos, ser�a demasiado pesado!

<br>
- La versi�n base de R tiene varios comandos b�sicos;


<br>
-	Los paquetes son **extensiones** de las funcionalidades b�sicas de R para usos espec�ficos;

<br>
-	Paquetes oficiales est�n en la plataforma CRAN;
__
<br>
-	Paquetes nuevos/especificos se pueden tambi�n descargar desde otras fuentes.


## Elementos b�sicos de R: Ejercicios individuales

En la Console, insertar los comandos siguientes (INGRESAR despu�s cada comando):
<br>

```{r}

- install.packages("swirl")

- library("swirl")

- select_language("spanish")

- swirl()

```

Despu�s, seleccionar "1: R Programming" y vamos a seguir los m�dulos 1, 4 y 7. 


## Elementos b�sicos de R

- C�mo interactuar con R

- C�lculos: 5 + 7

- Operatores: +, -, *, /, ^, sqrt()

- Crear variable: x <- 5+7

- Vectores: c(1, 2, 3)

- Buscar ayuda: ?funci�n


## Vectores

- Tipos de vectores:

  - Num�rico: 1, 2.5, 1000
  
  - L�gico: TRUE, FALSE
  
  - Car�cter: "hola"
  
  - Otros
  
- Operadores l�gicos: <, >, <=, >=, ==, !=, |, &

- Funci�n paste()

## Matrices

- Datos "rectangulares": Como hojas de c�lculo Excel
<br>

- Matrix: Mismo tipos de vectores

- Marco de datos: Diversos tipos de vectores (m�s com�n para nosotros!)
<br>

- Dimensiones: dim(x) Como las filas y columnas

- Largo: length(x)

- Tipo: class(x)

- Combinar columnas: cbind()

- Combinar filas: rbind()

- Nuevas matrices: matrix()

- Nuevos marcos de datos: data.frame()

- Cambiar nombre a columnas: colnames()

