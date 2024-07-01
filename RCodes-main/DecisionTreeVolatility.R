#Decision Tree Instability

library("MASS")
library(parsnip)
library(titanic)
library(parttree)
library(rpart)
library(ggplot2)

#Category 0 

n0 <- 50                                       
mu0 <- c(0,0)                                  
Sigma0 <- matrix(c(1, 0.8, 0.8, 1),ncol = 2)
in_data_0 = mvrnorm(n = n0, mu = mu0, Sigma = Sigma0)
category0 = rep(0,n0)
data_0 = data.frame(in_data_0,category0)
colnames(data_0) = c("Variable_One","Variable_Two","Class_Name")

#Category 1

n1 <- 50                                    
mu1 <- c(0.5, 0.7)                                  
Sigma1 <- matrix(c(1, 0.9, 0.9, 1),ncol = 2)
in_data_1 = mvrnorm(n = n1, mu = mu1, Sigma = Sigma1)
category1 = rep(1,n1)
data_1 = data.frame(in_data_1,category1)
colnames(data_1) = c("Variable_One","Variable_Two","Class_Name")


Data = rbind(data_0,data_1)
Data$Class_Name = as.factor(Data$Class_Name)

decisiontree =
  decision_tree() %>%
  set_engine("rpart") %>%
  set_mode("classification") %>%
  fit(Class_Name ~ Variable_One + Variable_Two, data = Data)

#decisiontree = rpart(Class_Name ~ Variable_One + Variable_Two, data = Data)

Data %>%
  ggplot(aes(x=Variable_One, y=Variable_Two)) +
  geom_jitter(aes(col=Class_Name), alpha=0.7) +
  geom_parttree(data = decisiontree, aes(fill=Class_Name), alpha = 0.1) +
  theme_minimal()


#Do this twice





