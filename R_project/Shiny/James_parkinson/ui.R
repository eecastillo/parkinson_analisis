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
        tabPanel("Main Page"),
        tabPanel("Voice analysis"),
        tabPanel("Handwriting analysis")
    ),
    
    # Application title
    titlePanel("Parkinson Analysis"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        
        sidebarPanel(
            selectInput("select", label = h4("Select Outcome"), 
                        choices = outcomes_list, 
                        selected = 1),
            
          #  hr(),
            sliderInput("bins",
                        "Number of top studies:",
                        min = 5,
                        max = 20,
                        value = 10)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput("distPlot"),
            # Output: Header + table of distribution ----
            h4("Top studies"),
            tableOutput("view")
        )
    )
))
