#install.packages("lmtest")
library(ggpattern)
library(ggplot2)
library(car)
library(pwr)
library(lmtest)
library(dplyr)

#######################
# Hypothesis3 (H3): The difficulty of the text influences the perception of content credibility.
#######################

# Get Data
topic_A <- read.csv("Modified/Topic_A.csv")
topic_B <- read.csv("Modified/Topic_B.csv")
topic_C <- read.csv("Modified/Topic_C.csv")
topic_D <- read.csv("Modified/Topic_D.csv")
general <- read.csv("Modified/general.csv")


# == Topic ALL <-> German ==
topic_A_filtered <- inner_join(general, topic_A, by = "id") %>%
  select(soloCondition, A_TextCredible)

topic_B_filtered <- inner_join(general, topic_B, by = "id") %>%
  select(soloCondition, A_TextCredible)

topic_C_filtered <- inner_join(general, topic_C, by = "id") %>%
  select(soloCondition, A_TextCredible)

topic_D_filtered <- inner_join(general, topic_D, by = "id") %>%
  select(soloCondition, A_TextCredible)

data <- bind_rows(topic_A_filtered, topic_B_filtered, topic_C_filtered, topic_D_filtered)


english_easy <- dplyr::filter(data, soloCondition %in% c('englisch_leicht'))
english_hard <- dplyr::filter(data, soloCondition %in% c('englisch_schwer'))
german_easy <- dplyr::filter(data, soloCondition %in% c('deutsch_leicht'))
german_hard <- dplyr::filter(data, soloCondition %in% c('deutsch_schwer'))


shapiro.test(english_easy$A_TextCredible) # p_value 0.0005571
shapiro.test(english_hard$A_TextCredible) # p_value 0.001458

shapiro.test(german_easy$A_TextCredible) # p_value 0.00777
shapiro.test(german_hard$A_TextCredible) # p_value 0.003151

combined_data <- rbind(english_easy, english_hard)


leveneTest(A_TextCredible ~ soloCondition, data = combined_data) # p_value 0.629

boxplot(english_easy$A_TextCredible, english_hard$A_TextCredible)

# English_only
result <- wilcox.test(english_easy$A_TextCredible, english_hard$A_TextCredible, exact = FALSE)
print(result) # p_value 0.797

boxplot(german_easy$A_TextCredible, german_hard$A_TextCredible)

# German only
result <- wilcox.test(german_easy$A_TextCredible, german_hard$A_TextCredible, exact = FALSE)
print(result) # p_value 0.9452



