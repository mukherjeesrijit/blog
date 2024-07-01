install.packages("ggplot2","gganimate","babynames","hrbrthemes","gifski","png","gam","mgcv")
library("ggplot2")
library("gganimate")
library("babynames")
library("hrbrthemes")
library("gifski")
library("png")
library("gam")
library("mgcv")

#Reading Data
data = read.table("data.txt", header = FALSE, sep = ",")

handwriting = function(data) {
colnames(data) = c("x","y")
data$y = -data$y #why?
seq = 1:length(data$x) 
data = data.frame(seq,data$x,data$y)

#Plot
plot(data[,2],data[,3])

#General Additive Model Regression using Cubic Splines for X coordinates
x = data[,c(1,2)]
xfit <- gam(data.x ~ s(seq, k = 150) , data=x) 
t = seq(1,length(x[,1]), length.out = 1000)
xpred = predict(xfit, data.frame(seq = t))

#check the fit
plot(x)
lines(t,xpred)

#General Additive Model Regression using Cubic Splines for Y coordinates
y = data[,c(1,3)]
yfit <- gam(data.y ~ s(seq, k =150) , data=y) #what is k?
t = seq(1,length(y[,1]), length.out = 1000)
ypred = predict(yfit, data.frame(seq = t))

#check the fit
plot(y)
lines(t,ypred)

# polished data for animation
newdata = data.frame(t,xpred,ypred)

#animation
anim <- 
  ggplot(newdata, aes(xpred, ypred)) + 
  geom_path(size = 1, colour = "red")+
  geom_point(colour = "blue", size = 2) +
  theme_minimal() + 
  labs(title = 'Drawing my Signature ~ Srijit Mukherjee')+
  transition_reveal(t)
animate(anim, nframes = 50, type="cairo")
anim_save("project.gif")
}

handwriting(data)
