#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for tab that ana
shinyUI(fluidPage(
    
    tabsetPanel(
        tabPanel("Main Page"#,
                # includeMarkdown("\Readme.md")
                 ),
        tabPanel("Voice analysis", br(),
                     # Application title
                     titlePanel("Parkinson voice analysis"),br(),
                     sidebarLayout(
                         
                         sidebarPanel(
                             selectInput("select", label = h4("Select Outcome"), 
                                         choices = outcomes_list, 
                                         selected = 5),
                             
                             #  hr(),
                             sliderInput("bins",
                                         "Number of top studies:",
                                         min = 5,
                                         max = 20,
                                         value = 10)
                         ),
                         # Show Main panel
                         mainPanel(
                             plotlyOutput("distPlot"),
                             # Output: Header + table of distribution ----
                             h4("Top studies"),
                             tableOutput("view")
                         )
                 
                         )),
        tabPanel("Handwriting analysis"
                 , br(),
                 # Application title
                 titlePanel("Parkinson handwriting analysis"),br(),
                 sidebarLayout(
                     
                     sidebarPanel(
                         selectInput("select_hdwr", label = h4("Select Outcome"), 
                                     choices = outcomes_list, 
                                     selected = 5),
                         
                         #  hr(),
                         sliderInput("bins_hdwr",
                                     "Number of top studies:",
                                     min = 5,
                                     max = 20,
                                     value = 10)
                     ),
                     # Show Main panel
                     mainPanel(
                         plotlyOutput("distPlot_hdwr"),
                         # Output: Header + table of distribution ----
                         h4("Top studies"),
                         tableOutput("view_hdwr")
                     )
                     
                 ))
    )
    
   
    
    # Sidebar for voice analysis

))
