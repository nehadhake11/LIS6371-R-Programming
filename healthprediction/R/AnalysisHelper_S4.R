utils::globalVariables(c("Diabetic", "Total", "Percentage_Diabetic"))
#' Calculate Accuracy of Predictions
#'
#' @description Calculates the accuracy of predicted results against actual results.
#' @param results_dataframe A data frame with at least two columns: 'ActualResult' and 'PredictedResult'.
#' @return A numeric value representing the accuracy of the predictions.
#' @export
setGeneric("calculate_accuracy", function(results_dataframe) {
  standardGeneric("calculate_accuracy")
})

#' @rdname calculate_accuracy
#' @export
setMethod("calculate_accuracy",
          signature(results_dataframe = "data.frame"),
          function(results_dataframe) {
            # If PredictedResult are probabilities, you might need to convert them to class labels first
            # results_dataframe$PredictedResult <- ifelse(results_dataframe$PredictedResult > 0.5, 1, 0)

            # Calculate the number of correct predictions
            correct_predictions <- sum(results_dataframe$ActualResult == results_dataframe$PredictedResult)

            # Calculate accuracy
            accuracy <- correct_predictions / nrow(results_dataframe)

            # Return the accuracy
            return(accuracy)
          }
)




#' Generate Output File and Plot
#'
#' @description Merges a results data frame with an initial data set, writes the merged data to a CSV file,
#' and creates a bar plot of the percentage of diabetic cases by a specified category.
#' @param results_dataframe A data frame containing the results to be merged with the initial data set.
#' @param initial_dataset A data frame containing the initial data set to be merged with the results.
#' @param xAxis The name of the column in `results_dataframe` to be used for the x-axis of the bar plot.
#' @param xAxisLabels Labels corresponding to the `xAxis` values, used for annotating the plot.
#' @param decision_column The name of the binary decision column in `results_dataframe` used for calculating counts.
#' @param row_names Logical value indicating whether to write row names to the output CSV file (default is FALSE).
#' @return NULL The function does not return a value but writes a CSV file and saves a JPEG image of the plot.
#' @export
setGeneric("generate_output_file", function(results_dataframe, initial_dataset, xAxis, xAxisLabels, decision_column, row_names = FALSE) {
  standardGeneric("generate_output_file")
})

#' @rdname generate_output_file
#' @export
setMethod("generate_output_file",
          signature(results_dataframe = "data.frame", initial_dataset = "data.frame",
                    xAxis = "character", xAxisLabels = "character",
                    decision_column = "character", row_names = "logical"),
          function(results_dataframe, initial_dataset, xAxis, xAxisLabels, decision_column, row_names = FALSE) {
            results_dataframe <- merge(results_dataframe, initial_dataset, by = "ID")
            write.csv(results_dataframe, "data/output.csv", row.names = row_names)

            # Calculate the count of diabetic cases by age
            age_count <- results_dataframe %>%
              group_by(results_dataframe[[xAxis]]) %>%
              summarise(Diabetic = sum( Diabetes_binary == 1, na.rm = FALSE), .groups = 'drop')

            # Calculate the total count for normalization
            total_count <- sum(age_count$Diabetic)
            age_count <- age_count %>%
              mutate(Percentage = (Diabetic / total_count) * 100)
            age_count <-  cbind(age_count,xAxisLabels)

            p1 <- ggplot(age_count, aes(x = xAxisLabels, y = Percentage,fill = as.factor(xAxis))) +
              geom_bar(stat = "identity") +
              geom_text(aes(label = xAxisLabels), vjust = -1.0, hjust = 0.5, color = "black") +
              geom_text(aes(label = paste0(round(Percentage, 1), "%")),vjust = 0.5) +
              labs(title = paste("Predication in % of diabetes cases by ",xAxis),
                   x = xAxis,
                   y = "% of Diabetes Cases") +
              theme_minimal() +
              scale_fill_viridis_d(begin = 0.3, end = 0.9, option = "C") +
              theme_minimal()
            print(p1)
            ggsave("boxplot.jpeg", p1, width = 8, height = 6)
          })



