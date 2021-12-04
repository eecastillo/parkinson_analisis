

![R](https://img.shields.io/badge/R-276DC3?style=flat&logo=r&logoColor=white)
![Markdown](https://img.shields.io/badge/Markdown-green?style=flat&logo=markdown&logoColor=white)
![Git](https://img.shields.io/badge/-Git-%23F05032?style=flat&logo=git&logoColor=%23ffffff)
![Python](http://img.shields.io/badge/-Python-yellow?style=flat&logo=python&logoColor=ffffff)
<!---
![Python](https://img.shields.io/badge/-Python-3776AB)
▶ **`Breve descripción de lo hecho con la limpieza de los datos`**
-->

---

# Parkinson Análisis

<div style="text-align: center">
<img src="https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/cortex.png" >
</div>
<br>

### Índice

  - **[Introducción](#-Introducción)**
  	- [Parkinson](#parkinson)
  - **[Desarrollo](#-Desarrollo)**
  	- [ETL - Extracción, Transformación y Carga](#-etl---extracción-transformación-y-carga)
  	- [Anáslisis de Datos](#-anáslisis-de-datos)
  - **[Conclusión](#-Conclusión)**
  	- [Demo Shiny](#-Demo-Shiny)
	- [En un futuro no lejano](#-en-un-futuro-no-lejano)
  	- [Q&A](#-qa)
  	- [Enlaces de Interés](#-enlaces-de-interés)
  

## 🔠 Introducción
<br> 

### Parkinson
<br>

<div style="text-align: justify;">
<img align="left" src="https://www.intramed.net/UserFiles/vinetas/93250.jpg" height="150" width="250"  hspace="32" style="padding:500">
 
  La enfermedad de Parkinson es una enfermedad progresiva del sistema nervioso que afecta el movimiento.  
  Los síntomas comienzan gradualmente. A veces, comienza con un temblor apenas perceptible en una sola mano.  
  Los temblores son habituales, aunque la enfermedad también suele causar rigidez o disminución del movimiento.
</div><br>

> 📌  **James Parkinson**, fue el médico británico que describió por primera vez la «parálisis agitante», término que él mismo acuñó.

<br>
<br>

<p align = "center">
<img src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/parkinson.jpg"  height="450" width="550" >
</p>

<br>
<br>

<div style="text-align: justify;">
<img align="right" src = "https://raw.githubusercontent.com/eecastillo/parkinson_analisis/master/R_project/Shiny/files/paper.png"  height="250" width="350" >
</div>

### Desarrollo previo

Este proyecto, se basa en el documento titulado 
**'Machine Learning for the diagnosis of Parkinson's disease: A systematic review'**, publicado por 
_Jie Mei, Christian Desrosiers y Johannes Frasnelli de la Université de Montréal_.
Dentro del cual se analizan mas de 200 estudios enfocados al diagnostico de la Enfermedad de Parkinson (EP),
mediante el uso de distintos modelos de Aprendizaje Maquina para diversos tipos
de información del usuario como lo son la voz y el dibujo de patrones.

<br>

#### Metricas de desempeño
Para cada modelo utilizado para el analisis y diagnostico de la enfermedad utilizado
dentro de cada documento se utilizan distintas metricas de desempeño como lo son:
Exactitud, Presicion, Sensibilidad, entre otras.

<br>
<p align = "center">
<img src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/outcomes.png?raw=true" height = 350, width = 450>
</p>
<br>

#
<!---
|  Análisis de voz  |  Análisis de pulso |
|---|---|
|  Dentro del estudio y análisis de los datos recopilados en las <br> bases de datos para la deteccion de parkinson por medio del uso <br> de la voz se encuentran parametros de: pitch, jitter, shimmer y <br> periodo junto con sus variaciones. <br> <img src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/voice.png?raw=true" height = 230, width = 350 > | Para el diagnostico de la enfermedad mediante el uso de los datos <br> recopilados al dibujar patrones se encuentran los parametros de: <br> genero, si es diestro o zurdo, edad, máxima desviacion desviacion <br> minima, desviacion estandar. <br> <img src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/handwriting.png?raw=true" height = 250, width = 300 >
--->
	
<div  >

Análisis de voz <br>
	Dentro del estudio y análisis de <br> 
	los datos recopilados en las <br>
	bases de datos para la deteccion <br> 
	de parkinson por medio del uso <br> 
	de la voz se encuentran parametros de: <br> 
	pitch, jitter, shimmer y <br> 
	periodo junto con sus variaciones. <br> 
	<img src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/voice.png?raw=true" height = 230, width = 350 >
</div>
	

<div style="width: 50%" >
Análisis de pulso <br>
	Para el diagnostico de la enfermedad <br> 
	mediante el uso de los datos <br> 
	recopilados al dibujar patrones se <br> 
	encuentran los parametros de: <br> 
	genero, si es diestro o zurdo, edad, <br> 
	máxima desviacion desviacion minima, <br> 
	desviacion estandar. <br> 
	<img src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/handwriting.png?raw=true" height = 250, width = 300 >

</div>
	

	
	
<br>
<br>
				    
> 🛑 Se recomienda tener conocimientos básico-intermedio de:  
	■ Parkinson.  
	■ R y R Shiny.

<br>

## 🥼 Desarrollo
### 🛠 ETL - Extracción, Transformación y Carga
  <ul>
  <details open>
  <summary> 📑 </summary>
    1._ Se descargó el documento.PDF <b>"Machine learning for the diagnosis of Parkinson’s disease: A systematic review"</b> </br>  
    2._ Se convirtió el documento a formato DOCX </br>
	2.1._ Se seleccionaron los datos a utilizar. </br>
	2.2._ Se formateó los datos de las tablas de interés a utilizar. </br> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Table 4: Studies that applied machine learning models to voice recordings to diagnose PD (n = 55). </br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Table 5: Studies that applied machine learning models to movement or gait data to diagnose PD (n = 51). </br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Table 6: Studies that applied machine learning models to MRI data to diagnose PD (n = 36). </br>
    3._ Se extrajo los datos por filas de todas las tablas de interés del documento.DOCX </br>
    4._ Se transcribió los datos en documentos.xlsx </br>
    5._ Se uso pipe o pleca ( | ) para la separación de los datos en columnas. </br>
    6._ Se modificarón modificarón algunas columnas dependiendo de la finalización que se requería con los datos. Más info aquí. </br>
   ...🐱‍👤
  </details>
  </ul>
### 📈 Anáslisis de Datos
columna 1: Subject id, entero

columna 2-27: features
elementos 1-5: Jitter (local),Jitter (local, absolute),Jitter (rap),Jitter (ppq5),Jitter (ddp), flotantes
elementos 6-11: Shimmer (local),Shimmer (local, dB),Shimmer (apq3),Shimmer (apq5), Shimmer (apq11),Shimmer (dda), flotantes
elementos 12-14: AC,NTH,HTN, flotantes
elementos 15-19: Median pitch,Mean pitch,Standard deviation,Minimum pitch,Maximum pitch, flotantes
elementos 20-23: Number of pulses,Number of periods,Mean period,Standard deviation of period, flotantes
elementos 24-26: Fraction of locally unvoiced frames,Number of voice breaks,Degree of voice breaks flotantes

column 28: class information entero

### Desarrollo con R y Shiny


### 🖥 Demo Shiny  
  https://r6x320-fernando0maldonado.shinyapps.io/James_Parkinson/
  
## Procesamiento de datos con Python
## Analisis de datos con Python
## Machine learning
## 🏁 Conclusión

### 💬 Q&A
▶ **`Preguntas y respuestas`**
  <ul>
  <details>
  <summary> ❓ / ❗ </summary>
    1._ Qué es la Dopamina? </br>  
      R= Es uno de los muchos neurotransmisores que usan las neuronas para comunicarse entre ellas y es una sustancia que no solo la produce el ser humano, </br>
	 sino también puede ser producida en laboratorios. </br>
	 La dopamina es frecuentemente considerada como la causante de sensaciones placenteras y la sensación de relajación. </br><br>
    2._ Por qué baja la dopamina? </br>
      R= Un grupo de neurólogos expertos explica que todavía se desconocen las causas de la pérdida de neuronas secretoras de dopamina en la enfermedad de Parkinson (EP).</br>
         No se conocen a ciencia cierta los factores de riesgo, pero existen ciertas conexiones. Puede haber factores genéticos en un número pequeño de pacientes.. </br><br>
    3._ Cómo afecta el Parkinson en el habla?? </br>
      R= Los pacientes de Parkinson tienden a tener dificultades para entender y producir oraciones con correcta estructura gramatical. </br>
         Disminución en la velocidad del habla, expresión y duración. Lo que disminuye la fluidez, acentuación y ritmo de la expresión verbal.</br><br>
   
   😃 ...
  </details>
  </ul>

### 🔮 En un futuro no lejano

### 🔗 Enlaces de Interés
- [Parkinson](https://www.mayoclinic.org/es-es/diseases-conditions/parkinsons-disease/symptoms-causes/syc-20376055 " Enfermedad de Parkinson")
- [Diapositivas](https://labs.phaser.io/index.html "---")
- [Machine learning for the diagnosis of Parkinson’s
disease](https://arxiv.org/ftp/arxiv/papers/2010/2010.06101.pdf "E-Book PDF")
- [Videos todo sobre el Parkinson](http://ustedyparkinson.com/es-pk/view/m101-a01-entendiendo-la-enfermedad-de-parkinson-animaci%c3%b3n "UstedyParkinson")
tags$a(href="https://www.esparkinson.es/espacio-parkinson/conocer-la-enfermedad/", 
                            "https://www.esparkinson.es/espacio-parkinson/conocer-la-enfermedad/"),hr(),
                     tags$a(href="https://arxiv.org/pdf/2010.06101.pdf", 
                            "https://arxiv.org/pdf/2010.06101.pdf"),hr(),
                     tags$a(href="https://www.larescvalenciana.org/abc-del-parkinson/", 
                            "https://www.larescvalenciana.org/abc-del-parkinson/"),hr(),
                     tags$a(href="https://medlineplus.gov/spanish/parkinsonsdisease.html", 
                            "https://medlineplus.gov/spanish/parkinsonsdisease.html"),hr(),
                     tags$a(href="https://conoceelparkinson.org/sintomas/confinamiento-sintomas-enfermedad-parkinson/",
                            "https://conoceelparkinson.org/sintomas/confinamiento-sintomas-enfermedad-parkinson/"),hr(),
                     tags$a(href="https://conoceelparkinson.org/cuidados/dia-mundial-parkinson-2021/",
                            "https://conoceelparkinson.org/cuidados/dia-mundial-parkinson-2021/"),hr(),
                     tags$a(href="https://www.elsevier.es/es-revista-revista-medica-clinica-las-condes-202-articulo-enfermedad-parkinsonproyecciones-futuras-diagnostico-precoz-X0716864008322080",
                            "https://www.elsevier.es/es-revista-revista-medica-clinica-las-condes-202-articulo-enfermedad-parkinsonproyecciones-futuras-diagnostico-precoz-X0716864008322080"),hr()
			    
			    
---
con ❤ **[eecastillo](https://github.com/eecastillo)** & **[@ferjml97](https://github.com/ferjml97)** 🙂


