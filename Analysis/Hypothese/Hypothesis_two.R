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


#######################
# H2: The perceived language proficiency of the reader influences the perception of content credibility.
#######################

topic_A_selected <- topic_A %>% mutate(source = 'A')
topic_B_selected <- topic_B %>% mutate(source = 'B')
topic_C_selected <- topic_C %>% mutate(source = 'C')
topic_D_selected <- topic_D %>% mutate(source = 'D')
all_topics <- bind_rows(topic_A_selected, topic_B_selected, topic_C_selected, topic_D_selected)

all_topics <- inner_join(all_topics, general, by = "id")


data_filtered <- all_topics %>%
  filter(soloCondition %in% c("englisch_schwer")) 
  


median_english_proficiency <- median(data_filtered$EnglishProficiency, na.rm = TRUE)


data_filtered <- data_filtered %>%
  mutate(EnglishProficiencyGroup = ifelse(EnglishProficiency > median_english_proficiency, "Above Median", "Below or Equal Median")) 



print(data_filtered)


ggplot(data_filtered, aes(x = as.factor(EnglishProficiencyGroup), y = A_TextCredible)) +
  geom_boxplot() +
  xlab("English Proficiency") +
  ylab("Credibility") +
  ggtitle("Topic ALL Text Credible")


leveneTest(data = data_filtered, A_TextCredible ~ as.factor(EnglishProficiencyGroup)) 
# p_value 0.1484

shapiro_test_above <- shapiro.test(filter(data_filtered, EnglishProficiencyGroup == "Above Median")$A_TextCredible)
shapiro_test_below <- shapiro.test(filter(data_filtered, EnglishProficiencyGroup == "Below or Equal Median")$A_TextCredible)

print(shapiro_test_above) # p_value 0.156
print(shapiro_test_below) #p_value 0.007995

wilcox_test_result <- wilcox.test(A_TextCredible ~ as.factor(EnglishProficiencyGroup), data = data_filtered, exact = FALSE)
print(result) # p_value 0.0996





