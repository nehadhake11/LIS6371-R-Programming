#' Build a Logistic Regression Model
#'
#' @description Builds a logistic regression model using the specified decision column as the response variable and the model columns as predictors.
#' @param dataset A data frame containing the data to be modeled.
#' @param decision_column A string specifying the name of the decision/response column in the dataset.
#' @param model_columns A character vector specifying the names of the predictor columns in the dataset.
#' @return An object of class glm representing the fitted logistic regression model.
#' @importFrom stats glm
#' @export
setGeneric("build_model", function(dataset, decision_column, model_columns) {
  standardGeneric("build_model")
})

#' @rdname build_model
#' @export
setMethod("build_model",
          signature(dataset = "data.frame", decision_column = "character", model_columns = "character"),
          function(dataset, decision_column, model_columns) {
            # Check if the decision column is present in the dataset
            if (!(decision_column %in% names(dataset))) {
              stop("The decision column is not present in the dataset.")
            }

            # Check if all model columns are present in the dataset
            if (!all(model_columns %in% names(dataset))) {
              stop("Not all model columns are present in the dataset.")
            }

            # Create the formula for the glm model
            formula <- as.formula(paste(decision_column, "~", paste(model_columns, collapse = " + ")))

            # Fit the glm model
            model <- glm(formula, data = dataset, family = binomial())

            # Return the glm model object
            return(model)
          }
)
