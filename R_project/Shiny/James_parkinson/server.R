#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(stringr)
library(plotly)

#retreive csv
voice_csv <- read.csv("https://raw.githubusercontent.com/eecastillo/parkinson_analisis/master/R_project/Shiny/files/clean_voice.csv")
voice.df <- data.frame(voice_csv,stringsAsFactors = FALSE)

choices = data.frame(
    var = colnames(voice.df[8:32]),
    num = 1:25
)
# List of choices for selectInput
outcomes_list <- as.list(choices$num)
# Name it
names(outcomes_list) <- choices$var

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
    output$distPlot <- renderPlotly({
        colnum = as.numeric(input$select) + 7
        newdata <- voice.df[!is.na(voice.df[[colnum]]),] 
        acc <- newdata[order(newdata[[colnum]]),]
        plot_ly(
            newdata,
            y = newdata[[colnum]],
            x = newdata$Machine.learning.method.s..,
            type = "scatter",
            mode = "markers")%>% layout(xaxis = list(type = "category"))%>%
            layout(
                xaxis = list(
                    categoryorder = "array",
                    categoryarray = acc$Machine.learning.method.s.. )
            )
    })

})
