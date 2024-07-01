# Python code to perform the tasks using numpy and matplotlib

import numpy as np
import matplotlib.pyplot as plt

# 1. Draw 100 samples from N(2,1)
samples = np.random.normal(2, 1, 100)

# 2. Plot the histogram of the sample
plt.hist(samples, bins=10, alpha=0.5, density=True, label='Sample Histogram')

# 3. Overlay 5 different density functions from N(mu,1), where mu = 0, 1, 2, 3, 4
mus = [0, 1, 2, 3, 4]
colors = ['blue', 'green', 'red', 'purple', 'orange']

for mu, color in zip(mus, colors):
    # Create a range of values from -3 to +7 (covering the significant range for all distributions)
    x = np.linspace(-3, 7, 200)
    # Calculate the normal distribution's PDF values
    y = (1 / (np.sqrt(2 * np.pi))) * np.exp(-0.5 * (x - mu)**2)
    # Plot the density function
    plt.plot(x, y, label=f'N({mu},1)', color=color)

# Show the legend
plt.legend()

# Show the plot
plt.show()
