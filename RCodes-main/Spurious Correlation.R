#Simulating Male and Female Age
age_female = rnorm(50, 75, 2) 
age_male = rnorm(50, 70, 2)


#Combining Data to prepare for GGPLOT

age_at_death = c(age_female,age_male)  #combine the two age data vector
gender = c(rep("female",50), rep("male",50)) #generating the gender variable 
age = as.data.frame(cbind(age_at_death,gender)) #combine age & gender variable
age$age_at_death = as.numeric(age$age_at_death) #changing into numerical type
#GGPLOT

ggplot(data = age, aes(age_at_death, fill = gender)) 
                         + geom_density(alpha = 0.2)

#Palm Data
palm_female = rnorm(50, 0.1, 0.01 ) #palm data of female
palm_male = rnorm(50 , 0.5, 0.01)  #male has larger ratio than female
palm = c(palm_male,palm_female) #combining palm data of different gender

#Preparing Data for GGPLOT
data = as.data.frame(cbind(palm,age_at_death,gender)) #data of age, palm, sex
data[,1:2] = as.numeric(unlist(data[,1:2])) #changing into numerical type

#Scatterplot
ggplot(data, aes(x = palm,y = age_at_death)) 
             + geom_point(aes(col = gender))


#Regression 

ggplot(data, aes(x = palm, y = age_at_death)) + 
  #selection of aesthetics
  geom_point() + 
  #adding geom_point to show the points on the plot
  stat_smooth(method = "lm", col = "red") + 
  #adding the regression line
  labs(title = paste("R2 = ",cor(data[,1] , data[,2]))) 
  #adding the r^2 value

data1 = subset(data, gender == "female") #only female data for plot
p1 = ggplot(data1, aes(x = palm, y = age_at_death)) + 
  geom_point() + 
  stat_smooth(method = "lm", col = "red") + 
  labs(title = paste("Female R2 = ",cor(data1[,1] , data1[,2]))) 

data2 = subset(data, gender == "male") #only male data for plot
p2 = ggplot(subset(data2, gender == "male"), aes(x = palm, y = age_at_death)) + 
  geom_point() + 
  stat_smooth(method = "lm", col = "red") + 
  labs(title = paste("Male R2 = ",cor(data2[,1] , data2[,2]))) 

plot_grid(p1, p2, labels = "AUTO") #library(cowplot) for side by side plot

