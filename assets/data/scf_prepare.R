
library(tidyverse)

# Function to estimate quantiles with sampling weights
weighted.quantile <- function(x, q = .5, w = rep(1,length(x))) {
  # Sort the weights by x
  w <- w[order(x)]
  # Sort x by x
  x <- x[order(x)]
  # Calculate the cumulative distribution function
  # at each observed data point
  cdf <- cumsum(w) / sum(w)
  # Find the first index where the CDF exceeds the quantile cutoff
  first_index <- min(which(cdf > q))
  # Return the x-value at that index
  return(x[first_index])
}

d <- read_csv("../data_raw/scf.csv") %>%
  mutate(race = case_when(RACECL4 == 1 ~ "White",
                          RACECL4 == 2 ~ "Black",
                          RACECL4 == 3 ~ "Hispanic",
                          RACECL4 == 4 ~ "Other")) %>%
  rename(wealth = NETWORTH,
         weight = WGT) %>%
  select(race, wealth, weight) %>%
  arrange(race, -wealth)

write_csv(d, file = "../data_prepared/scf.csv")

d_income <- read_csv("../data_raw/scf.csv") %>%
  mutate(race = case_when(RACECL4 == 1 ~ "White",
                          RACECL4 == 2 ~ "Black",
                          RACECL4 == 3 ~ "Hispanic",
                          RACECL4 == 4 ~ "Other")) %>%
  rename(income = INCOME,
         wealth = NETWORTH,
         weight = WGT) %>%
  select(race, income, wealth, weight)

write_csv(d_income, file = "../data_prepared/scf_income.csv")

