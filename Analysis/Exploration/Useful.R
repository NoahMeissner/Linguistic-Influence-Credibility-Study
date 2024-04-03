library(ggpattern)
library(dplyr)
library(car)
library(dplyr)
library(pwr)
library(ggplot2)


# Imports
topic_A <- read.csv("Modified/Topic_A.csv")
topic_B <- read.csv("Modified/Topic_B.csv")
topic_C <- read.csv("Modified/Topic_C.csv")
topic_D <- read.csv("Modified/Topic_D.csv")

############
# == Difficult vs. Easy ===
############

topic_A <- dplyr::filter(topic_A, soloCondition %in% c('englisch_leicht','englisch_schwer'))
topic_B <- dplyr::filter(topic_B, soloCondition %in% c('englisch_leicht','englisch_schwer'))
topic_C <- dplyr::filter(topic_C, soloCondition %in% c('englisch_leicht','englisch_schwer'))
topic_D <- dplyr::filter(topic_D, soloCondition %in% c('englisch_leicht','englisch_schwer'))



topic_A <- topic_A %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('englisch_leicht'), 1, 0))

topic_B <- topic_B %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('englisch_leicht'), 1, 0))

topic_C <- topic_C %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('englisch_leicht'), 1, 0))

topic_D <- topic_D %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('englisch_leicht'), 1, 0))

topic_A_selected <- topic_A %>%
  select(A_usefulText, numbercondition, id)

topic_B_selected <- topic_B %>%
  select(A_usefulText, numbercondition, id)

topic_C_selected <- topic_C %>%
  select(A_usefulText, numbercondition, id)

topic_D_selected <- topic_D %>%
  select(A_usefulText, numbercondition, id)

ggplot(topic_A_selected, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_usefulText Values") +
  ggtitle("Topic A Text A_usefulText")

ggplot(topic_B_selected, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_usefulText Values") +
  ggtitle("Topic B Text A_usefulText")

ggplot(topic_C_selected, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_usefulText Values") +
  ggtitle("Topic C Text A_usefulText")

ggplot(topic_D_selected, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_usefulText Values") +
  ggtitle("Topic D Text A_usefulText")

topic_A_selected <- topic_A_selected %>% mutate(source = 'A')
topic_B_selected <- topic_B_selected %>% mutate(source = 'B')
topic_C_selected <- topic_C_selected %>% mutate(source = 'C')
topic_D_selected <- topic_D_selected %>% mutate(source = 'D')

# Combine DataFrames
all_topics <- bind_rows(topic_A_selected, topic_B_selected, topic_C_selected, topic_D_selected)

ggplot(all_topics, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_TextCredible Values") +
  ggtitle("Topic ALL Text Credible")


######
# == German vs. English ==
######
topic_A <- read.csv("Modified/Topic_A.csv")
topic_B <- read.csv("Modified/Topic_B.csv")
topic_C <- read.csv("Modified/Topic_C.csv")
topic_D <- read.csv("Modified/Topic_D.csv")


topic_A <- dplyr::filter(topic_A, soloCondition %in% c('englisch_leicht','deutsch_leicht'))
topic_B <- dplyr::filter(topic_B, soloCondition %in% c('englisch_leicht','deutsch_leicht'))
topic_C <- dplyr::filter(topic_C, soloCondition %in% c('englisch_leicht','deutsch_leicht'))
topic_D <- dplyr::filter(topic_D, soloCondition %in% c('englisch_leicht','deutsch_leicht'))


topic_A <- topic_A %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('deutsch_leicht'), 1, 0))

topic_B <- topic_B %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('deutsch_leicht'), 1, 0))

topic_C <- topic_C %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('deutsch_leicht'), 1, 0))

topic_D <- topic_D %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('deutsch_leicht'), 1, 0))

topic_A_selected <- topic_A %>%
  select(A_usefulText, numbercondition, id)

