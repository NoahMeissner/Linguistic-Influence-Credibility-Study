library(ggpattern)
library(dplyr)
library(reshape2)
library(ggplot2)

topic_A <- read.csv("Modified/Topic_A.csv")
topic_B <- read.csv("Modified/Topic_B.csv")
topic_C <- read.csv("Modified/Topic_C.csv")
topic_D <- read.csv("Modified/Topic_D.csv")



###
# Topic HEALTH
###
health_english <- topic_A  %>% filter(soloCondition == 'englisch_schwer' | soloCondition == 'englisch_leicht')
health_deutsch <- topic_A  %>% filter(soloCondition == 'deutsch_schwer' | soloCondition == 'deutsch_leicht')


filter_process_A <- function(data) {
  step1 <- data %>% filter(A_BrainTumor == '0')
  print(nrow(step1)) 
  
  step2 <- step1 %>% filter(A_MentalChallenging == '1')
  print(nrow(step2)) 
  
  final_step <- step2 %>% filter(A_identifyNeurodiverse == '1')
  print(nrow(final_step)) 
  return(final_step)
}
english <- filter_process_A(health_english)
print(nrow(english)/nrow(health_english)) # 17 %

deutsch <- filter_process_A(health_deutsch)
print(nrow(deutsch)/nrow(health_deutsch)) #56 % 

###
# Finance Text
###
finance_english <- topic_B  %>% filter(soloCondition == 'englisch_schwer' | soloCondition == 'englisch_leicht')
finance_deutsch <- topic_B  %>% filter(soloCondition == 'deutsch_schwer' | soloCondition == 'deutsch_leicht')


filter_process_B <- function(data) {
  step1 <- data %>% filter(A_CapitalAsset == '1')
  print(nrow(step1)) 
  
  step2 <- step1 %>% filter(A_EfficentMarket == '1')
  print(nrow(step2)) 
  
  final_step <- step2 %>% filter(A_CruicalStatistic == '1')
  print(nrow(final_step)) 
  return(final_step)
}
english <- filter_process_B(finance_english)
print(nrow(english)/nrow(finance_english)) # 18 %

deutsch <- filter_process_B(finance_deutsch)
print(nrow(deutsch)/nrow(finance_deutsch)) #29 % 


###
# Topic Sports
###
sports_english <- topic_C  %>% filter(soloCondition == 'englisch_schwer' | soloCondition == 'englisch_leicht')
sports_deutsch <- topic_C  %>% filter(soloCondition == 'deutsch_schwer' | soloCondition == 'deutsch_leicht')


filter_process_B <- function(data) {
  step1 <- data %>% filter(A_Pasuckuakohowog == '1')
  print(nrow(step1)) 
  
  step2 <- step1 %>% filter(A_Tewaarthon == '1')
  print(nrow(step2)) 
  
  final_step <- step2 %>% filter(A_Mayan_Ball == '1')
  print(nrow(final_step)) 
  return(final_step)
}
english <- filter_process_B(sports_english)
print(nrow(english)/nrow(sports_english)) # 41 %

deutsch <- filter_process_B(sports_deutsch)
print(nrow(deutsch)/nrow(sports_deutsch)) #43 % 

###
# Topic Travel
###
travel_english <- topic_D  %>% filter(soloCondition == 'englisch_schwer' | soloCondition == 'englisch_leicht')
travel_deutsch <- topic_D  %>% filter(soloCondition == 'deutsch_schwer' | soloCondition == 'deutsch_leicht')


filter_process_B <- function(data) {
  step1 <- data %>% filter(A_SeasonTraveler == '1')
  print(nrow(step1)) 
  
  step2 <- step1 %>% filter(A_HighlightMonitoring == '1')
  print(nrow(step2)) 
  
  final_step <- step2 %>% filter(A_ImportanceDestination == '1')
  print(nrow(final_step)) 
  return(final_step)
}
english <- filter_process_B(travel_english)
print(nrow(english)/nrow(travel_english)) # 75 %

deutsch <- filter_process_B(travel_deutsch)
print(nrow(deutsch)/nrow(travel_deutsch)) # 64 % 





