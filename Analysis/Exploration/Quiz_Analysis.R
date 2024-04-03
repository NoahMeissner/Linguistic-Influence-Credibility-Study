library(ggpattern)
library(dplyr)
library(reshape2)
library(ggplot2)

# Imports
topic_A <- read.csv("Modified/Topic_A.csv")
topic_B <- read.csv("Modified/Topic_B.csv")
topic_C <- read.csv("Modified/Topic_C.csv")
topic_D <- read.csv("Modified/Topic_D.csv")

#######################
# Topic HEALTH
#######################
health_english <- topic_A  %>% filter(soloCondition == 'englisch_schwer' | soloCondition == 'englisch_leicht')
health_deutsch <- topic_A  %>% filter(soloCondition == 'deutsch_schwer' | soloCondition == 'deutsch_leicht')

add_filter_indicator <- function(data) {
  data <- data %>% 
    mutate(
      PassedFilter = if_else(A_BrainTumor == '0' & A_MentalChallenging == '1' & A_identifyNeurodiverse == '1', TRUE, FALSE)
    )
  
  return(data)
}

health_english_with_indicator <- add_filter_indicator(health_english)

topic_A <- add_filter_indicator(topic_A)

filtered_counts <- topic_A %>%
  group_by(soloCondition) %>%
  summarise(Count = sum(PassedFilter, na.rm = TRUE))  

# Create Diagram
ggplot(filtered_counts, aes(x = soloCondition, y = Count)) +
  geom_bar(stat = "identity", fill = "blue") +
  theme_minimal() +
  labs(x = "Solo Condition", y = "Count of Passed Filter") +
  ggtitle("Count of Individuals Who Passed the Filter by Solo Condition")


out_english_health <- health_english_with_indicator %>% filter(PassedFilter == FALSE)
english_health <- health_english_with_indicator %>% filter(PassedFilter == TRUE)


print(nrow(english_health)/nrow(health_english)) # 0.1875

health_deutsch_with_indicator <- add_filter_indicator(health_deutsch)
out_deutsch_health <- health_deutsch_with_indicator %>% filter(PassedFilter == FALSE)
deutsch_health <- health_deutsch_with_indicator %>% filter(PassedFilter == TRUE)

print(nrow(deutsch_health)/nrow(health_deutsch)) # 0.5625

#######################
# Finance Text
#######################
finance_english <- topic_B  %>% filter(soloCondition == 'englisch_schwer' | soloCondition == 'englisch_leicht')
finance_deutsch <- topic_B  %>% filter(soloCondition == 'deutsch_schwer' | soloCondition == 'deutsch_leicht')

add_filter_indicator <- function(data) {
  data <- data %>% 
    mutate(
      PassedFilter = if_else(A_CapitalAsset == '1' & A_EfficentMarket == '1' & A_CruicalStatistic == '1', TRUE, FALSE)
    )
  
  return(data)
}

finance_english_with_indicator <- add_filter_indicator(finance_english)

topic_B <- add_filter_indicator(topic_B)

filtered_counts <- topic_B %>%
  group_by(soloCondition) %>%
  summarise(Count = sum(PassedFilter, na.rm = TRUE))  # Sum TRUE Values

# Create Diagram
ggplot(filtered_counts, aes(x = soloCondition, y = Count)) +
  geom_bar(stat = "identity", fill = "blue") +
  theme_minimal() +
  labs(x = "Solo Condition", y = "Count of Passed Filter") +
  ggtitle("Count of Individuals Who Passed the Filter by Solo Condition")


out_english_finance <- finance_english_with_indicator %>% filter(PassedFilter == FALSE)
english_finance <- finance_english_with_indicator %>% filter(PassedFilter == TRUE)

print(nrow(english_finance)/nrow(finance_english)) # 0.1875

finance_deutsch_with_indicator <- add_filter_indicator(finance_deutsch)
out_deutsch_finance <- finance_deutsch_with_indicator %>% filter(PassedFilter == FALSE)
deutsch_finance <- finance_deutsch_with_indicator %>% filter(PassedFilter == TRUE)

print(nrow(deutsch_finance)/nrow(finance_deutsch)) # 0.25

#######################
# Topic Sports
#######################
sports_english <- topic_C  %>% filter(soloCondition == 'englisch_schwer' | soloCondition == 'englisch_leicht')
sports_deutsch <- topic_C  %>% filter(soloCondition == 'deutsch_schwer' | soloCondition == 'deutsch_leicht')

add_filter_indicator <- function(data) {
  data <- data %>% 
    mutate(
      PassedFilter = if_else(A_Pasuckuakohowog == '1' & A_Tewaarthon == '1' & A_Mayan_Ball == '1', TRUE, FALSE)
    )
  
  return(data)
}

topic_C <- add_filter_indicator(topic_C)

filtered_counts <- topic_C %>%
  group_by(soloCondition) %>%
  summarise(Count = sum(PassedFilter, na.rm = TRUE)) # Sum TRUE Values

# Create Diagram
ggplot(filtered_counts, aes(x = soloCondition, y = Count)) +
  geom_bar(stat = "identity", fill = "blue") +
  theme_minimal() +
  labs(x = "Solo Condition", y = "Count of Passed Filter") +
  ggtitle("Count of Individuals Who Passed the Filter by Solo Condition")


sports_english_with_indicator <- add_filter_indicator(sports_english)

out_english_sports <- sports_english_with_indicator %>% filter(PassedFilter == FALSE)
english_sports <- sports_english_with_indicator %>% filter(PassedFilter == TRUE)

print(nrow(english_sports)/nrow(sports_english)) # 0.4375

