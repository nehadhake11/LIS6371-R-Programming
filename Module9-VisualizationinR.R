# Read data from the text file
Wine_data<- read.table("wine.txt", header = TRUE, sep = ",")
print(Wine_data)
colnames(Wine_data)

# Plotting without any package
plot(Wine_data$alcohol, Wine_data$deaths, main = "Alcohol Consumption vs Deaths", xlab = "Alcohol Consumption", ylab = "Deaths")

# Load lattice package
library(lattice)

# Creating lattice plot 1: Scatter plot
xyplot(deaths ~ alcohol, data = Wine_data, main = "Alcohol Consumption vs Heart Disease", xlab = "Alcohol Consumption", ylab = "Disease")

# Creating lattice Plot 2: bwplot (box-and-whisker plot)
bwplot(deaths ~ country, data = Wine_data, main = "Box-and-Whisker Plot: Deaths by Country", xlab = "Country", ylab = "Deaths")

# Creating lattice Plot 3: histogram
histogram(~ alcohol, data = Wine_data, main = "Distribution of Alcohol Consumption", xlab = "Alcohol Consumption (Liters)", ylab = "deaths", col = "blue", breaks = 10)

# Creating lattice Plot 4: densityplot
densityplot(~ alcohol, data = Wine_data, main = "Density Plot: Alcohol Consumption", xlab = "Alcohol Consumption", ylab = "Density")

# Creating lattice Plot 5: dotplot
dotplot(alcohol ~ country, data = Wine_data, main = "Dot Plot: Alcohol Consumption by Country", xlab = "Country", ylab = "Alcohol Consumption")

# Install ggplot2 package 
install.packages("ggplot2")
# Load ggplot2 package
library(ggplot2)
# Creating ggplot2 plot
ggplot(Wine_data, aes(x = alcohol, y = liver)) +
  geom_point() +
  labs(title = "Alcohol Consumption vs Liver Disease", x = "Alcohol Consumption", y = "Liver Disease")

# Violin plot: Distribution of Alcohol Consumption
ggplot(Wine_data, aes(x = "", y = alcohol)) +
  geom_violin(fill = "orange") +
  labs(title = "Violin Plot: Distribution of Alcohol Consumption", x = "", y = "Alcohol Consumption")

# Density plot: Distribution of Alcohol Consumption
ggplot(Wine_data, aes(x = alcohol)) +
  geom_density(fill = "purple", alpha = 0.5) +
  labs(title = "Density Plot: Distribution of Alcohol Consumption", x = "Alcohol Consumption", y = "Density")

# Convert country variable to a factor if it's not already
Wine_data$country <- factor(Wine_data$country)

# Heatmap: Magnitude of Relationship between Country and Alcohol Consumption
ggplot(Wine_data, aes(x = country, y = alcohol, fill = alcohol)) +
  geom_tile() +
  labs(title = "Heatmap: Relationship between Country and Alcohol Consumption", x = "Country", y = "Alcohol Consumption") +
  scale_fill_gradient(low = "blue", high = "red")

# Faceted plot: Distribution of Alcohol Consumption by Country
ggplot(Wine_data, aes(x = alcohol)) +
  geom_density(fill = "blue", alpha = 0.5) +
  labs(title = "Faceted Plot: Distribution of Alcohol Consumption by Country", x = "Alcohol Consumption", y = "Density") +
  facet_wrap(~ country, scales = "free")

# Stacked bar plot: Composition of Deaths by Country
ggplot(Wine_data, aes(x = country, y = deaths, fill = country)) +
  geom_bar(stat = "identity") +
  labs(title = "Stacked Bar Plot: Composition of Deaths by Country", x = "Country", y = "Deaths") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_flip()

# Bubble plot: Deaths vs Alcohol Consumption with Bubble Size representing Heart disease
ggplot(Wine_data, aes(x = alcohol, y = deaths, size = heart)) +
  geom_point() +
  labs(title = "Bubble Plot: Deaths vs Alcohol Consumption", x = "Alcohol Consumption", y = "Deaths", size = "Heart Disease")













