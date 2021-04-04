number <- sample(10, 1)

for(i in c(1:3)){
  x <- as.numeric(readline("Guess the Number:"))
  if (x == number){
    print("The number you guessed was correct!")
    break
  }else{
    print("The number you guessed did not match! Try again!")
  }
}

mtcars
mtcars[mtcars$cyl %in% 4,]

mtcars[!(mtcars$cyl %in% 4),]

mtcars[,c('mpg','disp')]

mtcars[,colnames(mtcars)%in%c('mpg','disp')]

'%ni%' <- Negate('%in%')

mtcars[(mtcars$cyl %ni% 4),]

mtcars[,colnames(mtcars) %ni% c('mpg','disp')]
subset(mtcars,select = -c(mpg,disp))

sprintf("Hello %s","James")
sprintf("Hello %s today is %s","James","Monday")
name <- 'James'
sprintf("%s is %f feet tall",name,6.1)
sprintf("%s is %10.1f feet tall",name,6.1)
sprintf("%s is %.1f feet tall",name,6.1)
sprintf("%s is %.+f feet tall",name,-6.1)
sprintf("%s is %.1+f feet tall",name,6.1)
sprintf("%s is %d feet tall",name,6)
sprintf("%s is %d feet tall",name,6.1)
sprintf("%s is %e feet tall",name,6.1)

#Leap Year
x <- as.numeric(readline("Enter Year-->"))
if(x%%4 == 0 && x%%400==0 || x%%100!=0){
  sprintf("%s is Leap Year",x)
}else{
  sprintf("%s is Not Leap Year",x)
}

#Functions
fun1 <- function(){
  print("Hi you just a run function")
}

fun1()

fun1 <- function(name){
  sprintf("Hi %s you just a run function",name)
}
fun1()
fun1('John')

fun1 <- function(fname,lname){
  sprintf("Hi %s and %s you just a run function",fname,lname)
}
fun1(fname='John', lname = 'abcd')

f <- function(x) x^2
f(9)

formals(fun1)
body(fun1)
environment(fun1)

attr(f,"srcref")

sum
.Primitive("sum")(1,2,3)
formals(sum)
body(sum)
environment(sum)
attr(f,"srcref")

funs <- list(
  sqr = function(x) x^2,
  cube = function(x) x^3
)

funs$sqr(6)
funs$sqr(4)
funs$cube(4)

div <- function(x,y){
  x/y
}
div(2,4)
div(x=2,y=4)
div(y=2,x=4)

div <- function(x=4,y=1){
  x/y
}
div(4,6)
div(5)

#Default value must be pass on right side
div <- function(x=1,y){
  x/y
}
div(1,6)
div(4)

mul <- function(x,y=x+1){
  x*y
}
mul(2,4)
mul(2)
i <- mul(6)

do.call(mul,args=list(x=2,y=4))

rnorm(10,5,1)

d <- data.frame(a = rnorm(10,5,1), b = rnorm(10,5,1))
d
mean(d[[1]])

apply(d, 1, function(x) if (x[1] < x[2])  x[1] else x[2])
pmin(d[[1]], d[[2]])
do.call(pmin,d)

install.packages("microbenchmark")
library(microbenchmark)

microbenchmark(apply(d, 1, function(x) if (x[1] < x[2])  x[1] else x[2]))
microbenchmark(pmin(d[[1]], d[[2]]))
microbenchmark(do.call(pmin,d))

f1 <- function(...){
  ..3
}

f1(1,2,3)

f1 <- function(...){
  for(i in list(...)){
    print(i)
  }
}
f1(9,12,23)

fsum <- function(...){
  a=0
  for(i in list(...)){
    a=a+i
  }
  a
}
fsum(1,2,3,64)

fope <- function(o,...){
  if(o=="+"){
    a=0
    for(i in list(...)){
      a=a+i
    }
  }
  else if(o=="-"){
    a=0
    for(i in list(...)){
      a=a-i
    }
  }
  else if(o=="*"){
    a=1
    for(i in list(...)){
      a=a*i
    }
  }
  else if(o=="/"){
    a=1
    for(i in list(...)){
      a=a/i
    }
  }
  else{
    print("Please Try Again")
  }
  a
}

fope("+",2,4)

x <- 10
g01 <- function(){
  x <- 20
  x
}

g01()

x <- 2 #If the value is not in function then it will take global value.
g03 <- function(){
  y <- 1
  c(x,y)
}
g03()

exists("x")

ab <- 4
g11 <- function(){
  if(!exists("ab")){
    stop("Value  not there")
  }else{
    ab <- ab + 1
  }
  ab
}

g11()

#Factorial numbers(10!)
'%+%' <- function(a,b){
  k=1
  for(i in seq(1:b)){
    k <- k*a
    a <- a-1
  }
  k
}

10%+%10

factorial <- function(x){
  if(x == 0) return(1)
  else return(x * factorial(x-1))
}

factorial(5)

#Fibonacci Series
n = as.integer(readline("Enter Numbers-->"))
rf <- function(n){
  if(n <= 1){
    return(n)
  }else{
    return(rf(n-1) + rf(n-2))
  }
}
for(i in 0:(n-1)){
  var = rf(i)
  print (var)
}

m1 <- matrix(c(1:10, 11:20, 21:30), nrow=10, ncol=3)
m1
apply(m1,1,sum) #Rowwise Sum
apply(m1,2,sum) #Columnwise Sum

apply(m1, 1, function(x) sum(x) - mean(x))

fun1 <- function(x) sum(x) - mean(x)
apply(m1,1,fun1)
apply(m1,1:2,fun1)
apply(m1,1:2,function(x) x^2)

a <- 1:10

apply(a,1,sum)

lapply(a,sum)
lapply(list(a),sum)

lapply(a,function(x) x^2)

b <- 11:20
c <- 21:30

lapply(list(a,b,c),sum)

sapply(a,sum)
sapply(list(a),sum)
sapply(a,function(x) x^2)
sapply(list(a,b,c),sum)

vapply(a, sum, numeric(1))
vapply(a, function(x) x%%2==0, logical(1))

iris
tapply(iris$Sepal.Length, iris$Species, mean)
tapply(iris$Sepal.Length, iris$Species, function(x) c(mean(x),sum(x)))

mapply(function(x) x*x, iris$Sepal.Length)
mapply(function(x,y) x+y, iris$Sepal.Length, iris$Sepal.Width)
