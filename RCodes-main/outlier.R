library(tidyverse)

data = read.csv("data.csv")
data[rowSums(is.na(data))==0,]
Data = data[,c(2,3,5,6,8,9,10,11)]
D = cbind(Data[,-6],Data$cpi*Data$installs)
D[is.na(D)] <- 0
colnames(D)[8] = c("tic")

df = D

Data_video = (df %>% filter(Click_Type == "video"))[,-2]
Data_instl = (df %>% filter(Click_Type == "instl"))[,-2]


library(performance)

 outliers_list = check_outliers(df[,-c(1,2)], method = "mahalanobis", threshold = NULL)
 outliers_info <- as.data.frame(outliers_list)
 outliers_info$Outlier 

 
 
outlier_data <- df[outliers_list, ] 
