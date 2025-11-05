here::i_am("code/02_analysis_fig.R")

data <- readRDS(
  file = here::here("cleandata/00_cd.rds")
)
colnames(data)

# Bar graph of household income and the proportion of individuals who reported drug abuse
library(ggplot2)
fig_1 <- ggplot(data, aes(x = INCOME, fill = HLTINDRG)) +
  geom_bar(position = "fill") +
  facet_wrap(~PREGNANT) +
  labs(x = "Income by Group", y = "Proportion", fill = "Drug Status", title = "Figure 1. Drug Abuse by Income and Pregnancy Status") + 
  theme(text = element_text(family = "serif"))

saveRDS(
  fig_1,
  file = here::here("output/figure_one.rds")
)

