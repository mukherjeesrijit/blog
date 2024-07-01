library(ggfortify)

ui <- shinyUI(fluidPage(
  titlePanel(title = h2("Exploring Probability Distributions", align = "center")),
 
  sidebarLayout(
    sidebarPanel( 
      selectInput("distribution", "Choose your Distribution", c("Binomial","Poisson","Geometric","Discrete Uniform","Hypergeometric","Negative Binomial","Normal","Exponential", "Gamma", "Uniform", "Beta")),
      numericInput("parameter_one", "Choose your valid  Parameter One", value = 0, min = -50, max = 50), 
      numericInput("parameter_two", "Choose your valid Parameter Two", value = 0, min = -50, max = 50), 
      numericInput("parameter_three", "Choose your valid Parameter Three", value = 0, min = -50, max = 50) 
      ),
    mainPanel(
      h6("with Srijit Mukherjee", align = "center"),
      h5("Play around with the valid parameters to understand how the pmf or pdf changes with change in the parameters.",align = "center"),
      br(),
      verbatimTextOutput("text"),
      plotOutput("histogram")
    ) 
  )
)
)

server = function(input, output) {
  
  output$text = renderText({
    
    if(input$distribution == c("Binomial"))
    {
      return("Parameter One = Number of Trials, and Parameter Two = Probability of Success")
    
    }
    
    if(input$distribution == c("Poisson"))
    {
      return("Parameter One = Lambda(mean)")
      
    }
    
    if(input$distribution == c("Geometric"))
    {
      return("Parameter One = Probability of Success")
    }
    
    if(input$distribution == c("Discrete Uniform"))
    {
      return("Parameter One = Minimum Value, and Parameter Two = Maximum Value")
      
    }
    
    if(input$distribution == c("Negative Binomial"))
    {
      return("Parameter One = Number of Failures to stop, and Parameter Two = Probability of Success")
    }
    
    if(input$distribution == c("Hypergeometric"))
    {
      return("Parameter One = Number of Success States, Parameter Two = Number of Failure States, and Parameter Three = Number of Trials ")
      
    }
    
    if(input$distribution == c("Normal"))
    {
      return("Parameter One = Mean, and Parameter Two = Standard Deviation")
      
    }
    
    if(input$distribution == c("Exponential"))
    {
      return("Parameter One = Rate")
      
    }
    
    if(input$distribution == c("Gamma"))
    {
      return("Parameter One = Shape, and Parameter Two = Scale")
      
    }
    
    if(input$distribution == c("Uniform"))
    {
      return("Parameter One = Minimum Value, and Parameter Two = Maximum Value")
      
    }
    if(input$distribution == c("Beta"))
    {
      return("Parameter One = Shape 1, and Parameter Two = Shape 2")
      
    }
    
  })
  
  output$histogram = renderPlot({
    
    if(input$distribution == c("Binomial"))
      {
       x = 0:input$parameter_one
       y = dbinom(x,input$parameter_one,input$parameter_two)
       plot(x,y,type = "o", col = "red")
    }
    
    
    if(input$distribution == c("Poisson"))
    {
      x = 0:50
      y = dpois(x,input$parameter_one)
      #ggdistribution(dpois, x, lambda = input$parameter_one , fill = 'blue')
      plot(x,y, type = "o", col = "red")
    }
    
    if(input$distribution == c("Geometric"))
    {
      x = 0:50
      y = dgeom(x,input$parameter_one)
      plot(x,y, type = "o", col = "red")
    }
    
    if(input$distribution == c("Discrete Uniform"))
    {
      if (floor(input$parameter_one) == input$parameter_one && floor(input$parameter_two) == input$parameter_two && input$parameter_one < input$parameter_two)
      x = input$parameter_one:input$parameter_two
      y = rep(1/(length(x)),length(x))
      plot(x,y, type = "o", col = "red")
    }
    
    if(input$distribution == c("Negative Binomial"))
    {
      x = 0:50
      y = dnbinom(x,input$parameter_one,input$parameter_two)
      plot(x,y, type = "o", col = "red")
    }
    
    if(input$distribution == c("Hypergeometric"))
    {
      x <- seq(0,input$parameter_one+input$parameter_two,by = 1)
      y = dhyper(x,input$parameter_one,input$parameter_two,input$parameter_three)
      plot(x,y, type = "o", col = "red")
    }
    
    if(input$distribution == c("Normal"))
    {
      x <- seq(-100,100,length=10000)
      y <- dnorm(x,input$parameter_one,input$parameter_two)
      plot(x, y, col ="blue")
    }
    
    if(input$distribution == c("Exponential"))
    {
      x <- seq(0,20,length=10000)
      y <- dexp(x,input$parameter_one)
      plot(x, y, col ="blue")
    }
    if(input$distribution == c("Gamma"))
    {
      x <- seq(0,100,length=10000)
      y <- dgamma(x, input$parameter_one, scale = input$parameter_two)
      plot(x, y, col ="blue")
      
      
    }
    if(input$distribution == c("Uniform"))
    {
      x <- seq(input$parameter_one,input$parameter_two,length=10000)
      y <- dunif(x, input$parameter_one, input$parameter_two)
      plot(x, y, col ="blue")
      
    }
    if(input$distribution == c("Beta"))
    {
      x <- seq(0,1,length=10000)
      y <- dbeta(x, input$parameter_one, input$parameter_two)
      plot(x, y, col ="blue")
    }
  })
}

shinyApp(ui = ui, server = server)
