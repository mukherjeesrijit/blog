# Problem 

A box contains 7 indistinguishable green balls, 5 indistinguishable white balls, and 6 indistinguishable black balls. Suppose balls are drawn using simple random sampling with replacement until balls of all colours are obtained. Let $N$ denote the minimum number of draws needed to achieve this.
* (a) For each nonnegative integer $n$, calculate $\mathbb{P}(N>n)$.
* (b) Using (a) or otherwise, compute $\mathbb{E}(N)$.

# Solution

* $N$ is the minimum number of draws needed to get at least one ball of each colour.
* You can observe that the minimum number of draws needed is 3, and the maximum number of draws needed is $7+6+1 = 14$. Therefore $3 \leq N \leq 14$. It is important to note, that whenever you want to find the distribution of a random variable, the first thing, you should note is the range of the random variable.
* The problem asks you to find the probability distribution of $N$, and therefore find $\mathbb{P}(N>n)$, and $\mathbb{E}(N)$.




# Food for Thought (without replacement)

I initially misread the problem as without replacement instead of with replacement. Yes, of course without replacement is a harder one. After I started to solve it, I realized that it was computationally expensive. Then, I discovered that it was a mistake in my reading. Haha! Btw, I have done till finding the most important expressions, and verified with python, that the expressions are correct.

$N_{X}$ = the minimum number of draws needed to achieve the required condition, in which the last draw is $X$. $X \in$ {Green(G), Black(B), White(W)}.  The expressions for the following are given below. Try to find out the reasoning from the expressions (your task!).

```math
\mathbb{P}(N_{G} = k) = 
\begin{cases} 
\frac{\binom{11}{k-1} - \binom{5}{k-1} - \binom{6}{k-1}}{\binom{18}{k-1}} \times \frac{7}{19-k} & \text{if } 3 \le k \le 6 \\ 
\frac{\binom{11}{k-1} - 1}{\binom{18}{k-1}} \times \frac{7}{19-k} & \text{if } k = 7 \\
\frac{\binom{11}{k-1}}{\binom{18}{k-1}} \times \frac{7}{19-k} & \text{if } 8 \le k \le 12 
\end{cases}
```

```math
\mathbb{P}(N_{B} = k) = 
\begin{cases} 
\frac{\binom{12}{k-1} - \binom{5}{k-1} - \binom{7}{k-1}}{\binom{18}{k-1}} \times \frac{6}{19-k} & \text{if } 3 \le k \le 6 \\ 
\frac{\binom{12}{k-1} - 1}{\binom{18}{k-1}} \times \frac{6}{19-k} & \text{if } 7 \leq k \leq 8 \\
\frac{\binom{12}{k-1}}{\binom{18}{k-1}} \times \frac{6}{19-k} & \text{if } 9 \leq k \leq 13 
\end{cases}
```

```math
\mathbb{P}(N_{W} = k) = 
\begin{cases} 
\frac{\binom{13}{k-1} - \binom{6}{k-1} - \binom{7}{k-1}}{\binom{18}{k-1}} \times \frac{5}{19-k} & \text{if } 3 \le k \le 7 \\ 
\frac{\binom{13}{k-1} - 1}{\binom{18}{k-1}} \times \frac{5}{19-k} & \text{if } k = 8 \\
\frac{\binom{13}{k-1}}{\binom{18}{k-1}} \times \frac{5}{19-k} & \text{if } 9 \leq k \leq 14
\end{cases}
```

### Verifying if the expressions are correct.

The expression will be correct if the sum of all of them over $k$ gives 1 i.e. $N$ is a discrete random variable, and we are verifying that its probability mass function over $k$ sums up to 1.

```python
from math import comb

def P_N_G(k):
    if 3 <= k <= 6:
        return (comb(11, k-1) - comb(5, k-1) - comb(6, k-1)) / comb(18, k-1) * 7 / (19-k)
    elif k == 7:
        return (comb(11, k-1) - 1) / comb(18, k-1) * 7 / (19-k)
    elif 8 <= k <= 12:
        return comb(11, k-1) / comb(18, k-1) * 7 / (19-k)
    else:
        return 0

def P_N_B(k):
    if 3 <= k <= 6:
        return (comb(12, k-1) - comb(5, k-1) - comb(7, k-1)) / comb(18, k-1) * 6 / (19-k)
    elif 7 <= k <= 8:
        return (comb(12, k-1) - 1) / comb(18, k-1) * 6 / (19-k)
    elif 9 <= k <= 13:
        return comb(12, k-1) / comb(18, k-1) * 6 / (19-k)
    else:
        return 0
        
def P_N_W(k):
    if 3 <= k <= 7:
        return (comb(13, k-1) - comb(6, k-1) - comb(7, k-1)) / comb(18, k-1) * 5 / (19-k)
    elif k == 8:
        return (comb(13, k-1) - 1) / comb(18, k-1) * 5 / (19-k)
    elif 9 <= k <= 14:
        return comb(13, k-1) / comb(18, k-1) * 5 / (19-k)
    else:
        return 0
        
sum_P_N_G = sum(P_N_G(k) for k in range(3, 13))
sum_P_N_B = sum(P_N_B(k) for k in range(3, 14))
sum_P_N_W = sum(P_N_W(k) for k in range(3, 15))
print(sum_P_N_G+sum_P_N_B+sum_P_N_W)
# 1.0001616031027796
```
It is not coming out to be exactly one because of the decimal place approximations by the computation engine of python. (remember that the probability of getting the exact value of a continuous random variable is 0).

### Finding the expected value using the expressions

I use the expressions above to find out the expectations.

```python
exp_P_N_G = sum(k*P_N_G(k) for k in range(3, 13))
exp_P_N_B = sum(k*P_N_B(k) for k in range(3, 14))
exp_P_N_W = sum(k*P_N_W(k) for k in range(3, 15))
print(exp_P_N_G+exp_P_N_B+exp_P_N_W)
# 4.855
```

### Finding the expected value using monte carlo simulation

The following using Strong Law of Large Numbers to find an approximate answer to the problem using multiple simulations, and averaging them.

```python
import numpy as np

# Define the number of simulations
num_simulations = 100000

# Define the ball colors
colors = ['G'] * 7 + ['W'] * 5 + ['B'] * 6

# Function to perform a single simulation
import numpy as np

# Define the number of simulations
num_simulations = 100000

# Define the ball colors
colors = ['G'] * 7 + ['W'] * 5 + ['B'] * 6

# Function to perform a single simulation without replacement
def simulate_draws_without_replacement():
    np.random.shuffle(colors)
    seen_colors = set()
    num_draws = 0
    
    for draw in colors:
        seen_colors.add(draw)
        num_draws += 1
        if len(seen_colors) == 3:
            break
    
    return num_draws

# Perform simulations
results = [simulate_draws_without_replacement() for _ in range(num_simulations)]

# Calculate the expected value of N
expected_value_N = np.mean(results)
print(expected_value_N)
# 4.8591
```
They are indeed coming out to be close to one another. Hence, it seems like the expressions are correct due to the double verification.
* One important thing to notice here from the perspective of data structures and algorithms that how the hashing table (set) is used to store the values of the color. This reduces the computation complexity by a manifold. 
