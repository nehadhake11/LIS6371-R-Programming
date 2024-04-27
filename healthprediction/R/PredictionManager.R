' Run Prediction Pipeline
#'
#' This function orchestrates a prediction pipeline that includes reading and cleaning datasets,
#' building a model, making predictions, calculating accuracy, and generating output files.
#'
#' @param model_filepath The file path to the CSV file containing the training data.
#' @param prediction_filepath The file path to the CSV file containing the data for making predictions.
#' @param columns A character vector specifying the expected columns in the datasets.
#' @param d_column The name of the decision/response column in the datasets.
#' @param m_columns A character vector specifying the names of the predictor columns in the datasets.
#' @param xAxis_column The name of the column to be used for the x-axis in the output plot.
#' @param xAxis_columnlabel Labels corresponding to the `xAxis_column` values, used for annotating the plot.
#' @return The function does not return a value but prints the accuracy of the model and generates output files.
#' This will print the accuracy and generate output files including a plot.
runprediction <- function(model_filepath,prediction_filepath,columns,d_column,m_columns,xAxis_column,xAxis_columnlabel){
  training_dataset <- read_validate_clean_dataset(model_filepath,columns)
  predction_dataset <- read_validate_clean_dataset(prediction_filepath,columns)
  prediction_model <- build_model(training_dataset,d_column,m_columns)
  predicted_datset <- make_prediction(predction_dataset,m_columns,prediction_model,d_column)
  accuracy <- calculate_accuracy(predicted_datset)
  print(paste("accuracy of the model is ",accuracy))
  generate_output_file(predicted_datset,predction_dataset, xAxis_column,xAxis_columnlabel, d_column)
  print("please check the output files with Predicted data vs Actual Data")
}

