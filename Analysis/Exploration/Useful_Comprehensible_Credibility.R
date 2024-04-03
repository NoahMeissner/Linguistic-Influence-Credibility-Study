#install.packages("lmtest")
library(ggpattern)
library(ggplot2)
library(car)
library(pwr)
library(lmtest)
library(dplyr)


# Get Data
topic_A <- read.csv("Modified/Topic_A.csv")
topic_B <- read.csv("Modified/Topic_B.csv")
topic_C <- read.csv("Modified/Topic_C.csv")
topic_D <- read.csv("Modified/Topic_D.csv")
general <- read.csv("Modified/general.csv")

# == Topic ALL <-> German ==
topic_A_filtered <- inner_join(general, topic_A, by = "id") %>%
  select(soloCondition, A_TextCredible, A_Comprehensible, A_usefulText)

topic_B_filtered <- inner_join(general, topic_B, by = "id") %>%
  select(soloCondition, A_TextCredible, A_Comprehensible, A_usefulText)

topic_C_filtered <- inner_join(general, topic_C, by = "id") %>%
  select(soloCondition, A_TextCredible, A_Comprehensible, A_usefulText)

topic_D_filtered <- inner_join(general, topic_D, by = "id") %>%
  select(soloCondition, A_TextCredible, A_Comprehensible, A_usefulText)

data <- bind_rows(topic_A_filtered, topic_B_filtered, topic_C_filtered, topic_D_filtered)

data <- data %>%
  group_by(A_Comprehensible, A_usefulText) %>%
  summarise(mean_A_TextCredible = mean(as.numeric(A_TextCredible), na.rm = TRUE))

# Multiple Regression mit Interaktionsterm
model <- lm(mean_A_TextCredible ~ A_Comprehensible * A_usefulText, data = data)


# Zusammenfassung des Modells anzeigen
summary(model)

# Optional: Diagnoseplots für das Modell
par(mfrow = c(2, 2))
plot(model)



