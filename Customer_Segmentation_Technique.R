# Load necessary libraries
library(dplyr)
library(tidyr)

customer_data <- read.csv("E:/UE Sose2024/Sem 2/Projects/Marketing Analytics/1_TaskA/customer_data.csv")

# Set seed for reproducibility
set.seed(123)

# Perform K-means clustering
# We'll cluster based on 'Age', 'Income', 'PurchaseFrequency', and 'AvgSpend' 
kmeans_result <- kmeans(customer_data[, c("Age", "Income", "PurchaseFrequency", "AvgSpend")], centers = 3)

# Add the cluster assignment to the original dataset
customer_data$Cluster <- as.factor(kmeans_result$cluster)

# View the first few rows of the data with clusters
head(customer_data)