sports_deutsch_with_indicator <- add_filter_indicator(sports_deutsch)
out_deutsch_sports <- sports_deutsch_with_indicator %>% filter(PassedFilter == FALSE)
deutsch_sports <- sports_deutsch_with_indicator %>% filter(PassedFilter == TRUE)

print(nrow(deutsch_sports)/nrow(sports_deutsch)) # 0.4375


#######################
# Topic Travel
#######################
travel_english <- topic_D  %>% filter(soloCondition == 'englisch_schwer' | soloCondition == 'englisch_leicht')
travel_deutsch <- topic_D  %>% filter(soloCondition == 'deutsch_schwer' | soloCondition == 'deutsch_leicht')

add_filter_indicator <- function(data) {
  data <- data %>% 
    mutate(
      PassedFilter = if_else(A_SeasonTraveler == '1' & A_HighlightMonitoring == '1' & A_ImportanceDestination == '1', TRUE, FALSE)
    )
  
  return(data)
}

topic_D <- add_filter_indicator(topic_D)

filtered_counts <- topic_D %>%
  group_by(soloCondition) %>%
  summarise(Count = sum(PassedFilter, na.rm = TRUE))  # Sum TRUE Values

# Create Diagram
ggplot(filtered_counts, aes(x = soloCondition, y = Count)) +
  geom_bar(stat = "identity", fill = "blue") +
  theme_minimal() +
  labs(x = "Solo Condition", y = "Count of Passed Filter") +
  ggtitle("Count of Individuals Who Passed the Filter by Solo Condition")


travel_english_with_indicator <- add_filter_indicator(travel_english)

out_english_travel <- travel_english_with_indicator %>% filter(PassedFilter == FALSE)
english_travel <- travel_english_with_indicator %>% filter(PassedFilter == TRUE)

print(nrow(english_travel)/nrow(travel_english)) # 0.75

travel_deutsch_with_indicator <- add_filter_indicator(travel_deutsch)
out_deutsch_travel <- travel_deutsch_with_indicator %>% filter(PassedFilter == FALSE)
deutsch_travel <- travel_deutsch_with_indicator %>% filter(PassedFilter == TRUE)

print(nrow(deutsch_travel)/nrow(travel_deutsch)) # 0.625

#######################
# == General evaluation
#######################
# English 
finance_english_selected <- finance_english_with_indicator %>% 
  select(A_TextCredible, PassedFilter,soloCondition, id)

health_english_with_indicator <- health_english_with_indicator %>% 
  select(A_TextCredible, PassedFilter,soloCondition, id)

sports_english_with_indicator <- sports_english_with_indicator %>% 
  select(A_TextCredible, PassedFilter,soloCondition, id)

travel_english_with_indicator <- travel_english_with_indicator %>% 
  select(A_TextCredible, PassedFilter,soloCondition, id)

all_english_combined <- bind_rows(
  finance_english_selected,
  health_english_with_indicator,
  sports_english_with_indicator,
  travel_english_with_indicator
)

print(head(all_english_combined))

mean(all_english_combined$PassedFilter) * 100 # mean 39.0625
 

ggplot(all_english_combined, aes(x = as.factor(PassedFilter), y = A_TextCredible)) +
  geom_boxplot() +
  xlab("Tasks answered correctly") +
  ylab("A_TextCredible values") +
  ggtitle("English Text Credible")


filtered_counts <- all_english_combined %>%
  group_by(soloCondition) %>%
  summarise(Count = sum(PassedFilter, na.rm = TRUE))  # Sum TRUE Values

# Create Diagram
ggplot(filtered_counts, aes(x = soloCondition, y = Count)) +
  geom_bar(stat = "identity", fill = "blue") +
  theme_minimal() +
  labs(x = "Solo Condition", y = "Count of Passed Filter") +
  ggtitle("Count of Individuals Who Passed the Filter by Solo Condition")


# German 
finance_deutsch_with_indicator <- finance_deutsch_with_indicator %>% 
  select(A_TextCredible, PassedFilter,soloCondition, id)

health_deutsch_with_indicator <- health_deutsch_with_indicator %>% 
  select(A_TextCredible, PassedFilter,soloCondition, id)

sports_deutsch_with_indicator <- sports_deutsch_with_indicator %>% 
  select(A_TextCredible, PassedFilter,soloCondition, id)

travel_deutsch_with_indicator <- travel_deutsch_with_indicator %>% 
  select(A_TextCredible, PassedFilter,soloCondition, id)

all_german_combined <- bind_rows(
  finance_deutsch_with_indicator,
  health_deutsch_with_indicator,
  sports_deutsch_with_indicator,
  travel_deutsch_with_indicator
)

mean(all_german_combined$PassedFilter) * 100 # 46.875


ggplot(all_german_combined, aes(x = as.factor(PassedFilter), y = A_TextCredible)) +
  geom_boxplot() +
  xlab("Tasks answered correctly") +
  ylab("A_TextCredible values") +
  ggtitle("German Text Credible")

filtered_counts <- all_german_combined %>%
  group_by(soloCondition) %>%
  summarise(Count = sum(PassedFilter, na.rm = TRUE))  # Sum TRUE Values

# Create Diagram
ggplot(filtered_counts, aes(x = soloCondition, y = Count)) +
  geom_bar(stat = "identity", fill = "blue") +
  theme_minimal() +
  labs(x = "Solo Condition", y = "Count of Passed Filter") +
  ggtitle("Count of Individuals Who Passed the Filter by Solo Condition")


chisq.test(all_german_combined$PassedFilter,all_english_combined$PassedFilter )
# p = 0.2546


