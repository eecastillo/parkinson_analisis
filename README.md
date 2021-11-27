

![R](https://img.shields.io/badge/R-276DC3?style=flat&logo=r&logoColor=white)
![Markdown](https://img.shields.io/badge/Markdown-green?style=flat&logo=markdown&logoColor=white)
![Git](https://img.shields.io/badge/-Git-%23F05032?style=flat&logo=git&logoColor=%23ffffff)
![Python](http://img.shields.io/badge/-Python-yellow?style=flat&logo=python&logoColor=ffffff)
<!---
![Python](https://img.shields.io/badge/-Python-3776AB)
-->

---
# Seminario Data Scientist BEDU  
# Parkinson Análisis

### Índice

  - **[Introducción](#-Introducción)**
  	- [Parkinson]()
  - **[Desarrollo](#-Desarrollo)**
  	- [ETL - Extracción, Transformación y Carga](#-ETL - Extracción, Transformación y Carga)
  	- [Anáslisis de Datos](#-Anáslisis de Datos)
  - **[Conclusión](#-Conclusión)**
  	- [Demo Shiny](#-Demo-Shiny)
	- [En un futuro no lejano](#-En un futuro no lejano)
  	- [Q&A](#-Q&A)
  	- [Enlaces de Interés](#-Enlaces-de-Interés)
  


## 🔠 Introducción

El siguiente análisis de la **Enfermedad de Parkinson** está basado en los datasets provenientes del documento **"Machine learning for the diagnosis of Parkinson’s
disease: A systematic review"** de Jie Mei, Christian Desrosiers and Johannes Frasnelli

> 📌  **James Parkinson**, fue el médico británico que describió por primera vez la «parálisis agitante», término que él mismo acuñó.
	
  
### Parkinson

<div style="text-align: justify;">
<img align="left" src="https://www.intramed.net/UserFiles/vinetas/93250.jpg" height="150" width="250"  hspace="32" style="padding:500">
 
  La enfermedad de Parkinson es una enfermedad progresiva del sistema nervioso que afecta el movimiento.  
  Los síntomas comienzan gradualmente. A veces, comienza con un temblor apenas perceptible en una sola mano.  
  Los temblores son habituales, aunque la enfermedad también suele causar rigidez o disminución del movimiento.

	
	
#	
> 🛑 Se recomienda tener conocimientos básico-intermedio de:  
	■ Parkinson.  
	■ R y R Shiny.

## 🥼 Desarrollo
### 🛠 ETL - Extracción, Transformación y Carga
▶ **`Breve descripción de lo hecho con la limpieza de los datos`**
  <ul>
  <details open>
  <summary> 📑 </summary>
    1._ Se descargó el documento.PDF <b>"Machine learning for the diagnosis of Parkinson’s disease: A systematic review"</b> </br>  
    2._ Se convirtió el documento a formato DOCX </br>
	2.1._ Se seleccionó los datos a utilizar. </br>
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

## 🏁 Conclusión

### 🖥 Demo Shiny  
  https://r6x320-fernando0maldonado.shinyapps.io/James_Parkinson/
  
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

---
con ❤ **[eecastillo](https://github.com/eecastillo)** & **[@ferjml97](https://github.com/ferjml97)** 🙂


