dataset = read.csv("TCS.csv")
data = as.numeric(unlist(dataset))
p = 0.5

stockprobability = function(dataset,p)
  
{
  data = as.numeric(unlist(dataset))
  difference = diff(data)
  
  #relative difference
  d = 100*(difference/data[-length(data)]) 
  
  #creating the up,down,same time series
  c = NULL
  for (i in 1:length(d))
  {
    if (d[i] > p)
    {
      c[i] = 1
    }
    
    if (d[i] < -p)
    {
      c[i] = -1
    }
    
    if (d[i] < p &d[i] > -p)
    {
      c[i] = 0
    }
  }
  
  #creating the transition matrix
  
  x = 1
  y = 4
  a = c[-length(c)]*y
  b = diff(c)*x
  main = a+b
  
  UU = sum(main == 4)
  US = sum(main == 3)
  UD = sum(main == 2)
  SU = sum(main == 1)
  SS = sum(main == 0)
  SD = sum(main == -1)
  DU = sum(main == -2)
  DS = sum(main == -3)
  DD = sum(main == -4)
  
  numbers = c(UU,US,UD,SU,SS,SD,DU,DS,DD)
  transition_matrix = c(UU/sum(numbers[1:3]),US/sum(numbers[1:3]),UD/sum(numbers[1:3]),
                        SU/sum(numbers[4:6]),SS/sum(numbers[4:6]),SD/sum(numbers[4:6]),
                        DU/sum(numbers[7:9]),DS/sum(numbers[7:9]),DD/sum(numbers[7:9]))
  
  
  #state space
  State = c("Up", "Same", "Down")
  
  #transition matrix
  ZoneTransition = matrix (transition_matrix, 
                           nrow=3, byrow=T, dimnames = list(State, State))
  
  library(markovchain)
  library(diagram)
  
  
  #Diagram
  diagram = plotmat(ZoneTransition, pos =c(1,2), lwd=1, box.lwd =1, cex.txt =0.5, box.size =0.1,
          box.type = "circle", box.prop =0.5, box.col = "light yellow", arr.length =.1, arr.width =.1,
          arr.type = "curved", self.cex =.4, self.shifty =-.01, self.shiftx=.13, main = "Transition Diagram")
  
  
  #?plotmat
  
  #creating the markov chain
  
  StockMarket <- new("markovchain", states = State, byrow = T, transitionMatrix = ZoneTransition, name = "Driver Movement")
  
  steadystate = steadyStates(StockMarket)
  
  return(steadystate)
  return(diagram)
}


stockdiagram = function(dataset,p)
  
{
  data = as.numeric(unlist(dataset))
  difference = diff(data)
  
  #relative difference
  d = 100*(difference/data[-length(data)]) 
  
  #creating the up,down,same time series
  c = NULL
  for (i in 1:length(d))
  {
    if (d[i] > p)
    {
      c[i] = 1
    }
    
    if (d[i] < -p)
    {
      c[i] = -1
    }
    
    if (d[i] < p &d[i] > -p)
    {
      c[i] = 0
    }
  }
  
  #creating the transition matrix
  
  x = 1
  y = 4
  a = c[-length(c)]*y
  b = diff(c)*x
  main = a+b
  
  UU = sum(main == 4)
  US = sum(main == 3)
  UD = sum(main == 2)
  SU = sum(main == 1)
  SS = sum(main == 0)
  SD = sum(main == -1)
  DU = sum(main == -2)
  DS = sum(main == -3)
  DD = sum(main == -4)
  
  numbers = c(UU,US,UD,SU,SS,SD,DU,DS,DD)
  transition_matrix = c(UU/sum(numbers[1:3]),US/sum(numbers[1:3]),UD/sum(numbers[1:3]),
                        SU/sum(numbers[4:6]),SS/sum(numbers[4:6]),SD/sum(numbers[4:6]),
                        DU/sum(numbers[7:9]),DS/sum(numbers[7:9]),DD/sum(numbers[7:9]))
  
  
  #state space
  State = c("Up", "Same", "Down")
  
  #transition matrix
  ZoneTransition = matrix (transition_matrix, 
                           nrow=3, byrow=T, dimnames = list(State, State))
  
  library(markovchain)
  library(diagram)
  
  
  #Diagram
  plot = plotmat(ZoneTransition, pos =c(1,2), lwd=1, box.lwd =1, cex.txt =0.5, box.size =0.1,
                    box.type = "circle", box.prop =0.5, box.col = "light yellow", arr.length =.1, arr.width =.1,
                    arr.type = "curved", self.cex =.4, self.shifty =-.01, self.shiftx=.13, main = "Transition Diagram")
  
  
  #?plotmat
  
  #creating the markov chain
  
  StockMarket <- new("markovchain", states = State, byrow = T, transitionMatrix = ZoneTransition, name = "Driver Movement")
  
  steadystate = steadyStates(StockMarket)
  
 return(plot)
}


breaks = 30

probability_breaks = function(dataset,breaks)
  
{
  data = as.numeric(unlist(dataset))
  
  probability = NULL
  
  for (i in 1:(length(data)-breaks+1))
  {
    y = stockprobability(data[i:(i+breaks-1)],0.5)
    probability = rbind(probability, y)
  }
  
  return(as.data.frame(probability))
  
}

p = probability_breaks(dataset,10)
plot(p$Up/p$Down, type ="l")
