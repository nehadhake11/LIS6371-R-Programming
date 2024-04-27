#' Read, Validate, and Optionally Clean a Dataset
#'
#' Reads a CSV file from the given file path, checks for the expected columns and file extension,
#' and validates the presence of an ID column. Optionally, it can also clean the dataset.
#'
#' @param file_path The path to the CSV file that should be read.
#' @param expected_columns A character vector of expected column names.
#' @param expected_extension The expected file extension (default is "csv").
#' @param na.strings A character vector specifying the strings to be treated as NA values.
#' @return A data frame with the validated (and optionally cleaned) dataset.
#' @importFrom utils read.csv
#' @importFrom tools file_ext
#' @examples
#' # Assuming you have a CSV file with columns "ID" ,"Binary_result" and other parameters
#' expected_cols <- c("ID", "Binary_result")
#' data <- read_validate_clean_dataset("path/to/your/data.csv", expected_cols)
#'
#' # If the file is not a CSV or does not contain the expected columns,
#' # the function will stop and give an error message.
  read_validate_clean_dataset <- function(file_path, expected_columns, expected_extension = "csv", na.strings = c("", "NA")) {
    if (!file.exists(file_path)) {
    stop("File does not exist:", file_path)
  }
  actual_extension <- tools::file_ext(file_path)
  if (tolower(actual_extension) != tolower(expected_extension)) {
    stop("File has the wrong extension: Expected ", expected_extension, ", but got ", actual_extension)
  }
  data <- read.csv(file_path, na.strings = na.strings, stringsAsFactors = FALSE)
  if (length(expected_columns) != length(colnames(data))) {
    stop("Dataset does not have the expected number of columns.")
  }
  if(!("ID"%in%colnames(data))){
    stop("Dataset does not have the expected ID column.")
  }
  if (!all(expected_columns %in% colnames(data))) {
    stop("Dataset does not have the expected columns.")
  }
  if (any(is.na(data))) {
    warning("There are missing values in the dataset.")
  }
  print("Valid dataset provided")
  return(data)
}
