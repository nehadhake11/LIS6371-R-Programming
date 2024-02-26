# Creating a dataset for sleep cycles of students
student_id <- c(1, 2, 3, 4, 5)
hours_of_sleep <- c(7, 6, 8, 5, 7)
bedtime <- c("11:00 PM", "10:30 PM", "11:30 PM", "12:00 AM", "11:15 PM")
wakeup_time <- c("6:30 AM", "7:00 AM", "7:15 AM", "6:00 AM", "6:45 AM")
sleep_quality <- c("Good", "Fair", "Excellent", "Poor", "Good")

# Combine variables into a data frame
sleep_data <- data.frame(
  student_id = student_id,
  hours_of_sleep = hours_of_sleep,
  bedtime = as.POSIXct(bedtime, format = "%I:%M %p"),
  wakeup_time = as.POSIXct(wakeup_time, format = "%I:%M %p"),
  sleep_quality = sleep_quality
)

# Print the dataset
print(sleep_data)
# Define a function for the summary method
summary.sleep_data <- function(object, ...) {
  cat("Summary of Sleep Data:\n")
  print(head(object))  # Just print the first few rows for demonstration
}

# Assign the class to your dataset
class(sleep_data) <- "sleep_data"

# Test the S3 method
summary(sleep_data)
