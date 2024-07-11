# Problem 

Let $m \neq n$ and let $A=\left(\left(a_{i j}\right)\right)$ be an $m \times n$ real matrix such that $A^T A=I$. Let $b_1, \ldots, b_m \in \mathbb{R}$. Prove that the system of linear equations in the unknowns $x_1, \ldots, x_n$

$$
\begin{gathered}
a_{11} x_1+a_{12} x_2+\cdots+a_{1 n} x_n=b_1 \\
a_{21} x_1+a_{22} x_2+\cdots+a_{2 n} x_n=b_2 \\
\vdots \\
\vdots \\
a_{m 1} x_1+a_{m 2} x_2+\cdots+a_{m n} x_n=b_m
\end{gathered}
$$

has at most one solution.

# Solution

* To make it look easy, change the system of linear equations into matrix format: $Ax = b$, where you define $b$ using $b_1, \ldots, b_m$.
* The problem states now that if $A^T A = I$, then $Ax = b$ has at most one solution in $x$.
* Since the information is given on the expression $A^T A$, how can we bring $A^T A$ into $Ax = b$?
* Multiply $A^T$ to the left of $Ax = b$ to get $A^T Ax = A^T b \implies x = A^T b$. This gives you one solution of $x$. Let's call this solution $x_1$.
* Therefore, one has to show that there is no more solution of $x$.
* Now, one way is to assume that there is a solution $x_2 \neq x_1$ and reach some conclusion that contradicts the given information $A^T A = I$.
* Assuming, there are two solutions $Ax_1 = Ax_2 = b$, one can say that $A(x_1 - x_2) = 0$.
* This step is done because the properties of matrices are usually closely related to null space, column space, and row space.
* The expression $A(x_1 - x_2) = 0$ gives information about the null space of $A$, that $A$ has non-zero null space, where one of the elements is $x_1 - x_2$.
* Now, look into the given information of $A^T A = I$. Although $A$ is not a square matrix, this gives the idea that $A$ has a left inverse $A^T$.
* We know that for square matrices non-zero nullity means it is not invertible. Invertible square matrices always have zero nullity. Is this also applicable to non-square matrices?
* The answer is no. I will ask you to prove it by giving further food for thought questions. However, let's try to solve this problem.
* Since $A(x_1 - x_2) = 0$, and $A^T A = I$. What happens if we right multiply $x_1 - x_2$ to both sides?
* $A^T A (x_1 - x_2) = (x_1 - x_2) \implies A^T 0 = (x_1 - x_2) \implies x_1 - x_2 = 0 \implies x_1 = x_2$, but we have assumed that $x_2 \neq x_1$ (contradiction!). QED
* The condition on $A$: $A^T A = I$ actually implies that $A$ cannot have non-zero null space. Why?
* $A^T A = I$ means that $A$ has a left inverse. In other words, $A$ has full column rank = $n$. (Try to do the algebra by hand!)
* In fact, every full-column rank matrix has a left inverse. Check this out [here](https://math.stackexchange.com/questions/3435917/why-matrix-with-full-column-rank-has-a-left-inverse).
* The rank of $A$ is the same as the column rank of $A$. This means that by the [Rank Nullity Theorem](https://en.wikipedia.org/wiki/Rank%E2%80%93nullity_theorem), you will get that the nullity = number of columns - matrix rank = $n - n$. They are the same here since $A$ is a full-column rank matrix.
* Observe that this doesn't have any role of $A^T$. This has to do with the column rank, row rank, left inverse, right inverse, nullity, and rank of a matrix.

# Food for Thought

Try to solve the variants of the above problem.

* Let $m \neq n$, and $LA=I$. Show that $m \geq n$, and the rank of $A$ is the number of columns = $n$ (full column rank). The converse is also true given the full column rank condition. Also, show that $Ax =b$ can have at most one solution $Lb$, and nullity = 0. 
* Let $m \neq n$, and $AR=I$. Show that $n \geq m$, and the rank of $A$ is the number of rows = $m$ (full row rank). The converse is also true given the full row rank condition. Also show that nullity $\geq 0$, and $A$ have at least one solution $Rb$.
