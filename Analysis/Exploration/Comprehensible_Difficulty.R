library(ggpattern)
library(dplyr)
library(car)
library(dplyr)
library(pwr)
library(ggplot2)


topic_A <- read.csv("Modified/Topic_A.csv")
topic_B <- read.csv("Modified/Topic_B.csv")
topic_C <- read.csv("Modified/Topic_C.csv")
topic_D <- read.csv("Modified/Topic_D.csv")


topic_A <- topic_A %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('deutsch_leicht', 'englisch_leicht'), 1, 0))

topic_B <- topic_B %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('deutsch_leicht', 'englisch_leicht'), 1, 0))

topic_C <- topic_C %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('deutsch_leicht', 'englisch_leicht'), 1, 0))

topic_D <- topic_D %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('deutsch_leicht', 'englisch_leicht'), 1, 0))

topic_A_selected <- topic_A %>%
  select(A_Comprehensible, numbercondition, id)

topic_B_selected <- topic_B %>%
  select(A_Comprehensible, numbercondition, id)

topic_C_selected <- topic_C %>%
  select(A_Comprehensible, numbercondition, id)

topic_D_selected <- topic_D %>%
  select(A_Comprehensible, numbercondition, id)

ggplot(topic_A_selected, aes(x = as.factor(numbercondition), y = A_Comprehensible)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_Comprehensible Values") +
  ggtitle("Topic A Text A_Comprehensible")


ggplot(topic_B_selected, aes(x = as.factor(numbercondition), y = A_Comprehensible)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_Comprehensible Values") +
  ggtitle("Topic B Text A_Comprehensible")

print(topic_C_selected)

ggplot(topic_C_selected, aes(x = as.factor(numbercondition), y = A_Comprehensible)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_Comprehensible Values") +
  ggtitle("Topic C Text A_Comprehensible")

ggplot(topic_D_selected, aes(x = as.factor(numbercondition), y = A_Comprehensible)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_Comprehensible Values") +
  ggtitle("Topic D Text A_Comprehensible")

topic_A_selected <- topic_A_selected %>% mutate(source = 'A')
topic_B_selected <- topic_B_selected %>% mutate(source = 'B')
topic_C_selected <- topic_C_selected %>% mutate(source = 'C')
topic_D_selected <- topic_D_selected %>% mutate(source = 'D')

# Combine DataFrames
all_topics <- bind_rows(topic_A_selected, topic_B_selected, topic_C_selected, topic_D_selected)

ggplot(all_topics, aes(x = as.factor(numbercondition), y = A_Comprehensible)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_Comprehensible Values") +
  ggtitle("Topic ALL Text A_Comprehensible ")

