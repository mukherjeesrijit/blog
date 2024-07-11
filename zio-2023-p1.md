# Problem

There is an exam with $N$ problems. For each problem, a participant can either answer the problem or skip the problem. If the participant chooses to answer the problem and gets it correct, the participant is awarded $X$ points. If the participant chooses to answer the problem but answers it incorrectly, 1 point is deducted from their score. If the participant skipped the problem, their score was not changed. For each of the following values of $N$ and $X$, compute the number of distinct scores the participant could obtain in the exam:

* (a) $N=7, X=4$
* (b) $N=15, X=18$
* (c) $N=30, X=20$

# Solution

* The first step is to write the problem mathematically. If (A, B, C) is the vector consisting of the number of (correct answers, incorrect answers, skip answers), then the equivalent problem is to find the number of elements in the set (unique because it is a set) $S =$ { $AX - B \mid A + B \leq N$ } with the condition $A+B+C = N$.
* The first step is always looking for the simplest possible case i.e. $N = 1$. Observe that for $N = 1$, there are only 3 solutions { $-1, 0, X$ }.
* Now, let's try to understand $N = 2$. Observe that in this case $A + B \leq 2$, while the expression $AX - B$ remains the same. This shows that we need to know the number of elements for $N= 1$ for $N = 2$ and the unique elements of { $AX - B \mid A + B = 2$ }.
* This can be extended to a general $N$. Let's consider the number of elements of { $AX - B \mid A + B \leq N$ } as $f(X, N)$.
* Since, { $AX - B \mid A + B \leq N$ } = { $AX - B \mid A + B \leq N-1$ } $\cup$ { $AX - B \mid A + B = N$ }, $f(X, N) = f(X, N-1)+$ the number of elements in the set { $AX - B \mid A + B = N$ }, that is not there in { $AX - B \mid A + B \leq N-1$ }.
* Therefore, the problem boils down to counting the number of elements in the set { $AX - B \mid A + B = N$ }, that are not there in { $AX - B \mid A + B \leq N-1$ }.
* This type of approach is called the recursion approach, which is the cornerstone of the Divide and Conquer algorithm to solve a problem. We reduce a problem into smaller problems to its fundamental parts.
* Let's name the two sets so that we can easily call them during the solution steps. Let's call { $AX - B \mid A + B = N$ } as $S(X,N)$ and { $AX - B \mid A + B \leq N-1$ } as $S(X,N-)$. Observe that $S(X,N)$ = { $A(X+1) - N$ } using $A+B = N$, and $S(X,N-)$ = { $A(X+1) - N + C$ } using the fact that $A+B+C = N$.
* Let's try to mathematically formulate when an element of $S(X,N)$ is same as $S(X,N-)$. Take an element  $A_1(X+1) - N$ of $S(X,N)$, and an element $A_2(X+1) - N + C_2$ of $S(X,N-)$, and equate them. We get that $A_1(X+1) - N = A_2(X+1) - N + C_2 \implies (A_1 - A_2)(X+1) = C_2$.
* This is great because this gives the information that for the equality to hold $X+1$ must divide $C_2$, and if $C_2 = (X+1)k$, then $A_1 - A_2 = k$. This implies that given the pair $(A_2, C_2$ with the condition $X+1$ divides $C_2$, there is a $A_1 = A_2 + k$ that makes the two elements of the sets $S(X,N)$ and $S(X,N-)$ same.
* Therefore, the next step is to find out for the given integers what the possibilities of such divisibilities of $C_2$ and find the simultaneous recursion relationships. Observe that $C_2 \leq N$, and if $X+1$ divides $C_2$, $X+1 \leq N$. Therefore, we should check the case for the given $X$ and $N$ values
* In cases (a) and (c) $\frac{N}{2} < X+1 < N$, and in case (b) $X+1 > N$. Hence in cases (a) and (c), we have only one case where $C_2 = X+1$, $k = 1$, and  $A_1 - A_2 = 1$. Now, we should count the number of new distinct elements and the number of intersection elements of $S(X,N-)$, and $S(X,N)$.

## Case 1 ($\frac{N}{2} < X+1 \leq N \implies C_2 = X+1$)

* Observe that since $C_2 = X+1$, and  $A_1 - A_2 = 1$, with the conditions $0 \leq A_2 \leq N -1 \implies 1 \leq A_1 \leq N$, then the number of extra elements in $S(X,N)$ that is not in $S(X,N-)$ is the number of elements in the set { $A_1(X+1) - N \mid 1 \leq A_1 \leq N$ } - the number of elements in the set { $A_2(X+1) - N + C_2 \mid C_2 = X+1, A_2\leq N-X-2$ } = { $(A_2+1)(X+1) - N \mid A_2 \leq N-X-2$ } . It turns out to be $N - (N-X-1) = X+1$.

Therefore, $$f(X, N) = f(X, N-1)+ X+1$$ for $\frac{N}{2} < X+1 \leq N$

* Applying consecutive telescopic recurrence relations, you will find out that till $X + 1 = N$, $f(X, N) = f(X, N-1)+ X+1$, and after that $f(X, N) = f(X, N-1)+ N+1$, till it becomes $F(X,1) = 3$.
* Finally, it will look like $f(X,N) = f(X,1) + \delta$. It turns out that inside $\delta$, there are additions of $N-X$ values of $X+1$, and the sum $3 + \sum \limits_{i=3}^{X+1} i = \sum \limits_{i=1} ^{X+1} i = \frac{(X+1)(X+2)}{2}$.
* Hence $f(X,N) = (N-X)(X+1) + \frac{(X+1)(X+2)}{2}$
* For case (a), it is 3x5 + 5x3 = 30
* For case (c), it is 10x21 + 21x11 = 441

## Case 2 ($X+1 > N \implies C_2 = X+1$ )

* Observe that in this case, there is no intersection, hence all the elements of $S(X,N)$ are new, therefore

Therefore, $$f(X, N) = f(X, N-1)+ N+1$$ for $X+1 > N$

* The counting is easier here because there is no discontinuity in the pattern of the recurrence relationships.
* It turns out that $f(X, N) = \sum \limits_{i=1}^{N+1} i = \frac{(N+1)(N+2)}{2}$
* For case (b), it is therefore $\frac{(N+1)(N+2)}{2} = 8 \times 17 = 136$



