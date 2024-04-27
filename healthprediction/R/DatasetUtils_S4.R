#' @param file_path character, the path to the CSV file that should be read.
#' @param expected_columns character vector, a list of expected column names.
#' @param expected_extension character, the expected file extension (default is "csv").
#' @param na.strings character ensure that this code is placed
#' @return A data frame with the validated (and optionally cleaned) dataset.
#' @export
setGeneric("read_validate_clean_dataset", function(file_path, expected_columns, expected_extension, na.strings) {
  standardGeneric("read_validate_clean_dataset")
})

#' @export
#' @rdname read_validate_clean_dataset
setMethod("read_validate_clean_dataset",
          signature(file_path = "character", expected_columns = "character",
                    expected_extension = "character", na.strings = "character"),
          function(file_path, expected_columns, expected_extension = "csv", na.strings = c("", "NA")) {
            if (!file.exists(file_path)) {
              stop("File does not exist:", file_path)
            }
            actual_extension <- tools::file_ext(file_path)
            if (tolower(actual_extension) != tolower(expected_extension)) {
              stop("File has the wrong extension: Expected ", expected_extension, ", but got ", actual_extension)
            }
            data <- utils::read.csv(file_path, na.strings = na.strings, stringsAsFactors = FALSE)
            if (!all(expected_columns %in% colnames(data))) {
              stop("Dataset does not have the expected columns.")
            }
            if (!"ID" %in% colnames(data)) {
              stop("Dataset does not have the expected 'ID' column.")
            }
            return(data)
          }
)
