library(tidyverse)
library(data.table)
library(dplyr)
library(stringr)
library(lubridate)
#######################
# ====  Read quantitative Data ====
#######################
#Imports
post_B <- read.csv("Data/post_B.csv")
pre_B <- read.csv("Data/pre_B.csv")

colnames(post_B)
#######################
# ====  Rename Columns ====
#######################
# Pre_B

pre_B <- pre_B %>% 
  rename(
    B_StatisticalTerms = `Can.you.explain.the.importance.of.understanding.statistical.terms.like..mean....standard.deviation...and..correlation..in.financial.analysis..If.you.re.unsure..please.type..No....Responses.can.be.given.in.either.German.or.English..`
  )
pre_B <- pre_B %>% 
  rename(
    B_ExperienceFinance = `Do.you.have.experience.in.finance..investment..or.a.related.field..or.do.you.have.a.keen.interest.in.these.areas.`
  )
pre_B <- pre_B %>% 
  rename(
    B_FrequentAnalysis = `How.frequently.do.you.use.or.encounter.statistical.analysis.in.your.financial.decision.making.or.professional.activities.`
  )

# Post_B
post_B <- post_B %>% 
  rename(
    A_usefulText = `How.useful.did.you.find.the.text.in.providing.answers.` #
  )
post_B <- post_B %>% 
  rename(
    A_TextCredible = `Do.you.find.the.text.credible.`#
  )
post_B <- post_B %>% 
  rename(
    A_WhyCredible = `Explain.why.you.think.the.blog.article.is.credible...Responses.can.be.given.in.either.German.or.English..` #
  )
post_B <- post_B %>% 
  rename(
    A_Comprehensible = `How.comprehensible.did.you.find.the.blog.post.` #
  )
post_B <- post_B %>% 
  rename(
    A_Familar_Topic = `How.familiar.were.you.with.the.topic.before.reading.` #
  )
post_B <- post_B %>% 
  rename(
    A_EfficentMarket = `The.article.mentions.the.Efficient.Market.Hypothesis..EMH..`
  )
post_B <- post_B %>% 
  rename(
    A_CapitalAsset = `The.text.discusses.the.application.of.the.Capital.Asset.Pricing.Model..CAPM..in.investment.decisions.`
  )
post_B <- post_B %>% 
  rename(
    A_CruicalStatistic = `Statistical.techniques.like.regression.analysis.and.Monte.Carlo.simulation.are.highlighted.as.crucial.for.risk.assessment.in.the.text.`
  )


merged_general <- inner_join(pre_B, post_B, by = "id")

write.csv(merged_general, "Modified/Topic_B.csv")
