

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
	

Analisis de voz            |    Media
:-------------------------:|:-------------------------:
Dentro del estudio y analisis de los datos recopilados<br> en las bases de datos para la deteccion de parkinson<br> por medio del uso de la voz se envuentran parametros de:<br> pitch, jitter, shimmer y el periodo junto con sus variaciones.| <img src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/voice.png?raw=true" height = 230, width = 350 >
	

Analisis de pulso          |    Media
:-------------------------:|:-------------------------:	
Para el diagnostico de la enfermedad mediante el uso <br> de los datos recopilados al dibujar patrones se <br> encuentran los parametros de: genero,<br>  si es diestro o zurdo, edad,máxima desviacion,<br> desviacion minima, desviacion estandar.<br>| <img src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/handwriting.png?raw=true" height = 250, width = 300 >

<br>
<br>
				    
> 🛑 Se recomienda tener conocimientos básico-intermedio de:  
	■ Parkinson.  
	■ R y R Shiny.

<br>

## 🥼 Desarrollo
### 📈 Anáslisis de Datos


Dato	                   |    Tipo de dato
:-------------------------:|:-------------------------:
ID			   |	int
Jitter(local)		   |    float
Jitter (local, absolute)   | 	float
Jitter (rap)		   | float
Jitter (ppq5)		   | float
Jitter (ddp)		   | float
Shimmer (local)		   | float
Shimmer (local, dB)	   | float
Shimmer (apq3)		   | float
Shimmer (apq5)		   | float
Shimmer (apq11)		   | float
Shimmer (dda)		   | float
AC			   | float
NTH			   | float
HTN			   | float
Median pitch	           | float
Mean pitch	           | float
Standard deviation of period   | float
Fraction of locally unvoiced frames  | float
Number of voice breaks	   | int
Degree of voice breaks	   | int
Class information	   | int

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


### Desarrollo con R y Shiny
<img src="https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/shiny_1.png" >
<img src="https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/shiny_2.png" >

### 🖥 Demo Shiny  
  https://r6x320-fernando0maldonado.shinyapps.io/James_Parkinson/
  
