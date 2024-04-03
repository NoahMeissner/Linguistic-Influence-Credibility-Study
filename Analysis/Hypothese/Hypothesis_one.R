library(ggpattern)
library(dplyr)
library(ggplot2)
library(car)
library(dplyr)
library(pwr)


topic_A <- read.csv("Modified/Topic_A.csv")
topic_B <- read.csv("Modified/Topic_B.csv")
topic_C <- read.csv("Modified/Topic_C.csv")
topic_D <- read.csv("Modified/Topic_D.csv")

print(nrow(topic_A))

#######################
# H1: The choice of language affects the perception of credibility of educational blog articles
#######################
# T-Test
topic_A <- topic_A %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('deutsch_leicht', 'deutsch_schwer'), 1, 0))

topic_B <- topic_B %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('deutsch_leicht', 'deutsch_schwer'), 1, 0))

topic_C <- topic_C %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('deutsch_leicht', 'deutsch_schwer'), 1, 0))

topic_D <- topic_D %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('deutsch_leicht', 'deutsch_schwer'), 1, 0))

topic_A_selected <- topic_A %>%
  select(A_TextCredible, numbercondition,soloCondition, id)

topic_B_selected <- topic_B %>%
  select(A_TextCredible, numbercondition,soloCondition, id)

topic_C_selected <- topic_C %>%
  select(A_TextCredible, numbercondition,soloCondition, id)

topic_D_selected <- topic_D %>%
  select(A_TextCredible, numbercondition,soloCondition, id)

ggplot(topic_A_selected, aes(x = as.factor(numbercondition), y = A_TextCredible)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_TextCredible Werte") +
  ggtitle("Topic A Text Credible")

ggplot(topic_B_selected, aes(x = as.factor(numbercondition), y = A_TextCredible)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_TextCredible Werte") +
  ggtitle("Topic B Text Credible")

ggplot(topic_C_selected, aes(x = as.factor(numbercondition), y = A_TextCredible)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_TextCredible Werte") +
  ggtitle("Topic C Text Credible")

ggplot(topic_D_selected, aes(x = as.factor(numbercondition), y = A_TextCredible)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_TextCredible Werte") +
  ggtitle("Topic D Text Credible")

topic_A_selected <- topic_A_selected %>% mutate(source = 'A')
topic_B_selected <- topic_B_selected %>% mutate(source = 'B')
topic_C_selected <- topic_C_selected %>% mutate(source = 'C')
topic_D_selected <- topic_D_selected %>% mutate(source = 'D')

# Combine DataFrames
all_topics <- bind_rows(topic_A_selected, topic_B_selected, topic_C_selected, topic_D_selected)


ggplot(all_topics, aes(x = as.factor(numbercondition), y = A_TextCredible)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_TextCredible Werte") +
  ggtitle("Topic ALL Text Credible")


#######################
# Analysis
#######################
# ==== Topic A =====

leveneTest(data = all_topics, A_TextCredible ~ as.factor(source)) # p_value 0.1108 

shapiro.test(topic_A_selected %>% pull(A_TextCredible)) # p_value 0.0005387
shapiro.test(topic_B_selected %>% pull(A_TextCredible)) # p_value 5.699e-05
shapiro.test(topic_C_selected %>% pull(A_TextCredible)) # p_value 0.05754 -> t
shapiro.test(topic_D_selected %>% pull(A_TextCredible)) # p_value 0.0005144
shapiro.test(all_topics %>% pull(A_TextCredible)) # p_value 8.803e-09


result <- wilcox.test(A_TextCredible ~ numbercondition, data = topic_A_selected, exact = TRUE)
print(result) # p_value 0.14 

result <- wilcox.test(A_TextCredible ~ numbercondition, data = topic_B_selected, exact = TRUE)
print(result) # p_value 1

result <- t.test(A_TextCredible ~ numbercondition, data = topic_C_selected, exact = TRUE)
print(result) # p_value 0.608

result <- wilcox.test(A_TextCredible ~ numbercondition, data = topic_D_selected, exact = TRUE)
print(result) # p_value 0.1743

result <- wilcox.test(A_TextCredible ~ numbercondition, data = all_topics, exact = TRUE)
print(result) # p_value 0.0996

