import numpy as np
import matplotlib.pyplot as plt

# Define the function p^5 * (1-p)^3
def binomial_curve(p):
    return p**5 * (1-p)**3

# Generate a range of p values from 0 to 1
p_values = np.linspace(0, 1, 100)

# Calculate the function values
function_values = binomial_curve(p_values)

# Plot the curve
plt.figure(figsize=(10, 6))
plt.plot(p_values, function_values, label=r'$p^5(1-p)^3$')
plt.xlabel('p')
plt.ylabel('Probability')
plt.title('Plot of the function $p^5(1-p)^3$')
plt.legend()
plt.grid(True)
plt.show()
