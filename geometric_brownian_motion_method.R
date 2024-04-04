# Option parameters
S0 <- 100   # Underlying asset price
K <- 105    # Strike price
r <- 0.05   # Risk-free rate
sigma <- 0.2  # Volatility
T <- 1      # Time to maturity (in years)
n <- 1000   # Number of simulations
m <- 252    # Number of time steps per year

# Monte Carlo simulation
dt <- T / m
sqrt_dt <- sqrt(dt)
discount_factor <- exp(-r * T)

call_payoffs <- rep(0, n)
put_payoffs <- rep(0, n)

for (i in 1:n) {
  rand_numbers <- rnorm(m, mean = 0, sd = 1)
  S <- rep(0, m + 1)
  S[1] <- S0
  for (j in 1:(m)) {
    S[j + 1] <- S[j] * exp((r - 0.5 * sigma^2) * dt + sigma * sqrt_dt * rand_numbers[j])
  }
  
  call_payoffs[i] <- max(S[m + 1] - K, 0) * discount_factor
  put_payoffs[i] <- max(K - S[m + 1], 0) * discount_factor
}

call_price <- mean(call_payoffs)
put_price <- mean(put_payoffs)

cat("European Call Price:", call_price, "\n")
cat("European Put Price:", put_price, "\n")