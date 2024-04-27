#' Make Predictions Using a Logistic Regression Model
#'
#' @description Uses a provided logistic regression model to make predictions on a dataset.
#' @param dataset A data frame containing the data on which to make predictions.
#' @param model_columns A character vector specifying the names of the predictor columns in the dataset.
#' @param model An object of class glm representing the fitted logistic regression model.
#' @param decision_column A string specifying the name of the actual decision/response column in the dataset.
#' @return A data frame with the original IDs, actual decision column values, and binary predicted results.
#' @importFrom stats predict
#' @export
setGeneric("make_prediction", function(dataset, model_columns, model, decision_column) {
  standardGeneric("make_prediction")
})

#' @rdname make_prediction
#' @export
setMethod("make_prediction",
          signature(dataset = "data.frame", model_columns = "character", model = "glm", decision_column = "character"),
          function(dataset, model_columns, model, decision_column) {
            if (!all(model_columns %in% names(dataset))) {
              stop("Not all model columns are present in the dataset.")
            }

            if (!inherits(model, "glm")) {
              stop("The provided model is not a valid glm object.")
            }

            prediction_data <- dataset[, model_columns, drop = FALSE]

            predicted_values <- predict(model, newdata = prediction_data, type = "response")

            predicted_values <- ifelse(predicted_values > 0.7, 1, 0)

            results_dataframe <- data.frame(ID = dataset$ID,
                                            ActualResult = dataset[[decision_column]],
                                            PredictedResult = predicted_values)

            return(results_dataframe)
          }
)
