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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        #retreive csv
        voice_csv <- read.csv("https://raw.githubusercontent.com/eecastillo/parkinson_analisis/master/cvs_data/voice_papers.csv", sep="|")
        
        total_splited <- str_split_fixed(voice_csv$Number.of.subjects..n., "; ", 2)
        subject_total <- total_splited[,1]
        subject_total <- gsub(",","",subject_total)
        voice_csv$subject_total <- as.numeric(subject_total)
        
        hc_split <- str_split_fixed(total_splited[,2]," HC \\+ ",2)
        HC_subjects <- as.numeric(gsub(",","",hc_split[,1]))
        voice_csv$HC_subjects <- HC_subjects
        
        pd_split <- str_split_fixed(hc_split[,2]," PD ",2)
        PD_subjects <- as.numeric(gsub(" PD","",pd_split[,1]))
        PD_subjects[is.na(PD_subjects)] <- 0
        voice_csv$PD_subjects <-PD_subjects
        
        #delete the + character form 46 and 47
        pd_split[,2] <- substring(pd_split[,2], 3)
        
        msa_split <- str_split_fixed(pd_split[,2]," MSA \\+ ",2)
        MSA_subjects <- as.numeric(gsub(",","",msa_split[,1]))
        MSA_subjects[is.na(MSA_subjects)] <- 0
        voice_csv$MSA_subjects <- MSA_subjects
        
        #separate FND
        fnd_split <- str_split_fixed(msa_split[,2]," FND \\+ ",2)
        FND_subjects <- as.numeric(gsub(",","",fnd_split[,1]))
        FND_subjects[is.na(FND_subjects)] <- 0
        voice_csv$FND_subjects <- FND_subjects
        
        #separate somatization
        somatization_split <- str_split_fixed(fnd_split[,2]," somatization \\+ ",2)
        Somatization_subjects <- as.numeric(gsub(",","",somatization_split[,1]))
        Somatization_subjects[is.na(Somatization_subjects)] <- 0
        voice_csv$Somatization_subjects <- Somatization_subjects
        
        #separate dystonia
        dystonia_split <- str_split_fixed(somatization_split[,2]," dystonia \\+ ",2)
        Dystonia_subjects <- as.numeric(gsub(",","",dystonia_split[,1]))
        Dystonia_subjects[is.na(Dystonia_subjects)] <- 0
        voice_csv$Dystonia_subjects <- Dystonia_subjects
        
        #separate CD
        cd_split <- str_split_fixed(dystonia_split[,2]," CD \\+ ",2)
        CD_subjects <- as.numeric(gsub(",","",cd_split[,1]))
        CD_subjects[is.na(CD_subjects)] <- 0
        voice_csv$CD_subjects <- CD_subjects
        
        #separate ET
        et_split <- str_split_fixed(cd_split[,2]," ET \\+ ",2)
        ET_subjects <- as.numeric(gsub(",","",et_split[,1]))
        ET_subjects[is.na(ET_subjects)] <- 0
        voice_csv$ET_subjects <- ET_subjects
        
        #separate GPD
        gpd_split <- str_split_fixed(et_split[,2]," GPD",2)
        GPD_subjects <- as.numeric(gsub(",","",gpd_split[,1]))
        GPD_subjects[is.na(GPD_subjects)] <- 0
        voice_csv$GPD_subjects <- GPD_subjects
        
        voice.df <- data.frame(voice_csv,stringsAsFactors = FALSE)
        
        
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

})
