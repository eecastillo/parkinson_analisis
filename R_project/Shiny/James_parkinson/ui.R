#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(bslib)
library(shinyWidgets)
light <- bs_theme()
dark <- bs_theme(bg = "black", fg = "white", primary = "pink")

#library(markdown)
# Define UI for tab that ana
shinyUI(fluidPage(
    theme = light, br(),
   # checkboxInput("dark_mode", "Dark mode"),
    materialSwitch(inputId = "dark_mode", label = "Night mode"),
    tabsetPanel(
        tabPanel("Main Page", br(),h4("Top studies")
                 
              #   includeMarkdown("../../../Readme.md")
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
                 
                         )),
        tabPanel("Handwriting analysis"
                 , br(),
                 # Application title
                 titlePanel("Parkinson handwriting analysis"),br(),
                 sidebarLayout(
                     
                     sidebarPanel(
                         selectInput("select_hdwr", label = h4("Select Outcome"), 
                                     choices = outcomes_hdwr_list, 
                                     selected = 5),
                         
                         #  hr(),
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
                     
                 ))
    )
    
   
    
    # Sidebar for voice analysis

))
