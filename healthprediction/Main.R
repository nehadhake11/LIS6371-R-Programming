#This is Main function , Starting point for automated Modeling and prediction of data.
#Provide following data elements to prediction_runner function.
#This will create a model with sample data and run this model over data set to get prediction once this is completed,
#there are some inbuilt visualization function to express the predictions and data.
#Dataset should contain a unique ID, this will help up is calulating the accuracy of the model
install.packages("dplyr")
install.packages("ggplot2")

library(dplyr)
library(ggplot2)

script_files <- list.files("R/", full.names = TRUE, pattern = "\\.R$")

for (script in script_files) {
  #if(script == "R//Main.R"){
  if(grepl("_S4",script)){
    #do nothing
  } else {
    print(script)
    source(script)
  }
}


columns <- c("ID","Diabetes_binary","HighBP","HighChol","CholCheck","BMI","Smoker","Stroke","HeartDiseaseorAttack","PhysActivity","Fruits","Veggies","HvyAlcoholConsump","AnyHealthcare","NoDocbcCost","GenHlth","MentHlth","PhysHlth","DiffWalk","Sex","Age","Education","Income")
d_column <- "Diabetes_binary"
#m_columns <- c("HighBP","HighChol","CholCheck","BMI","Smoker","Stroke","HeartDiseaseorAttack","PhysActivity","Fruits","Veggies","HvyAlcoholConsump","AnyHealthcare","NoDocbcCost","GenHlth","MentHlth","PhysHlth","DiffWalk","Sex","Age","Education","Income")
m_columns <- c("HighBP","HighChol","CholCheck","BMI","Smoker","Stroke","HeartDiseaseorAttack","HvyAlcoholConsump","Age")
model_filepath <- "/Users/nehadhake/LIS6371/LIS6371-R-Programming/healthprediction/data/Training_data.csv"
prediction_filepath <- "/Users/nehadhake/LIS6371/LIS6371-R-Programming/healthprediction/data/Prediction_data.csv"
xAxis_column <- "Income"
#xAxis_columnlabel <- c("18-24","25-29","30-34","35-39","40-44","45-49","50-54","55-59","60-64","65-69","70-74","75-79","80+")
xAxis_columnlabel <- c("<10K","<15K","<20K","<25K","<35K","<50K","<75K",">75K")
runprediction(model_filepath,prediction_filepath,columns,d_column,m_columns,xAxis_column,xAxis_columnlabel)
