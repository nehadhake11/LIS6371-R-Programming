# Define the S4 class
setClass("SleepData",
         slots = c(student_id = "numeric",
                   hours_of_sleep = "numeric",
                   bedtime = "POSIXct",
                   wakeup_time = "POSIXct",
                   sleep_quality = "character"))

# Define the summary method for the SleepData class
setMethod("summary", "SleepData", function(object) {
  cat("Summary of Sleep Data:\n")
  print(head(object@student_id))  # Just print the first few student IDs for demonstration
})

# Create an instance of the SleepData class
sleep_data_s4 <- new("SleepData", student_id = student_id, hours_of_sleep = hours_of_sleep,
                     bedtime = as.POSIXct(bedtime, format = "%I:%M %p"),
                     wakeup_time = as.POSIXct(wakeup_time, format = "%I:%M %p"),
                     sleep_quality = sleep_quality)

# Test the S4 method
summary(sleep_data_s4)