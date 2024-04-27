#' Run Prediction Pipeline
#'
#' @description Orchestrates a prediction pipeline including reading and cleaning datasets,
#' building a model, making predictions, calculating accuracy, and generating output files.
#' @param model_filepath A character string with the file path to the CSV file containing the training data.
#' @param prediction_filepath A character string with the file path to the CSV file containing the data for making predictions.
#' @param columns A character vector specifying the expected columns in the datasets.
#' @param d_column A character string with the name of the decision/response column in the datasets.
#' @param m_columns A character vector with the names of the predictor columns in the datasets.
#' @param xAxis_column A character string with the name of the column to be used for the x-axis in the output plot.
#' @param xAxis_columnlabel A character vector with labels corresponding to the `xAxis_column` values, used for annotating the plot.
#' @return NULL The function does not return a value but prints the accuracy of the model and generates output files.
#' @export
setGeneric("runprediction", function(model_filepath, prediction_filepath, columns, d_column, m_columns, xAxis_column, xAxis_columnlabel) {
  standardGeneric("runprediction")
})

#' @rdname runprediction
#' @export
setMethod("runprediction",
          signature(model_filepath = "character", prediction_filepath = "character",
                    columns = "character", d_column = "character", m_columns = "character",
                    xAxis_column = "character", xAxis_columnlabel = "character"),
          function(model_filepath, prediction_filepath, columns, d_column, m_columns, xAxis_column, xAxis_columnlabel) {
  training_dataset <- read_validate_clean_dataset(model_filepath,columns)
  predction_dataset <- read_validate_clean_dataset(prediction_filepath,columns)
  prediction_model <- build_model(training_dataset,d_column,m_columns)
  predicted_datset <- make_prediction(predction_dataset,m_columns,prediction_model,d_column)
  accuracy <- calculate_accuracy(predicted_datset)
  print(paste("accuracy of the model is ",accuracy))
  generate_output_file(predicted_datset,predction_dataset, xAxis_column,xAxis_columnlabel, d_column)
  print("please check the output files with Predicted data vs Actual Data")
  invisible(NULL)
})

