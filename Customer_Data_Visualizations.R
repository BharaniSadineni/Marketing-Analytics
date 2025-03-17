# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(GGally)
library(ggcorrplot)

# Load the customer data
customer_data <- read.csv("E:/UE Sose2024/Sem 2/Projects/Marketing Analytics/1_TaskA/customer_data.csv")


# Set seed for reproducibility
set.seed(123)

# Perform K-means clustering
kmeans_result <- kmeans(customer_data[, c("Age", "Income", "PurchaseFrequency", "AvgSpend")], centers = 3)

# Add the cluster assignment to the original dataset
customer_data$Cluster <- as.factor(kmeans_result$cluster)

# 1. Scatter Plot (Income vs. Age)
ggplot(customer_data, aes(x = Income, y = Age, color = Cluster)) +
  geom_point() +
  labs(title = "Customer Segments (Income vs Age)", x = "Income", y = "Age") +
  theme_minimal()

# 2. Scatter Plot (PurchaseFrequency vs. AvgSpend)
ggplot(customer_data, aes(x = PurchaseFrequency, y = AvgSpend, color = Cluster)) +
  geom_point() +
  labs(title = "Customer Segments (Purchase Frequency vs Average Spend)", x = "Purchase Frequency", y = "Average Spend") +
  theme_minimal()

# 3. Boxplot (Income by Cluster)
ggplot(customer_data, aes(x = Cluster, y = Income, fill = Cluster)) +
  geom_boxplot() +
  labs(title = "Income Distribution by Customer Segment", x = "Cluster", y = "Income") +
  theme_minimal()

# 4. Boxplot (Age by Cluster)
ggplot(customer_data, aes(x = Cluster, y = Age, fill = Cluster)) +
  geom_boxplot() +
  labs(title = "Age Distribution by Customer Segment", x = "Cluster", y = "Age") +
  theme_minimal()

# 5. Bar Plot of Preferred Genres by Cluster
ggplot(customer_data, aes(x = PreferredGenre, fill = Cluster)) +
  geom_bar(position = "fill") +
  labs(title = "Preferred Genre by Customer Segment", x = "Preferred Genre", y = "Proportion") +
  theme_minimal()

# 6. Cluster Centers (Centroids)
cluster_centroids <- as.data.frame(kmeans_result$centers)
cluster_centroids$Cluster <- 1:nrow(cluster_centroids)

ggplot(customer_data, aes(x = Income, y = Age, color = Cluster)) +
  geom_point() +
  geom_point(data = cluster_centroids, aes(x = Income, y = Age, color = as.factor(Cluster)), size = 5, shape = 4) +
  labs(title = "Customer Segments with Centroids (Income vs Age)", x = "Income", y = "Age") +
  theme_minimal()

# 7. Pairwise Scatter Plots (Pairwise relationship between variables)
ggpairs(customer_data[, c("Age", "Income", "PurchaseFrequency", "AvgSpend", "Cluster")], aes(color = Cluster))


# 8. Correlation Heatmap
corr_matrix <- cor(customer_data[, c("Age", "Income", "PurchaseFrequency", "AvgSpend")])
ggcorrplot(corr_matrix, hc.order = TRUE, type = "lower")

# 9. Histogram of Total Spend by Cluster
ggplot(customer_data, aes(x = TotalSpend, fill = Cluster)) +
  geom_histogram(bins = 30, alpha = 0.6) +
  labs(title = "Total Spend Distribution by Cluster", x = "Total Spend", y = "Count") +
  theme_minimal()

