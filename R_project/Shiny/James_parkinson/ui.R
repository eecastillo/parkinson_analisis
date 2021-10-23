#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#install.packages("shinythemes")
library(shiny)
library(bslib)
library(shinyWidgets)
library(shinythemes)
#light <- bs_theme(version = 4, bootswatch = "minty")
#dark <- bs_theme(bg = "black", fg = "white", primary = "pink")

#library(markdown)
#theme = bs_theme(version = 4, bootswatch = "flatly"),

# Define UI for tab that ana
shinyUI(
    fluidPage(
        theme = bs_theme(version = 4, bootswatch = "flatly"),
        navbarPage(
            # theme = "cerulean",  # <--- To use a theme, uncomment this
            "James Parkinson",
            # main info
            tabPanel("Main Page", br(),
                     titlePanel("Parkinson Análisis"),br(),
                     img( style="center", src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/cortex.png?raw=true",
                          height = 300, width = 1200),br(),
                     h3("Qué es la enfermedad de parkinson ?"),br(),
                     h5("Es un trastorno neurodegenerativo que afecta al sistema nervioso de manera crónica y progresiva."),
                     h5("Se caracteriza por la degeneración de neuronas en la sustancia negra,
                        provocando una falta de dopamina en el organismo y hace"),
                     h5("que el control del movimiento se vea alterado,
                        dando lugar a los síntomas motores típicos, como el temblor en reposo o la rigidez."),br(),
                     
                     h5("Este proyecto, se basa en el documento titulado 
                        'Machine Learning for the diagnosis of Parkinson's disease: A systematic review', publicado por;"),
                     h5("Jie Mei, Christian Desrosiers y Johannes Frasnelli de la Université de Montréal.
                        Dentro del cual se analizan mas de 200 estudios enfocados al "), 
                     h5("diagnostico de la Enfermedad de Parkinson (EP), mediante el uso de distintos modelos de Aprendizaje Maquina para diversos tipos
                        de información"),
                     h5("del usuario como lo son la voz y el dibujo de patrones."),
                     
                     img( style="align:justify", src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/paper.png?raw=true",
                         height = 940, width = 720 ),
                     
                     h5("Para cada modelo utilizado para el analisis y diagnostico de la enfermedad utilizado
                        dentro de cada documento se utilizan distintas metricas de"), 
                     h5("desempeño como lo son:
                        Exactitud, Presicion, Sensibilidad, entre otras."),br(),br(),
                     
                     img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/outcomes.png?raw=true",
                         height = 650, width = 950),br(),br(),
                     
                     h5("Dentro del estudio y analisis de los datos recopilados en las 
                        bases de datos para la deteccion de parkinson por medio del uso de la voz se encuentran"),
                     h5("los parametros de:
                        edad, sexo, tiempo de prueba, motor UPDRS, total UPDRS, jitter y shimmer"),br(),
                     
                     img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/voice.png?raw=true",
                         height = 430, width = 650),br(),br(),
                     
                     h5("Para el diagnostico de la enfermedad mediante el uso de los datos recopilados al dibujar patrones se encuentran
                        los parametros de: genero, si es diestro"),
                     h5("o zurdo, edad, maxima desviacion
                        desviacion minima, desviacion estandar"),br(),
                     
                     img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/handwriting.png?raw=true",
                         height = 350, width = 600),br(),
                     
                     h3("Bibliografía:"),br(),
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
                     
                     #   includeMarkdown("../../../Readme.md")
            ), #end main info
            
            # Voice analysis
            tabPanel("Voice analysis", br(),
                     # Application title
                     titlePanel( "Parkinson voice analysis"),br(),
                     sidebarLayout(
                         sidebarPanel(
                             selectInput("select", label = h4("Select Outcome"), 
                                         choices = outcomes_list, 
                                         selected = 5),
                             
                             sliderInput("bins",
                                         "Number of top studies:",
                                         min = 5,
                                         max = 20,
                                         value = 10),br(),
                             plotlyOutput("MLPiePlot")
                         ),
                         # Show Main panel
                         mainPanel(
                             plotlyOutput("distPlot"),
                             # Output: Header + table of distribution ----
                             h4("Top studies"),
                             tableOutput("view")
                         )
                     )
            ), #End Voice analysis
            
            #Handwriting analysis
            tabPanel("Handwriting analysis"
                     , br(),
                     # Application title
                     titlePanel("Parkinson handwriting analysis"),br(),
                     sidebarLayout(
                         sidebarPanel(
                             selectInput("select_hdwr", label = h4("Select Outcome"), 
                                         choices = outcomes_hdwr_list, 
                                         selected = 5),
                             
                             sliderInput("bins_hdwr",
                                         "Number of top studies:",
                                         min = 5,
                                         max = 20,
                                         value = 10),br(),
                             plotlyOutput("MLPiePlot_hdwr")
                         ),
                         
                         # Show Main panel
                         mainPanel(
                             plotlyOutput("Plotly_hdwr"),
                             # Output: Header + table of distribution ----
                             h4("Top studies"),
                             tableOutput("view_hdwr")
                         )
                     )
            ), # End Handwriting analysis
            
            tabPanel("Model EP",
                mainPanel(
                    tabsetPanel(
                        #MODEL LOGISTIC REGRESION
                        tabPanel("Logistic Regresion",
                            fluidRow(
                                column(12, style="text-align:center",br(),br(),
                                h3("Model metrics"),br(),
                                ),
                                  
                                fluidRow(
                                    column(4, #style = "background-color:#F0F4F5;",
                                         #"Accuracy",
                                         img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/accuracy_logreg.png?raw=true",
                                            height = 250, width = 400
                                         )
                                         # half screen models
                                    ),
                                  
                                    column(4,
                                         #"Precision",
                                         img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/precision_logreg.png?raw=true",
                                            height = 250, width = 400
                                         )
                                    ),
                                    column(4,
                                         #"Recall",
                                         img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/recall_logreg.png?raw=true",
                                             height = 250, width = 400
                                         )
                                    ), # 1 part
                                    
                                    column(12, style="text-align:center",br(),br(),
                                           h3("Confusion matrix & Curve ROC"),br(),
                                    ),
                                        column(6,
                                               img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/img_ml/logic/realidad_estimado.jpeg?raw=true"
                                                   # height = 350, width = 600
                                               )       
                                        ),
                                        column(6, style="text-align:right",
                                               img( src = "https://github.com/eecastillo/parkinson_analisis/blob/master/img_ml/logic/auc_roc-curve.jpeg?raw=true",
                                                   height = 450, width = 550
                                               ) 
                                        ),
                                )
                            )
                        ),
                        #MODEL FULL
                        tabPanel("Model SVM: Full Features", 
                                 fluidRow(
                                     column(12, style="text-align:center",br(),br(),
                                            h3("Model metrics"),br(),
                                     ),
                                     
                                     fluidRow(
                                         column(4, #style = "background-color:#F0F4F5;",
                                                #"Accuracy",
                                                img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/svm_rbf_full_accuracy.png?raw=true",
                                                    height = 250, width = 400
                                                )
                                                # half screen models
                                         ),
                                         
                                         column(4,
                                                #"Precision",
                                                img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/svm_rbf_full_precision.png?raw=true",
                                                    height = 250, width = 400
                                                )
                                         ),
                                         column(4,
                                                #"Recall",
                                                img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/svm_rbf_full_recall.png?raw=true",
                                                    height = 250, width = 400
                                                )
                                         ), # 1 part
                                         
                                         column(12, style="text-align:center",br(),br(),
                                                h3("Confusion matrix & Curve ROC"),br(),
                                         ),
                                         column(6,
                                                img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/img_ml/half_features/realidad-estimado.jpeg?raw=true"
                                                    # height = 350, width = 600
                                                )       
                                         ),
                                         column(6, style="text-align:right",
                                                img( src = "https://github.com/eecastillo/parkinson_analisis/blob/master/img_ml/half_features/auc_roc-curve.jpeg?raw=true",
                                                     height = 450, width = 550
                                                ) 
                                         ),
                                     )
                                 )
                        ),
                        #MODEL HALF
                        tabPanel("Model SVM: Half Features",
                                 fluidRow(
                                     column(12, style="text-align:center",br(),br(),
                                            h3("Model metrics"),br(),
                                     ),
                                     
                                     fluidRow(
                                         column(4, #style = "background-color:#F0F4F5;",
                                                #"Accuracy",
                                                img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/svm_rbf_half_accuracy.png?raw=true",
                                                    height = 250, width = 400
                                                )
                                                # half screen models
                                         ),
                                         
                                         column(4,
                                                #"Precision",
                                                img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/svm_rbf_full_precision.png?raw=true",
                                                    height = 250, width = 400
                                                )
                                         ),
                                         column(4,
                                                #"Recall",
                                                img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/svm_rbf_half_recall.png?raw=true",
                                                    height = 250, width = 400
                                                )
                                         ), # 1 part
                                         
                                         column(12, style="text-align:center",br(),br(),
                                                h3("Confusion matrix & Curve ROC"),br(),
                                         ),
                                         column(6,
                                                img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/img_ml/full_features/realidad_estimado.jpeg?raw=true"
                                                    # height = 350, width = 600
                                                )       
                                         ),
                                         column(6, style="text-align:right",
                                                img( src = "https://github.com/eecastillo/parkinson_analisis/blob/master/img_ml/full_features/auc_roc-curve.jpeg?raw=true",
                                                     height = 450, width = 550
                                                ) 
                                         ),
                                     )
                                 )
                        ), # half screen models
                             
                        #AUDIO
                        tabPanel("Library", 
                            fluidRow(
                                column(12, style="text-align:center",br(),br(),
                                       h3("Parselmouth"),br(),
                                       img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/R_project/Shiny/files/parselmouth.jpeg?raw=true"
                                           # height = 350, width = 600
                                       )
                                ),
                                
                                column(12, style="text-align:center",br(),br(),
                                    h3("Audio Analysis - Test"),br(),
                                ),
                                column(6,
                                    img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/img_ml/sound/sound_wave.jpeg?raw=true"
                                        # height = 350, width = 600
                                    )      
                                ),
                                column(6, style="text-align:right",
                                    img(src = "https://github.com/eecastillo/parkinson_analisis/blob/master/img_ml/sound/spectrogram.jpeg?raw=true"
                                        #height = 350, width = 600
                                    )
                                ),
                            )
                        )
                    )
                    
                )# main Panel
                            
            ) # End tabPanel
           
        ) # End navbarPage
   
    ) # End fluidPage
   
)

