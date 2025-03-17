# Install necessary packages if not already installed
install.packages("conjoint")

# Load the necessary libraries
library(conjoint)

# Load the dataset
customer_data <- read.csv("E:\\UE Sose2024\\Sem 2\\Projects\\Marketing Analytics\\1_TaskA\\customer_data.csv")

# Print the first few rows of the dataset to verify
head(customer_data)


# Define the attributes and levels
attributes <- list(
  PreferredGenre = unique(customer_data$PreferredGenre),
  AvgSpend = cut(customer_data$AvgSpend, breaks = 3, labels = c("Low", "Medium", "High"))
)

# Print the attributes to verify
print(attributes)

# Create a profile matrix
profiles <- expand.grid(attributes)
profiles <- as.data.frame(profiles)

# Assuming a preference rating for each profile (for demonstration purposes, we'll use random ratings)
set.seed(123)  # Ensures reproducibility
preferences <- runif(nrow(profiles), min = 1, max = 5)

# Perform the conjoint analysis
ca_result <- caModel(preferences, profiles)

# Print the results
summary(ca_result)

# Extract and print the coefficients (part-worth utilities)
coefficients <- ca_result$coefficients
print(coefficients)

# Inspect the structure of ca_result
str(ca_result)

# Install ggplot2 if not already installed
install.packages("ggplot2")

# Load the ggplot2 library
library(ggplot2)

# Extract part-worth utilities (coefficients)
coefficients <- ca_result$coefficients

# Create a data frame for plotting
df <- data.frame(
  Attribute = c("Intercept", rep("PreferredGenre", length(coefficients) - 2), rep("AvgSpend", 2)),
  Level = c("Intercept", levels(customer_data$PreferredGenre)[-1], levels(attributes$AvgSpend)[-1]),
  Utility = coefficients[, "Estimate"]
)

# Plot the part-worth utilities using ggplot2
ggplot(df, aes(x = Level, y = Utility, fill = Attribute)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Part-Worth Utilities", x = "Attribute Level", y = "Utility") +
  theme_minimal()




