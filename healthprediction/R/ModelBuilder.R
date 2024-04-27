#' Build a Logistic Regression Model
#'
#' This function builds a logistic regression model using the specified decision column as the response variable and the model columns as predictors.
#'
#' @param dataset A data frame containing the data to be modeled.
#' @param decision_column A string specifying the name of the decision/response column in the dataset.
#' @param model_columns A character vector specifying the names of the predictor columns in the dataset.
#' @return A glm object representing the fitted logistic regression model.
#' @importFrom stats as.formula binomial glm predict
build_model <- function(dataset,decision_column,model_columns){

    if (!(decision_column %in% names(dataset))) {
    stop("The decision column is not present in the dataset.")
  }

  if (!all(model_columns %in% names(dataset))) {
    stop("Not all model columns are present in the dataset.")
  }

  formula <- as.formula(paste(decision_column, paste(model_columns, collapse = " + "), sep = " ~ "))

  model <- glm(formula, data = dataset, family = binomial)

  return(model)
}
