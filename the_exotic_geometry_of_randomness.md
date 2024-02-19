# The Exotic Geometry of Randomness

**Srijit Mukherjee**  
* Pennsylvania State University (Ph.D. (Ongoing)) 
* Indian Statistical Institute (BStat (2019), M.Stat (2021))

## We love chaos. Don't we?

> "The butterfly that flutters its wings and causes a hurricane on the other side of the world." Sound familiar? Are you that butterfly, Martin?

This quote from the film [The Oxford Murders](https://www.imdb.com/title/tt0488604/) tells us how much we fathom chaos. Through the ages, human beings have tried to decipher and bring order to chaos. One such attempt was the discovery of the Lorentz Attractor, which looks like a butterfly's wings, as shown below. You can read more about it [here](https://en.wikipedia.org/wiki/Lorenz_system).

<div align="center">
    <img src="images/attractor_lorentz.png" alt="Lorentz Attractor" width="300"/>
</div>

As Henry Adams has said, "Chaos is the law of nature, and Order: the dream of human". When I was scrolling through the pages of the book *Chaos: Making a New Science*, a question popped into my mind this morning "What do random things look like?".

What can be better than rolling dice to start the journey? Take a dice in your hand. Roll it.

<div align="center">
     <img src="images/dice_roll.png" alt="Dice Roll" width="200"/>
</div>

You have six (6) possible outcomes {1, 2, 3, 4, 5, 6} from this experiment of rolling the dice. From your past experiences of 100 rolls of the dice, you got the following table of data.

<div align="center">
    
| Outcome | Times of Occurrence |
| :---:   | :---:              |
|    1    |        20           |
|    2    |        20           |
|    3    |        10           |
|    4    |        15           |
|    5    |        25           |
|    6    |        10           |

</div>

Since you don't know the outcome, you attach numbers to it, based on the data. The numbers tell you the chances of the outcomes like this.

<div align="center">
    
| Outcome | Times of Occurrence |
| :---:   | :---:              |
|    1    |        0.20           |
|    2    |        0.20           |
|    3    |        0.10           |
|    4    |        0.15           |
|    5    |        0.25           |
|    6    |        0.10           |

</div>

Now, rolling the dice once, you can gamble with your friend. The rules of the game are as follows:

* You get Rs 100 for getting prime numbers in a dice throw.
* You will be fined Rs 130 otherwise.

You can now, re-write the table differently by accommodating your gambling game persona.

<div align="center">

| Outcome | Gain | Chance / Probability |
| :---: | :---: | :---: |
| 1 | -130 | 0.2 |
| 2 | 100 | 0.2 |
| 3 | 100 | 0.1 |
| 4 | -130 | 0.15 |
| 5 | 100 | 0.25 |
| 6 | -130 | 0.1 |

</div>

Note that the Gain variable is a "Random" thing, called a "Random" variable in probabilistic language. A Random Variable is technically defined as a function that maps the elements of the Outcome Space to the Set of Real Numbers. Gain is a function from Outcome Space $\rightarrow$ Real Numbers. The Outcome Space = {1, 2, 3, 4, 5, 6}. The Gain Random Variable is defined as follows.

$$
\text{Gain}(x) = 
\begin{cases}
    100 & \text{if } x \text{ is prime} \\
    -130 & \text{if } x \text{ is not prime}
\end{cases}
$$

Next year, the gambling game rules may change, and hence the random variable too. So, you can imagine that there can be so many random variables based on the same experiment. There is a nice way of sewing all these ideas together using some artistic mathematical symbols. Let me share that with you, with the help of probability. Three dimensions make the Probability Space $(\Omega, \mathcal{F}, \mathbb{P})$:

* The Outcome Space $=\Omega$
* The Event Space $=\mathcal{F}$
* The Probability $=\mathbb{P}$

The Outcome Space is the set of all possible outcomes of the experiment. In the example above, you have {1, 2, 3, 4, 5, 6}

The Event Space is the set of possible events to which we can assign a probability. In the example above, you can post a probability to any subset of the Outcome Space {1, 2, 3, 4, 5, 6}, say you can assign a probability to the set of all prime numbers in the outcomes {2, 3, 5}.

The Probability is assigned to each event using the conservation laws of probability like the conservation laws of energy. One way is to say that probability never gets destroyed or created. Now, based on this setup, you take the set of all possible random variables you can define on this probability space. Let's give it a symbol. 

* The Random Variable Space $=\mathscr{V}$

So, we now have the four dimensions to our understanding: the Outcome Space, the Event Space, the Probability, and the Random Variable Space.

$$
(\Omega, \mathcal{F}, \mathbb{P}, \mathscr{V})
$$

I will not give a spoiler but these random variables together have an exotic geometric structure. Let's say you have two random variables $X$, and $Y$. You can gain insights from certain transformations.

* You can stretch one to get a new random variable: $c \times X$ is a random variable.
* You can add them to get another random variable: $X+Y$ is a random variable.
* You can find the dot (inner) product between two random variables by their expected product: $E(X Y)=$ Dot Product of $X$ and $Y$
* You can measure the length of the random variable by its expected square. $E(X X)=E\left(X^2\right)=\text { Length }^2 \text { of } X$ 

Yes, it's that beautiful!

In other words, a random variable is a vector. In technical terms, the space of random variables forms a vector space (more specifically inner product space). Let's see what we can discover from this exotic geometric setup of the space of random variables. However, some natural questions may arise. We will take each piece of the puzzle, and try to discover it in full depth. We will answer these questions one by one.





