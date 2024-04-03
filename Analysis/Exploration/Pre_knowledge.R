library(ggpattern)
library(dplyr)
library(ggplot2)
library(readr)
library(reshape2)


preTask_knowledge <- read_delim("Modified/preTask_knowledge.csv", delim = ";", show_col_types = FALSE)
topic_A <- read.csv("Modified/Topic_A.csv")
topic_B <- read.csv("Modified/Topic_B.csv")
topic_C <- read.csv("Modified/Topic_C.csv")
topic_D <- read.csv("Modified/Topic_D.csv")

print(head(topic_A))


preTask_knowledge <- preTask_knowledge %>% 
  rename(
    A = `Neurodivergent`
  )
preTask_knowledge <- preTask_knowledge %>% 
  rename(
    B = `statistical terms`
  )
preTask_knowledge <- preTask_knowledge %>% 
  rename(
    C = `historical sports`
  )
preTask_knowledge <- preTask_knowledge %>% 
  rename(
    D = `travel planing`
  )
preTask_knowledge <- preTask_knowledge %>% 
  rename(
    id = `ID`
  )




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

############
# Topic A
############

filtered <- preTask_knowledge %>% select(A , id)
data <- inner_join(topic_A,filtered, by = "id")
boxplot(data$A_TextCredible ~ data$A)

############
# Topic B
############

filtered <- preTask_knowledge %>% select(B , id)
data <- inner_join(topic_B,filtered, by = "id")
boxplot(data$A_TextCredible ~ data$B)

############
# Topic C
############

filtered <- preTask_knowledge %>% select(C , id)
data <- inner_join(topic_C,filtered, by = "id")
boxplot(data$A_TextCredible ~ data$C)

############
# Topic D
############

filtered <- preTask_knowledge %>% select(D , id)
data <- inner_join(topic_C,filtered, by = "id")
boxplot(data$A_TextCredible ~ data$D)



