import numpy as np
import matplotlib.pyplot as plt
from numpy.polynomial.polynomial import Polynomial

# Data (original dataset without adding a point)
x = np.array([72, 68, 69, 68, 64, 72, 72, 66, 68, 70])
y = np.array([200, 165, 160, 135, 120, 162, 190, 139, 155, 155])

# Best constant function (mean of y)
constant = np.mean(y)

# Best linear function (linear regression)
p1 = np.poly1d(np.polyfit(x, y, 1))

# Best 10 degree polynomial function (if possible, otherwise the highest degree possible which is n-1)
# Since we have 10 data points, the highest degree polynomial we can fit is 9
degree = min(len(x) - 1, 9)
p10 = np.poly1d(np.polyfit(x, y, degree))

# Generate a range of x values for plotting the functions
# Extending the x range to include 73
x_range = np.linspace(x.min(), 73, 100)

# Plot
plt.figure(figsize=(10, 6))
plt.scatter(x, y, color='blue', label='Data points')

# Plot the best constant function
plt.axhline(y=constant, color='red', linestyle='--', label=f'Best constant function (y={constant:.2f})')

# Plot the best linear function
plt.plot(x_range, p1(x_range), color='green', label=f'Best linear function')

# Plot the best 10 degree polynomial function
plt.plot(x_range, p10(x_range), color='orange', label='Best polynomial function (degree 9)')

plt.title('Scatter plot with best fitting functions extended to x=73')
plt.xlabel('Height (x)')
plt.ylabel('Weight (y)')
plt.legend()
plt.show()
