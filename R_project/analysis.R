library(stringr)
voice_csv <- read.csv("https://raw.githubusercontent.com/eecastillo/parkinson_analisis/master/voice_papers.csv", sep="|")
names(voice_csv) <- c("Objective", "Diagnosis_type", "Data_source", "Subject_numbers", "ML_method", "Outcomes", "Year", "Reference")
#gait_csv <- read.csv("")
#write_csv <- read.csv("")
total_splited <- str_split_fixed(voice_csv$Subject_numbers, "; ", 2)
subject_total <- total_splited[,1]
subject_total <- gsub(",","",subject_total)
voice_csv$subject_total <- as.numeric(subject_total)

hc_split <- str_split_fixed(total_splited[,2]," HC \\+ ",2)
HC_subjects <- as.numeric(gsub(",","",hc_split[,1]))
voice_csv$HC_subjects <- HC_subjects

pd_split <- str_split_fixed(hc_split[,2]," PD ",2)
PD_subjects <- as.numeric(gsub(" PD","",pd_split[,1]))
voice_csv$PD_subjects <-PD_subjects

voice.df <- voice_csv[,!(names(voice_csv) %in% c("Subject_numbers"))]
