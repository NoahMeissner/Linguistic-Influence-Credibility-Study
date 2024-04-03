library(ggpattern)
library(dplyr)
library(ggplot2)
library(readr)
library(reshape2)


preTask_knowledge <- read_delim("Modified/preTask_knowledge.csv", delim = ";", show_col_types = FALSE)

print(head(preTask_knowledge))


df_long <- melt(preTask_knowledge, variable.name = "Category", value.name = "Value")

print(df_long)

ggplot(df_long, aes(x = Category, fill = factor(Value))) +
  geom_bar(position = "stack") +
  scale_fill_manual(values = c("0" = "red", "1" = "blue"), 
                    labels = c("0" = "False", "1" = "True"), 
                    name = "True/False") +
  labs(x = "Categories", y = "Number") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
