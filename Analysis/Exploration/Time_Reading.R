library(ggpattern)
library(dplyr)
library(reshape2)
library(ggplot2)

# Get Data
time_data <- read.csv("Modified/time_data.csv")
personal_data <- read.csv("Modified/personal_data.csv")
general_questions <- read.csv("Modified/general.csv")

#######################
# === Changes during time period ===
#######################

df <- melt(time_data, id.vars = NULL, measure.vars = c("text_one", "text_two", "text_three", "text_four"))

# Create Boxplot
ggplot(df, aes(x = variable, y = value / 1000 / 60)) + 
  geom_boxplot() +
  xlab("Variable") + 
  ylab("Value (in Minute)") +
  ggtitle("Boxplots Tasks") +
  scale_y_continuous(limits = c(0, 10))  


print("First_Text")
time %>% 
  summarise(
    median_time_rounded = round(median(text_one/1000/60, na.rm = TRUE), 2),
    sd_time_rounded = round(sd(text_one/1000/60, na.rm = TRUE), 2),
    iqr_time_rounded = round(IQR(text_one/1000/60, na.rm = TRUE), 2)
  )

print("Second_Text")
time %>% 
  summarise(
    median_time_rounded = round(median(text_two/1000/60, na.rm = TRUE), 2),
    sd_time_rounded = round(sd(text_two/1000/60, na.rm = TRUE), 2),
    iqr_time_rounded = round(IQR(text_two/1000/60, na.rm = TRUE), 2)
  )

print("Third_Text")
time %>% 
  summarise(
    median_time_rounded = round(median(text_three/1000/60, na.rm = TRUE), 2),
    sd_time_rounded = round(sd(text_three/1000/60, na.rm = TRUE), 2),
    iqr_time_rounded = round(IQR(text_three/1000/60, na.rm = TRUE), 2)
  )

print("Fourth_Text")
time %>% 
  summarise(
    median_time_rounded = round(median(text_four/1000/60, na.rm = TRUE), 2),
    sd_time_rounded = round(sd(text_four/1000/60, na.rm = TRUE), 2),
    iqr_time_rounded = round(IQR(text_four/1000/60, na.rm = TRUE), 2)
  )


#######################
# Seperated after Topic
#######################
df <- melt(time_data, id.vars = NULL, measure.vars = c("A", "B", "C", "D"))

# Create Boxplot
ggplot(df, aes(x = variable, y = value / 1000 / 60)) + 
  geom_boxplot() +
  xlab("Variable") + 
  ylab("Value (in Minute)") +
  ggtitle("Boxplots Topic") +
  scale_y_continuous(limits = c(0, 10)) 


#######################
# Seperated after Condition
#######################

df <- melt(time_data, id.vars = NULL, measure.vars = c("englisch_leicht", "deutsch_leicht", "englisch_schwer", "deutsch_schwer"))

# Create Boxplot
ggplot(df, aes(x = variable, y = value / 1000 / 60)) + 
  geom_boxplot() +
  xlab("Variable") + 
  ylab("Values (in Minutes)") +
  ggtitle("Boxplots Conditions") +
  scale_y_continuous(limits = c(0, 10))  










