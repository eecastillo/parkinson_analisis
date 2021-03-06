#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
        library(shiny)
        library(stringr)
        library(plotly)
        #retreive csv
        voice_csv <- read.csv("https://raw.githubusercontent.com/eecastillo/parkinson_analisis/master/R_project/Shiny/files/clean_voice.csv")
        voice.df <- data.frame(voice_csv,stringsAsFactors = FALSE)
        hand_csv <- read.csv("https://raw.githubusercontent.com/eecastillo/parkinson_analisis/master/R_project/Shiny/files/clean_handwriting.csv",sep = "|")
        hand.df <- data.frame(hand_csv, stringsAsFactors = FALSE)
        choices = data.frame(
            var = colnames(voice.df[8:31]),
            num = 1:24
        )
        choices_hdwr = data.frame(
            var = colnames(hand.df[8:19]),
            num = 1:12
        )
        # List of choices for selectInput
        outcomes_list <- as.list(choices$num)
        outcomes_hdwr_list <- as.list(choices_hdwr$num)
        
        # Name it
        names(outcomes_list) <- choices$var
        names(outcomes_hdwr_list) <- choices_hdwr$var
        ordered_query <- function(dataframe, colnum, ascending){
            newdata <- dataframe[!is.na(dataframe[[colnum]]),] 
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
        top_ordered_query <- function(dataframe,rownum,colnum)
        {
            ordered.df <- ordered_query(dataframe,colnum,FALSE)   
            
            ML <- ordered.df$ML
          #  print(ML)
            # ML
           # ML[ML==""] <- ordered.df$Machine.learning.method.s..
            top.df <- data.frame(ML, ordered.df[[colnum]])
           # print("data")
            if(nrow(top.df)>rownum){
                top.df <- top.df[1:rownum,]
            }
            colnames(top.df) <- c("ML method(s)",as.character(colnames(dataframe[colnum])))
            return(top.df)
        }
        ML_methods <- c("Fuzzy neural system","RPART","LS-SVM", "PNN","SVM-RBF","SVM-linear","SCFW-KELM",
                        "SVM","FKNN","ECFA-SVM","DNN","SMO","Pegasos","AdaBoost","FBANN","Rotation forest",
                        "NNge","Logistic regression","KNN","Naive Bayes","Decision tree","Random forest","CNN",
                        "LSSVM-RBF","MLP","Joint learning","ELM","NN","EER","Linear regression","LDA-NN-GA",
                        "NNge","KELM","GRNN","ECFA-SVM","Fuzzy classifier","Boosted decision tree","Decision forests",
                        "Elastic Net regularized logistic regression","Random tree", "Boosted logistic regression",
                        "ANN","CART","CNN-DL","CR-ML","RA-ML","EWNN","Stacket generalization","RLDA","RFS-LDA",
                        "IGWO-KELM","SCFW-KELM","FURIA","MLP","SVM(multi-kernel)","CNN(VGG and ResNet)","FCN","GCN",
                        "Ensemble selection","Ensemble learning","Bagging ensemble","GLRA","FLDA","DA","SVM-polynomial",
                        "SVM-MLP","LSTM-based NN","Gradient boosted decision trees","ResNet");

        form_pie_table <- function(dataframe)
        {
            pie_table <- data.frame(ML_methods,vector(mode="numeric", length=length(ML_methods)))
            colnames(pie_table) <- c("ML_method","Percentage")
            for(i in 1:length(ML_methods)){
                count <- grepl(pie_table[i,1], dataframe, fixed = TRUE)
                pie_table[i,2]<- sum(count, na.rm = TRUE)
            }
            pie_table <- pie_table[which(pie_table$Percentage!=0),]
            pie_table$Percentage <- pie_table$Percentage/sum(pie_table$Percentage)
            return(pie_table)
        }
        #Voice
    output$distPlot <- renderPlotly({
        colnum = as.numeric(input$select) + 7
       
        #newdata <- voice.df[!is.na(voice.df[[colnum]]),] 
        acc <- ordered_query(voice.df,colnum,TRUE)#newdata[order(newdata[[colnum]]),]
        #print(data.frame(str_split(acc$ML,"/")))
        
        xlabels <- data.frame(str_split_fixed(acc$ML, "/", 2))
        print(dim(xlabels))
        print((acc$ML))
        plot_ly(
            acc,
            y = acc[[colnum]],
            x = xlabels$X1,
            type = "scatter",
            mode = "markers")%>%layout(title = 'Studies sorted by selected outcome ', 
               margin = list(b = 120),
               yaxis = list(title = choices$var[as.numeric(input$select)]),
                xaxis = list(tickangle = 45,
                    title = 'ML Methods',
                    categoryorder = "array",
                    categoryarray = xlabels$X1)
            )
    })
    output$MLPiePlot <- renderPlotly({
        pre_pie_table <- top_ordered_query(voice.df,as.numeric(input$bins),as.numeric(input$select) + 7)
        colnames(pre_pie_table) <- c("concept","value")
        pie_table <- form_pie_table(pre_pie_table$concept)
        plot_ly(pie_table, labels = pie_table$ML_method, values = pie_table$Percentage, type = 'pie')%>%
            layout(title = 'Top outcomes')
    })
    output$view <- renderTable({
        top_ordered_query(voice.df,as.numeric(input$bins),as.numeric(input$select) + 7)
    })
    
    #Handwriting panel server
    output$Plotly_hdwr <- renderPlotly({
        colnum = as.numeric(input$select_hdwr) + 7
        #newdata <- voice.df[!is.na(voice.df[[colnum]]),] 
        acc <- ordered_query(hand.df,colnum,TRUE)#newdata[order(newdata[[colnum]]),]
        plot_ly(
            acc,
            y = acc[[colnum]],
            x = acc$ML,
            type = "scatter",
            mode = "markers")%>% layout(xaxis = list(type = "category"))%>%
            layout(title = 'Studies sorted by outcome selected',
               yaxis = list(title = choices_hdwr$var[as.numeric(input$select_hdwr)]),
                xaxis = list(title="ML Methods",
                    categoryorder = "array",
                    categoryarray = acc$ML)
            )
    })
    output$view_hdwr <- renderTable({
        top_ordered_query(hand.df,as.numeric(input$bins_hdwr),as.numeric(input$select_hdwr) + 7)
    })
    output$MLPiePlot_hdwr <- renderPlotly({
        pre_pie_table <- top_ordered_query(hand.df,as.numeric(input$bins_hdwr),as.numeric(input$select_hdwr) + 7)
        colnames(pre_pie_table) <- c("concept","value")
        pie_table <- form_pie_table(pre_pie_table$concept)
        plot_ly(pie_table, labels = pie_table$ML_method, values = pie_table$Percentage, type = 'pie')%>%
            layout(title = 'Top outcomes')
    })
    #observe(session$setCurrentTheme(
    
    #    if (isTRUE(input$dark_mode)) dark else light
    
    #))  
})

