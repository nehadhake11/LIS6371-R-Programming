Hospitaldata <- data.frame(
  Frequency <- c(0.6,0.3,0.4,0.4,0.2,0.6,0.3,0.4,0.9,0.2),
  BP <- c(103,87,32,42,59,109,78,205,135,176),
  First <- c(1,1,1,1,0,0,0,0,NA,1),
  Second <- c(0,0,1,1,0,0,1,1,1,1),
  FinalDecision <- c(0,1,0,1,0,1,0,1,1,1)
)
print(summary(Hospitaldata))

#to update decisions back for visual reading on barplot
Hospitaldata$FinalDecision <- factor(Hospitaldata$FinalDecision,
                                     levels = c(0,1),
                                     labels = c("Good/low","Bad/high"))

#setting color for bar plots in sequence
bar_colors <- c("green","red")

boxplot(BP ~ FinalDecision, data = Hospitaldata,
        main = "Side-by-Side Boxplot for BPs & MD's Ratings",
        xlab = "MD's Decison",
        ylab = "Blood Pressure Readings",
        col= bar_colors)

#to show both Histogram on one plotting result
par(mfrow = c(2, 1))

hist(Hospitaldata$BP, 
     main = "Histogram for Blood Pressure Readings",
     xlab = "Blood Pressure Ranges",
     ylab = "Number of patients in the Range",
     breaks = c(seq(0,250,50)),
     col = 'green',
     border = "red")

hist(Hospitaldata$Frequency, 
     main = "Histogram for Frequency",
     xlab = "Frequency",
     ylab = "Frequency Count",
     col = "yellow",
     border = "black",
     probability = TRUE)

#reset plotting window
par(mfrow = c(1, 1))

