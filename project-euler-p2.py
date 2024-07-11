sequence = []

def fib(n):
    if n == 1:
        return 1
    elif n == 2:
        return 2 
    else:
        x = fib(n-1) + fib(n-2)
        return(x)

number = 0
n = 1 
sum = 0

while number < 4000000:
    number = fib(n)
    if number % 2 == 0:
        sum = sum + number
    n = n+1
    
print(sum)
