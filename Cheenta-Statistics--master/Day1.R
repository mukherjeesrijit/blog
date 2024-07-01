#https://vincentarelbundock.github.io/Rdatasets/doc/DAAG/ais.html

data = ais

head(data, n = 3)
tail(data, n = 3)

str(data)
class(data)
dim(data)
names(data)
sapply(data, mean)
summary(data)

#Univariate Exploratory Data Analysis

#Univariate Quantitative Data Analysis

#Summary

mean(data$hg)
var(data$hg)
sd(data$hg)
min(data$hg)
max(data$hg)
median(data$hg)
quantile(data$hg)
range(data$hg)
summary(data$hg)

#Histogram

hist(data$hg, xlab = "Hemaglobin concentration", probability = TRUE, , main = "Histogram of Hemaglobin concentration")

#Kernel Density

d <- density(data$hg)
plot(d, main = "Kernel density of Hemaglobin concentration")
polygon(d, col = "red", border = "blue")


#Box Plot

boxplot(data$hg,
        main = toupper("Boxplot of Hemaglobin concentration"),
        ylab = "Hemaglobin concentration",
        col = "red")

#Univariate Qualitative Data Analysis

#Frequency Distribution Table  

table(data$sport)

# Vertical Bar Plot

barplot(table(data$sport), main="Count of participants in different sports for study", xlab="Sports",ylab="Count", border="red", col="blue", density=10)

#Horizontal Bar Plot

barplot(table(data$sport), main="Count of participants in different sports for study", xlab="Sports",ylab="Count", col = "darkred", horiz = TRUE)

#How to do a probability bar plot?

#Pie Chart

pie(table(data$sport), labels = levels(data$sport))

#Multivariate Exploratory Data Analysis

#This needs some basic understanding. This demands the exploratory data techniques to understand the relationship between two variables.

#Categorical vs Categorical

#It is useful in the case when one predictor is Qualitative and the response in Qualitative.

# Contigency Table

sex_vs_sport = data[,12:13]
table(sex_vs_sport)
xtabs(~ sex + sport, sex_vs_sport)

# Bar Plots Vertical Comparison

barplot(table(sex_vs_sport),
        main = "Sports Participation Distribution by Sex",
        xlab = "Sport",
        col = c("red","green")
        
)
legend("topleft",
       c("Female","Male"),
       fill = c("red","green")
)

# Bar Plot Beside Comparison

barplot(table(sex_vs_sport),
        main = "Sports Participation Distribution by Sex",
        xlab = "Sport",
        col = c("red","green"),
        beside =  TRUE
)
legend("topleft",
       c("Female","Male"),
       fill = c("red","green")
)

#Continuous vs Categorical

#It is useful in the case when one predictor is Qualitative and the response in Qualitative.

# Comparison of Box Plot

boxplot(hg~sport,
        data=data,
        main="Different boxplots for each sport",
        xlab="Sport",
        ylab="Hemaglobin concentration",
        col="orange",
        border="brown"
)

# Comparison of Histogram

#install.packages("ggplot2")
library(ggplot2)

hg_vs_sport = data[,c(4,13)]
ggplot(hg_vs_sport, aes(hg, fill = sport)) + geom_density(alpha = 0.2)

hg_vs_sex = data[,c(4,12)]
ggplot(hg_vs_sex, aes(hg, fill = sex)) + geom_density(alpha = 0.2)


# Comparing Summary Data

by(hg_vs_sport, hg_vs_sport$sport, summary)

by(hg_vs_sex, hg_vs_sex$sex, summary)


#Continuous vs Continuous


#Scatter Plot

plot(data$wt ~ data$ht , data,
            xlab="Weight", ylab="Height",
            main="Scatter Plot")

library(car)
scatterplot(data$wt ~ data$ht , data,
            xlab="Weight", ylab="Height",
            main="Enhanced Scatter Plot")
