# Load necessary libraries
library(dplyr)
library(tidyr)

# Set a random seed for reproducibility
set.seed(123)

# Generate artificial customer data for a bookstore
customer_data <- data.frame(
  CustomerID = 1:1000,
  Age = sample(18:65, 1000, replace = TRUE),
  Income = sample(20000:100000, 1000, replace = TRUE),
  PurchaseFrequency = sample(1:20, 1000, replace = TRUE),
  AvgSpend = sample(10:50, 1000, replace = TRUE),
  PreferredGenre = sample(c("Fiction", "Non-Fiction", "Mystery", "Romance", "Sci-Fi"), 1000, replace = TRUE)
)

# Calculate TotalSpend as PurchaseFrequency * AvgSpend
customer_data <- customer_data %>%
  mutate(TotalSpend = PurchaseFrequency * AvgSpend)

# View the first few rows of the data
head(customer_data)

# Save the dataset to a CSV file for later use
write.csv(customer_data, "customer_data.csv", row.names = FALSE)