## Analisis de datos con Python
![image](https://user-images.githubusercontent.com/19128178/144709563-4c7aea3e-e21d-4329-801a-5c108b4efd96.png)
![image](https://user-images.githubusercontent.com/19128178/144709586-ff03ccfb-a87e-49e4-bc45-28601387f238.png)
![image](https://user-images.githubusercontent.com/19128178/144709625-a9cb90c3-97e3-4fae-afe6-dc36b3663c48.png)
![image](https://user-images.githubusercontent.com/19128178/144709633-0aee2d2e-1bbb-4996-8bd5-3a94909757ef.png)

## Machine learning
### Logistic Regression
[Parkinson_Logistic_Regression.ipynb](/notebooks/Parkinson_Logistic_Regression.ipynb)

Train size: 70%
Test size: 30%

Metric			   |    Results
:-------------------------:|:-------------------------:
Accuracy		   |	0.6528
Precision		   |	0.6259
Recall			   |	0.8368

![image](https://user-images.githubusercontent.com/19128178/144709854-0fcef0cf-5a46-49a7-86af-b74595d5da61.png)
![image](https://user-images.githubusercontent.com/19128178/144709861-dc8535c2-0781-4215-b4d8-592156e5416d.png)

### Polynomial Regression
Train size: 75%
Test size: 25%

Degree			   |    Results
:-------------------------:|:-------------------------:
First			   |Training: MSE =0.20226664986073595<br>Test: MSE =0.22372550107151745
Second			   |Training: MSE =0.09041958178788939<br>Test: MSE =0.9440424366774228
Third			   |Training: MSE =2.4091509149795675e-20<br>Test: MSE =10807.336241830348
Fourth			   |Training: MSE =1.312378446659635e-19<br>Test: MSE =161200.20848268343
Fifth			   |Training: MSE =2.9573820705183283e-19<br>Test: MSE =1549021.0980967553

En base a lo visto con los resultados de la regresion polinomial pudimos observar que al incrementar el grado del polinomio reducirá el Mean square error en el entrenamiento pero incrementará en las pruebas, esto es debido a que se genera el llamado overfitting.

### SVM
Train size: 75%
Test size: 25%

SVM Characteristics	   |    Results
:-------------------------:|:-------------------------:
rbf, c=10, gamma=0.0001|Accuracy:0.707988<br>Precision:0.7233<br>Recall:0.7525
![image](https://user-images.githubusercontent.com/19128178/144710304-c1f0447e-4be7-4948-a8c5-f85cae598915.png)|![image](https://user-images.githubusercontent.com/19128178/144710312-3d902873-4849-490a-aeed-aacc78388386.png)
rbf, c=1, gamma=0.0001|Accuracy: 0.65564<br>Precision: 0.66079<br>Recall: 0.7575
![image](https://user-images.githubusercontent.com/19128178/144710755-9c575015-b087-4b81-b26f-afd059ee60ac.png)|![image](https://user-images.githubusercontent.com/19128178/144710758-8aca8f6c-ac76-4320-8796-261228fdeefe.png)
rbf, c=100, gamma=0.0001|Accuracy: 0.6969<br>Precision: 0.72680<br>Recall: 0.71212
![image](https://user-images.githubusercontent.com/19128178/144710794-d85b1a4f-2de9-4900-8e43-dce28b5042e8.png)|![image](https://user-images.githubusercontent.com/19128178/144710796-4f138763-0e1c-4829-9085-34605de0e96f.png)
rbf, c=1000, gamma=0.0001|Accuracy: 0.63911<br>Precision: 0.6666<br>Recall: 0.67676
![image](https://user-images.githubusercontent.com/19128178/144710824-e20d960e-edd0-4a73-adc4-a6642efc45fd.png)|![image](https://user-images.githubusercontent.com/19128178/144710828-d8d9168a-cfaa-43b3-9eeb-59661bb4143c.png)
rbf, c=10, gamma=0.001|Accuracy: 0.67217<br>Precision: 0.718232<br>Recall: 0.65656
![image](https://user-images.githubusercontent.com/19128178/144710885-1f3a6574-1df8-478c-ab1a-515785871122.png)|![image](https://user-images.githubusercontent.com/19128178/144710887-15bc4e9d-648b-4e90-b283-758fab1086ee.png)
rbf, c=1, gamma=0.001|Accuracy: 0.658402<br>Precision: 0.70786<br>Recall: 0.63636
![image](https://user-images.githubusercontent.com/19128178/144710919-73323c4e-d5aa-485c-bf01-7cab67330960.png)|![image](https://user-images.githubusercontent.com/19128178/144710926-e60fb5c1-4859-44ba-833b-d99ba5af1b46.png)
rbf, c=100, gamma=0.001|Accuracy: 0.658402<br>Precision: 0.70108<br>Recall: 0.651515
![image](https://user-images.githubusercontent.com/19128178/144710963-b26ff965-8949-42c5-bf87-d094757c6ea6.png)|![image](https://user-images.githubusercontent.com/19128178/144710969-8d436716-f0ee-4bb7-a45a-0cf7c429f452.png)
rbf, c=1000, gamma=0.001|Accuracy: 0.65840<br>Precision: 0.701086<br>Recall: 0.651515
![image](https://user-images.githubusercontent.com/19128178/144711013-e672c920-fdae-4361-b8a9-5eb36eec2bde.png)|![image](https://user-images.githubusercontent.com/19128178/144711020-dcbd7936-ba18-4d34-9ffb-8a247b0d2233.png)


## 🏁 Conclusión
En base a los datos de las metricas obtenidas en base al uso de los tres tipos de modelos se observó que el modelo con los mejores resultados fué el de SVM con kernel rbf, c = 10 y gamma = 0.0001

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


