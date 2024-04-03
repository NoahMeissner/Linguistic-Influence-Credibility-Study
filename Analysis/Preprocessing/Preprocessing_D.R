library(tidyverse)
library(data.table)
library(dplyr)
library(stringr)
library(lubridate)
#######################
# ====  Read quantitative Data ====
#######################
#Imports
post_D <- read.csv("Data/post_D.csv")
pre_D <- read.csv("Data/pre_D.csv")

colnames(post_D)
#######################
# ====  Rename Columns ====
#######################
# Pre_D
pre_D <- pre_D %>% 
  rename(
    B_Strategic_Planing = `Can.you.explain.how.strategic.planning.can.enhance.the.travel.experience.for.a.budget.conscious.traveler..If.you.re.unsure..please.type..No....Responses.can.be.given.in.either.German.or.English..`
  )
pre_D <- pre_D %>% 
  rename(
    B_StrictBudget = `Have.you.ever.planned.a.trip.with.a.strict.budget.in.mind..focusing.on.maximizing.value.before.`
  )
pre_D <- pre_D %>% 
  rename(
    B_PriotizeSpending = `How.do.you.prioritize.your.spending.when.planning.a.trip.to.ensure.you.get.the.most.out.of.your.travel.experience.`
  )

# Post_A
post_D <- post_D %>% 
  rename(
    A_usefulText = `How.useful.did.you.find.the.text.in.providing.answers.` #
  )
post_D <- post_D %>% 
  rename(
    A_TextCredible = `Do.you.find.the.text.credible.`#
  )
post_D <- post_D %>% 
  rename(
    A_WhyCredible = `Explain.why.you.think.the.blog.article.is.credible...Responses.can.be.given.in.either.German.or.English..` #
  )
post_D <- post_D %>% 
  rename(
    A_Comprehensible = `How.comprehensible.did.you.find.the.blog.post.` #
  )
post_D <- post_D %>% 
  rename(
    A_Familar_Topic = `How.familiar.were.you.with.the.topic.before.reading.` #
  )
post_D <- post_D %>% 
  rename(
    A_HighlightMonitoring = `The.article.highlights.how.monitoring.currency.exchange.rates.can.offer.significant.savings.for.international.travel.`
  )
post_D <- post_D %>% 
  rename(
    A_ImportanceDestination = `The.text.discusses.the.importance.of.strategic.destination.selection.to.maximize.travel.value.while.staying.within.budget.`
  )
post_D <- post_D %>% 
  rename(
    A_SeasonTraveler = `Off.season.travel.is.presented.as.a.strategy.to.enjoy.reduced.costs.and.more.authentic.experiences..according.to.the.text.`
  )


merged_general <- inner_join(pre_D, post_D, by = "id")

write.csv(merged_general, "Modified/Topic_D.csv")
