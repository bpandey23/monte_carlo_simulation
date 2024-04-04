Following steps were followed:

Define the option parameters
Set the underlying asset price (S0), strike price (K), risk-free rate (r), volatility (sigma), and time to maturity (T).
Generate random paths for the underlying asset
Use the geometric Brownian motion process to simulate the stock price paths.
For each path, generate a sequence of random numbers from a normal distribution with mean 0 and standard deviation sqrt(T/n), where n is the number of time steps.
Compute the stock prices at each time step using the formula: S(t+1) = S(t) * exp((r - 0.5 * sigma^2) * dt + sigma * sqrt(dt) * Z), where Z is the random number and dt is the time step (T/n).
Calculate the option payoff
For each simulated path, compute the payoff of the option at maturity.
For a European call option, the payoff is max(S(T) - K, 0).
For a European put option, the payoff is max(K - S(T), 0).
Discount and average the payoffs
Discount each payoff to the present value using the risk-free rate: payoff * exp(-r * T).
Calculate the average of the discounted payoffs across all simulated paths.
This average is an estimate of the option's present value.