topic_B_selected <- topic_B %>%
  select(A_usefulText, numbercondition, id)

topic_C_selected <- topic_C %>%
  select(A_usefulText, numbercondition, id)

topic_D_selected <- topic_D %>%
  select(A_usefulText, numbercondition, id)

ggplot(topic_A_selected, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_usefulText Values") +
  ggtitle("Topic A Text A_usefulText")

ggplot(topic_B_selected, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_usefulText Values") +
  ggtitle("Topic B Text A_usefulText")

ggplot(topic_C_selected, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_usefulText Values") +
  ggtitle("Topic C Text A_usefulText")

ggplot(topic_D_selected, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_usefulText Values") +
  ggtitle("Topic D Text A_usefulText")

topic_A_selected <- topic_A_selected %>% mutate(source = 'A')
topic_B_selected <- topic_B_selected %>% mutate(source = 'B')
topic_C_selected <- topic_C_selected %>% mutate(source = 'C')
topic_D_selected <- topic_D_selected %>% mutate(source = 'D')

# Combine DataFrames
all_topics <- bind_rows(topic_A_selected, topic_B_selected, topic_C_selected, topic_D_selected)

ggplot(all_topics, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_TextCredible Werte") +
  ggtitle("Topic ALL Text Credible")


topic_A <- read.csv("Modified/Topic_A.csv")
topic_B <- read.csv("Modified/Topic_B.csv")
topic_C <- read.csv("Modified/Topic_C.csv")
topic_D <- read.csv("Modified/Topic_D.csv")


topic_A <- dplyr::filter(topic_A, soloCondition %in% c('englisch_schwer','deutsch_schwer'))
topic_B <- dplyr::filter(topic_B, soloCondition %in% c('englisch_schwer','deutsch_schwer'))
topic_C <- dplyr::filter(topic_C, soloCondition %in% c('englisch_schwer','deutsch_schwer'))
topic_D <- dplyr::filter(topic_D, soloCondition %in% c('englisch_schwer','deutsch_schwer'))


### Difficult Language

topic_A <- topic_A %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('englisch_schwer'), 1, 0))

topic_B <- topic_B %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('englisch_schwer'), 1, 0))

topic_C <- topic_C %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('englisch_schwer'), 1, 0))

topic_D <- topic_D %>%
  mutate(numbercondition = ifelse(soloCondition %in% c('englisch_schwer'), 1, 0))

topic_A_selected <- topic_A %>%
  select(A_usefulText, numbercondition, id)

topic_B_selected <- topic_B %>%
  select(A_usefulText, numbercondition, id)

topic_C_selected <- topic_C %>%
  select(A_usefulText, numbercondition, id)

topic_D_selected <- topic_D %>%
  select(A_usefulText, numbercondition, id)

ggplot(topic_A_selected, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_usefulText Values") +
  ggtitle("Topic A Text A_usefulText")

ggplot(topic_B_selected, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_usefulText Values") +
  ggtitle("Topic B Text A_usefulText")

ggplot(topic_C_selected, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_usefulText Values") +
  ggtitle("Topic C Text A_usefulText")

ggplot(topic_D_selected, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_usefulText Values") +
  ggtitle("Topic D Text A_usefulText")

topic_A_selected <- topic_A_selected %>% mutate(source = 'A')
topic_B_selected <- topic_B_selected %>% mutate(source = 'B')
topic_C_selected <- topic_C_selected %>% mutate(source = 'C')
topic_D_selected <- topic_D_selected %>% mutate(source = 'D')

# Combine DataFrames
all_topics <- bind_rows(topic_A_selected, topic_B_selected, topic_C_selected, topic_D_selected)

ggplot(all_topics, aes(x = as.factor(numbercondition), y = A_usefulText)) +
  geom_boxplot() +
  xlab("Number Condition") +
  ylab("A_TextCredible Values") +
  ggtitle("Topic ALL Text Credible")


