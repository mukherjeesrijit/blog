# Introduction to Probability

Probability originates from counting. You will learn how probability is a natural extension of combinatorics. Combinatorics is the mathematics behind counting the number of elements of a set. We will start with counting colourful balls, and DNA sequences.

## Picking up orange balls, blindfolded.

There is a box with identical balls, except for the color with at least one orange ball. If I blindfold you, and ask you to pick a ball, then what is the chance that the ball is orange? I will present different cases to start with.

### Case 1: Orange = 1, Total = 1
**Thoughts:** This is easy. You know that you will always pick up the orange ball. The chance is 100% = 1.

### Case 2: Orange = 1, Green = 1, Total = 2
**Thoughts:** This looks interesting. You know that you will either pick up 1 orange or 1 green. So the chance is 50% = $\frac{1}{2}$. You ask what do these 1 and 2 represent? Aah! 1 represents the number of orange balls available, and 2 represents the total number of balls available. Similarly, you count that the chance of picking up a green ball is  50% = $\frac{1}{2}$. 

### Case 3: Orange = 2, Green = 4, Total = 6
**Thoughts:** You use the same idea before to see that the total number of balls = 6, and the total number of orange balls = 2, then the chance of picking up an orange ball is  33.33% = $\frac{2}{6}$. Can you write it mathematically using symbols? This celebrification of the problem is the key to generalizing and applying one idea to multiple areas where you never thought it could be applied. The easiest way to write it is:

$$
\text{Probability of picking up an orange ball} = \frac{\text{total number of orange balls in the bag}}{\text{total number of balls in the bag}}
$$

The way to test this is to see if this can be applied to more complex problems. Let's try one more.

### Case 4: Orange = 5, Blue = 6, Green = 4, Total = 15
**Thoughts:** Okay, you apply the above formula to get 

$$
\text{Probability of picking up an orange ball} = \frac{\text{total number of orange balls in the bag}}{\text{total number of balls in the bag}} = \frac{5}{15} = \frac{1}{3}
$$

This is great. Let's try some other types of problems to test our understanding.

## Making DNA sequences, blindfolded.
You have a box of unlimited nucleotides {A, C, G, T}. You pick up 4 nucleotides, blindfolded to make a DNA sequence. What is the chance that there are the same number of A and T and the same number of G and C in the DNA sequence? Assume that each position in the DNA sequence can be occupied by one of four nucleotides: A, C, G, or T.

**Thoughts:** This looks complex, right? You know only the following: 

$$
\text{Probability of picking up the required condition} = \frac{\text{total number of elements of some set X}}{\text{total number of elements of some set Y}} = \frac{\mid X \mid}{\mid Y \mid}
$$

Note: $\mid A \mid$ is the number of elements of the set A.

The issue is we have to define set $X$ and set $Y$ properly. What is there in those sets? This demands that we write the problem of finding probability more fundamentally, which is more than just a ratio of two numbers. This is where the algebraic extension of arithmetic ideas will help you represent the problem algebraically. We will first solve an easier problem with 2 nucleotides instead of 4 nucleotides.

### Easier Case: 2 nucleotides

**Thoughts:**  Defining the sets $X$ and $Y$:
* Set $Y$: The set of all possible DNA sequences of length 4.
* Set $X$: The set of DNA sequences of length 4 that have the same number of A and T and the same number of G and C.</li>

Let's calculate the number of elements in Set **$Y$**: 

Set $Y$ can be thought of as $(N_1, N_2)$, where $N_1$ is the first nucleotide, and $N_2$ is the second.
* $N_1$ has 4 possibilities: A, C, G, or T.
* Similarly, $N_2$ has 4 possibilities: A, C, G, or T.
* Thus, the total number of possibilities for $(N_1, N_2)$ is $4 \times 4 = 16$. Why?
* Because for every possibility of $N_1$, there are 4 possibilities of $N_2$. Therefore, the multiplication.

The following are the total number of 16 possibilities in the Set $Y$ 

```math
  \{(A, A), (A, C), (A, G), (A, T), \\
  (C, A), (C, C), (C, G), (C, T), \\
  (G, A), (G, C), (G, G), (G, T), \\
  (T, A), (T, C), (T, G), (T, T)\}
```
Similarly, for set $X$, you have the following 4 possibilities:

```math
\{
  (A, T), (T, A),\\
  (C, G), (G, C)
  \}
```
You can observe that set $X$ is a subset of set $Y$. Therefore, for 2 nucleotides, you have 

```math
\text{Probability of picking up the required condition} = \frac{\mid X \mid}{\mid Y \mid} = \frac{4}{16} = \frac{1}{4} = 25 \%
```


