
# This code file is an example submission.

# More info at: https://info3370.github.io/sp23/lessonplans/7b/

# There are four steps.
# 1. Load data: learning.csv and holdout_public.csv
# 2. Learn a prediction function in learning
# 3. Predict for new cases in holdout_public
# 4. Prepare submission

library(tidyverse)

# 1. Load data
learning <- read_csv("learning.csv")
holdout_public <- read_csv("holdout_public.csv")

# 2. Learn a prediction function in learning
# Example: OLS with past incomes as predictors
fit <- lm(g3_log_income ~ g1_log_income + g2_log_income,
          data = learning)

# 3. Predict for new cases in holdout_public
fitted <- holdout_public %>%
  # Predict using the estimated model
  mutate(g3_log_income = predict(fit, newdata = holdout_public))

# 4. Prepare submission
# Select to the identifier and predicted value columns
for_submission <- fitted %>%
  select(g3_id, g3_log_income)
# Save as a csv
write_csv(for_submission,
          file = "example.csv")
