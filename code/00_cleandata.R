here::i_am("code/00_cleandata.R")

load("rawdata/NSDUH_2022.Rdata")
data <- puf2022_110424


library(labelled)
library(gtsummary)
library(dplyr)
var_label(data) <- list(
  QUESTID2 = "ID",
  INCOME = "Family Income",
  POVERTY3 = "Poverty Level",
  PREGNANT = "Currently Pregnant",
  IRMARIT = "Marital Status",
  NRCH17_2 = "# Kids Aged <18",
  PMNICDEP = "Nicotine in Last Month",
  HLTINALC = "Alcohol Abuse",
  HLTINDRG = "Drug Abuse",
  IRMEDICR = "Medicare",
  IRMCDCHP = "Medicaid/CHIP",
  IRCHMPUS = "Champus",
  IRPRVHLT = "Private Insurance",
  IROTHHLT = "Other",
  PREGAGE2 = "Age at Pregnancy",
  NEWRACE2 = "Race/Ethnicity",
  EDUHIGHCAT = "Education Level",
  HEALTH2 = "Perceived Health"
)

# Vector for just the variables I want to include
myvars <- c("QUESTID2", "INCOME", "POVERTY3", "PREGNANT", "IRMARIT", "NRCH17_2", "PMNICDEP", "HLTINALC", "HLTINDRG", 
                            "IRMEDICR", "IRMCDCHP", "IRCHMPUS", "IRPRVHLT", "IROTHHLT", "PREGAGE2", "NEWRACE2", "EDUHIGHCAT", "HEALTH2")
# New dataset with the 18 variables
mydata <- data[myvars]

# Filter mydata so it excludes observations excluding missing for my main vars for analysis
filter_data <- mydata %>%
  filter(!PREGNANT %in% c("85", "94", "97", "98", "99"),
         !HLTINDRG %in% c("85", "94", "97", "98", "99"),
         !HLTINALC %in% c("85", "94", "97", "98", "99"),
         !IRMARIT %in% c("99"))

# Recoding variables
lbl_data <- filter_data %>%
  mutate(
    PREGNANT = factor(PREGNANT, levels = c("1", "2"),
                        labels = c("Pregnant", "Not Pregnant")),
    NEWRACE2 = factor(NEWRACE2, levels = c("1", "2", "3", "4", "5", "7", "6"),
                        labels = c("White", "Black", "Native Amer./AK Native", "Native HI/PI", "Asian", "Hispanic", ">1 Race")),
    PREGAGE2 = factor(PREGAGE2, levels = c("1", "2", "3", "4"),
                      labels = c("15-17", "18-25", "26-44", "12-14 or 45+")),
    HLTINDRG = factor(HLTINDRG, levels = c("2", "1"),
                       labels = c("No Drug Abuse", "Drug Abuse")),
    HLTINALC = factor(HLTINALC, levels = c("2", "1"),
                       labels = c("No Alcohol Abuse", "Alcohol Abuse")),
    INCOME = factor(INCOME, levels = c("1", "2", "3", "4"),
                      labels = c("<$20k", "$20-49k", "$50-74k", "75k+")),
    MARITAL_STATUS = case_when(IRMARIT == 1 ~ 1, IRMARIT == 2 ~ 2, IRMARIT == 3 ~ 2, IRMARIT == 4 ~ 2),
    MARITAL_STATUS = factor(MARITAL_STATUS, levels = c("1", "2"),
                            labels = c("Married", "Not Married")),
    EDUCATION = case_when(EDUHIGHCAT == 1 ~ 1, EDUHIGHCAT == 2 ~ 2, EDUHIGHCAT == 3 ~ 3, EDUHIGHCAT == 4 ~ 4, EDUHIGHCAT == 5 ~ 1),
    EDUCATION = factor(EDUCATION, levels = c("1", "2", "3", "4"),
                            labels = c("<HS", "HS Grad", "Some College/Assoc. Dg", "College Grad")),
    INSURANCE = case_when(
      IRMEDICR == 1 ~ 1, IRMCDCHP == 1 ~ 2, IRPRVHLT == 1 ~ 3, IRCHMPUS == 1 ~ 4, IROTHHLT == 1 ~ 4, TRUE ~ NA_real_),
    INSURANCE = factor(INSURANCE, levels = c("1", "2", "3", "4"),
                       labels = c("Medicare", "Medicaid/CHIP", "Private", "Champus/Other")),
    HEALTH = case_when(
      HEALTH2 == 4 ~ 1, HEALTH2 == 3 ~ 2, HEALTH2 == 2 ~ 2, HEALTH2 == 1 ~ 3, TRUE ~ NA_real_),
    HEALTH = factor(HEALTH, levels = c("1", "2", "3"),
                    labels = c("Poor/Fair", "Good", "Excellent"))
    )


saveRDS(
  lbl_data, 
  file = here::here("cleandata/00_cd.rds")
)

