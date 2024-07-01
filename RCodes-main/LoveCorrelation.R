

x1 = seq(-1,1,by=0.01)
y1 = sqrt(1-x1^2)+sqrt(abs(x1)) + rnorm(x1,mean = 0,sd = 0.2) 
ggplot(as.data.frame(cbind(x1,y1)), aes(x1,y1)) + geom_point(col = "red")


x2 = seq(-1,1,by=0.01)
y2 = -sqrt(1-x2^2)+sqrt(abs(x2)) + rnorm(x2,mean = 0,sd = 0.2)
ggplot(as.data.frame(cbind(x2,y2)), aes(x2,y2)) + geom_point(col = "blue")

x = c(x1,x2)
y = c(y1,y2)
data = as.data.frame(cbind(x,y))
ggplot(data, aes(x,y)) + geom_point()



ggplot(data, aes(x,y))+
          geom_point()+
         stat_smooth(method = "lm", col = "red")+ 
labs(title = paste("Correlation = ", cor(x,y)))


