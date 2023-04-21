sim_forest_data <- function() {
  sim_data <- data.frame(X = rep(1:10, 100)) %>%
    mutate(W = rep(0:1, each = n() / 2),
           Y = rnorm(n(), sd = 10))
  return(sim_data)
}
