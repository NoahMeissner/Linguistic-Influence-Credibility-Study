#install.packages("lmtest")
library(ggpattern)
library(ggplot2)
library(car)
library(pwr)
library(lmtest)
library(dplyr)

#######################
# Hypothesis4 (H4): The perceived credibility of a educational blog article is influenced by the interaction between
#the language proficiency of a reader and the difficulty of the text.
#######################

# Get the Data
topic_A <- read.csv("Modified/Topic_A.csv")
topic_B <- read.csv("Modified/Topic_B.csv")
topic_C <- read.csv("Modified/Topic_C.csv")
topic_D <- read.csv("Modified/Topic_D.csv")
general <- read.csv("Modified/general.csv")

# == Topic ALL <-> German ==
topic_A_filtered <- inner_join(general, topic_A, by = "id") %>%
  select(soloCondition, A_TextCredible, EnglishProficiency)

topic_B_filtered <- inner_join(general, topic_B, by = "id") %>%
  select(soloCondition, A_TextCredible, EnglishProficiency)

topic_C_filtered <- inner_join(general, topic_C, by = "id") %>%
  select(soloCondition, A_TextCredible, EnglishProficiency)

topic_D_filtered <- inner_join(general, topic_D, by = "id") %>%
  select(soloCondition, A_TextCredible, EnglishProficiency)

data <- bind_rows(topic_A_filtered, topic_B_filtered, topic_C_filtered, topic_D_filtered)

data <- dplyr::filter(data, soloCondition %in% c('englisch_leicht', 'englisch_schwer'))

data_means <- data %>%
  group_by(soloCondition, EnglishProficiency) %>%
  summarise(mean_A_TextCredible = mean(as.numeric(A_TextCredible), na.rm = TRUE))

median_english_proficiency <- median(data_means$EnglishProficiency, na.rm = TRUE)

data_means <- data_means %>%
  mutate(EnglishProficiency = ifelse(EnglishProficiency > median_english_proficiency, "Above Median", "Below or Equal Median")) 


head(data)

data$soloCondition <- factor(data$soloCondition)
data$EnglishProficiency <- factor(data$EnglishProficiency)

# Multiple Regression with Interactionterm
model <- lm(A_TextCredible ~ soloCondition * EnglishProficiency, data = data)

# Summary Modell
summary(model)

# Optional: Diagnoseplots Model
par(mfrow = c(2, 2))
plot(model)

# => no Influence
