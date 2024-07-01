# R code to draw samples, plot histogram, and overlay density functions

# 1. Draw 100 samples from N(2,1)
samples <- rnorm(100, mean = 2, sd = 1)

# 2. Plot the histogram of the sample
hist(samples, freq = FALSE, col = 'grey', main = 'Histogram with Overlayed Density Functions', xlab = 'Value', ylab = 'Density')

# 3. Overlay 5 different density functions from N(mu,1), where mu = 0, 1, 2, 3, 4
mus <- 0:4
colors <- c('blue', 'green', 'red', 'purple', 'orange')

# Loop through each mu to add a density function
for (i in 1:length(mus)) {
  curve(dnorm(x, mean = mus[i], sd = 1), add = TRUE, col = colors[i])
}

# Add a legend to the plot
legend('topright', legend = paste('N(', mus, ',1)', sep = ''), fill = colors)
