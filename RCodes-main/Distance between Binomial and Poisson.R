Find the distance between Binomial(3,1/3) and Poisson(1)

dbinom(1,3,1/3) = probability of X = 1, for binomial(3,1/3)

support = 0:100

np = 1

distance = function(n,p,lambda){
  
}


binomial = dbinom(support,99,1/99)
poisson = dpois(support,1)
distance = sum(abs(binomial-poisson))*0.5
distance

Aim: As n increases, p = 1/n decreases, np = 1, Binomial and Poisson are going close to each other.

D = NULL

for (n in 1:1000)
{
  binomial = dbinom(support,n,1/n)
  poisson = dpois(support,1)
  distance = sum(abs(binomial-poisson))*0.5
  D = c(D,distance)
}
