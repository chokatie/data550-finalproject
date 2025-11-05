here::i_am("code/01_analysis_tbl.R")

data <- readRDS(
  file = here::here("cleandata/00_cd.rds")
)
colnames(data)

head(data)
library(gtsummary)
library(dplyr)

# Create Bivariate Analysis Table using gtsummary
tbl <- data %>%
  select(PREGNANT, NEWRACE2, PREGAGE2, MARITAL_STATUS, EDUCATION, INSURANCE, INCOME, HLTINDRG, HLTINALC, HEALTH) %>%
  tbl_summary(by = PREGNANT, missing = "no", 
              label = list(
                INCOME ~ "Family Income",
                MARITAL_STATUS ~ "Marital Status",
                HLTINALC ~ "Alcohol Abuse",
                HLTINDRG ~ "Drug Abuse",
                INSURANCE ~ "Insurance",
                PREGAGE2 ~ "Age at Pregnancy",
                NEWRACE2 ~ "Race/Ethnicity",
                EDUCATION ~ "Education Level",
                MARITAL_STATUS ~ "Marital Status",
                HEALTH ~ "Perceived Health Status")) %>%
  add_p(test = everything() ~ "fisher.test", 
        test.args = everything() ~ list(simulate.p.value = TRUE))

# Modifying the table to stay positioned in pdf
library(kableExtra)
tbl_1 <- tbl %>% 
  modify_caption("Bivariate Analysis Results by Pregnancy Status") %>%
  as_kable_extra(format = "latex", booktabs = TRUE) %>%
  kable_styling(latex_options = c("HOLD_position"))

saveRDS(
  tbl_1,
  file = here::here("output/table_one.rds")
)



