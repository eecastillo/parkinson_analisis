#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    library(shiny)
    library(stringr)
    library(plotly)
    #retreive csv
    voice_csv <- read.csv("https://raw.githubusercontent.com/eecastillo/parkinson_analisis/master/R_project/Shiny/files/clean_voice.csv")
    voice.df <- data.frame(voice_csv,stringsAsFactors = FALSE)
    
    choices = data.frame(
        var = colnames(voice.df[8:31]),
        num = 1:24
    )
    # List of choices for selectInput
    outcomes_list <- as.list(choices$num)
    # Name it
    names(outcomes_list) <- choices$var
    ordered_query <- function(colnum, ascending){
        newdata <- voice.df[!is.na(voice.df[[colnum]]),] 
        if(ascending == TRUE)
        {
            #Ascending
            acc <- newdata[order(newdata[[colnum]]),]
        }else{
            #Descending
            acc <- newdata[order(-newdata[[colnum]]),]
        }
        return(acc)
    }
    top_ordered_query <- function(rownum,colnum)
    {
        ordered.df <- ordered_query(colnum,FALSE)    
        ML <- ordered.df$ML
        ML
        ML[ML==""] <- ordered.df$Machine.learning.method.s..[ML==""]
        top.df <- data.frame(ML, ordered.df[[colnum]])
        if(nrow(top.df)>rownum){
            top.df <- top.df[1:rownum,]
        }
        colnames(top.df) <- c("ML method(s)",as.character(colnames(voice.df[colnum])))
        return(top.df)
    }
    output$distPlot <- renderPlotly({
        colnum = as.numeric(input$select) + 7
        #newdata <- voice.df[!is.na(voice.df[[colnum]]),] 
        acc <- ordered_query(colnum,TRUE)#newdata[order(newdata[[colnum]]),]
        plot_ly(
            acc,
            y = acc[[colnum]],
            x = acc$Machine.learning.method.s..,
            type = "scatter",
            mode = "markers")%>% layout(xaxis = list(type = "category"))%>%
            layout(
                xaxis = list(
                    categoryorder = "array",
                    categoryarray = acc$Machine.learning.method.s.. )
            )
    })
    
    output$view <- renderTable({
        top_ordered_query(as.numeric(input$bins),as.numeric(input$select) + 7)
    })
})
