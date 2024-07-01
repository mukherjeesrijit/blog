t = seq(-3.2,3.2,by = 0.01)
x = cos(t) + rnorm(length(t),0,0.05)
y =  sin(t) + rnorm(length(t),0,0.05)
data = as.data.frame(cbind(x,y))

ggplot(data,aes(x,y))+ 
  geom_path()+
  geom_point(col = 2, aes = 0.6, size = 2)+
  geom_curve(curvature  = 0.3, col = "black", xend = -0.7, yend =0, linetype = "dotted")+
  geom_curve(curvature  = -0.3, col = "black", xend = -0.7, yend =0, linetype = "dotted")+
  geom_curve(curvature  = 0.3, col = "black", xend = 0.7, yend =0, linetype = "dotted")+    
  geom_curve(curvature  = -0.3, col = "black", xend = 0.7, yend =0, linetype = "dotted")+    
  scale_color_brewer()+
  ggtitle("Randomness and Biological Spindles in R. Follow Srijit Mukherjee.")+
  theme_void()+
  theme(
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5))

  
