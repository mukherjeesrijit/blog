# Problem 

Use the identity $n^2+(2 n+1)=(n+1)^2$ to prove that the set  $S=$ { $(x, y) \in \mathbb{Q} \times \mathbb{Q}: x^2+y^2=1$ } has infinitely many elements.

# Solution

* We are given the identity $n^2+(2 n+1)=(n+1)^2$. The first question is how is this connected to the set $S$?
* Is there a way we can express $n^2+(2n+1)=(n+1)^2$ as $x^2 + y^2 = 1$ for some rational numbers $x,y$?
* Let's try to divide $(n+1)^2$ in both the sides to get two rational squares.
* We get $(\frac{n}{n+1})^2 + (\frac{\sqrt{2n+1}}{n+1})^2 = 1$, but remember that $\sqrt{2n+1}$ is not an integer.
* The next natural question is can $\sqrt{2n+1}$ be an integer?
* Yes, of course. It will be an odd integer $a$, if $n = \frac{a^2 - 1}{2}$.
* This leads to the following identity for every odd integer $a$:

```math
\left( \underbrace{\frac{a^2 - 1}{a^2 + 1}}_{x} \right)^2 + 
\left( \underbrace{\frac{2a}{a^2 + 1}}_{y} \right)^2 = 1
```
