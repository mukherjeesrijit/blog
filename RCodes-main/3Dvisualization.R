library(readxl)
library(ggplot2)
library(rayshader)

covid <- read_excel("C:/Users/Admin/Downloads/covid.xlsx")
Data = data[,c(2,4,5,7,8,10)]
library(ggplot2)
ggplot(Data, aes(x = Country, fill = State)) + geom_bar(position = "stack")
ggplot(Data, aes(x = Country, fill = State)) + geom_bar(position = "dodge")
ggplot(Data, aes(x = Country, fill = State)) + geom_bar(position = position_dodge(preserve = "single"))
ggplot(Data, aes(x = Country, fill = State)) + geom_bar(position = "fill", aes(col = State)) + labs(y = "Proportion")
ggplot(Data, aes(x = State, fill = AirportName)) + geom_bar(position = "stack")

ggplot(Data, aes(x = City, y = Freq))+
  geom_bar(
    aes(fill = AirportName), stat = "identity", color = "white",
    position = position_dodge(0.9)
  )+
  facet_wrap(~Country) + 
  fill_palette("jco")

plot = ggplot(Data, aes(Country, City)) +
  geom_jitter(aes(color = PercentOfBaseline), size = 0.5) +
  theme(axis.text = element_text(size = 12),
        title = element_text(size = 12,face="bold"),
        panel.border= element_rect(size=2,color="black",fill=NA))

plot_gg(plot, multicore = TRUE, width = 8, height = 8, scale = 300, 
        zoom = 0.6, phi = 60,
        background = "#afceff",shadowcolor = "#3a4f70")

render_movie(filename = "plot", type = "orbit", phi = 45, theta = 60)
