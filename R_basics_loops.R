install.packages("lobstr")

library(lobstr)

a<-c(1,2,3,4)
b<-a

obj_addr(a)
obj_addr(b)

b[2]<-9
b

obj_addr(b)

a<-c(1,2,3,4)
tracemem(a)

b<-a
b[2]<-9
untracemem(a)

l1 <- list(1,2,3,4,5)
l2 <- l1
l2
ref(l1,l2)
l2[2] <- 6
l2
ref(l1,l2)

d1 <- data.frame(x=c(1,5,6), y=c(2,4,3))
d2 <- d1
ref(d1,d2)  #column address change
d2[,2] <- d2[,2]+5
d2
ref(d1,d2)
d1
d3 <- d1        #row address change
d3[1,] <- d3[1,]-3
d3
ref(d1,d3)

x <- c("z","z","xyz","a")

ref(x)
ref(x,character = T)

obj_size('a')

obj_size(1,2,3,4,5)

x <- c(1,2,3,4,5,6,7,8,9)
obj_size(x)
obj_size(1:9)
y <- list(x,x,x)
obj_size(y)

obj_size(list(NULL,NULL,NULL))

obj_size(1:3)

obj_size(1:30000)

obj_size(1:300000000000)

v <- c(1,2,3)
ref(v)


seq(10)
seq(10,20)
seq(10,20,by=2)
?seq
seq(10,20,length.out = 20)

cat('Hello','World')
paste('Hello','World')

{
cat('Hello','World \n')
cat('How','are','you')
}

{
paste('Hello','World')
paste('How','are','you')
}

a <- cat('Hello','World')
a <- paste('Hello','World')
a

cat('Hello \n','World')
paste('Hello \n','World')

a <- c(1,2,3,4,5,6)

3 %in% a           # %in% is used to check the elements in a variable in Vectors,list,Dataframe
3.0 %in% a
'3' %in% a  
'3.0' %in% a

'3.0'=='3'
'3'=='3'

x <- 5

if(T){
  print("will execute")
}

if(x %in% a){
  print(paste(x, "is there in list"))
  print('next line')
}

if(x%%2==0){
  print('Even')
}else{
  print('Odd')  
}

x <- 4
if(x%%2==0){
  print('Even')
}else{
  print('Odd')  
}

x=6
if(x>0){
  print(paste(x,'is +ve'))
}else if(x<0){
  print(paste(x,'is -ve'))
}else{
  print(paste(x,'is zero'))  
}

x <- as.numeric(readline("Enter No.-->"))
if(x>0){
  print(paste(x,'is +ve'))
}else if(x<0){
  print(paste(x,'is -ve'))
}else{
  print(paste(x,'is neither'))  
}

#Take marks from users as input.
#Above 80=A, Above 60=B, Above 40=C, Remain=F
#1.
x <- as.numeric(readline("Enter Marks-->"))
if(x>80){
  print(paste(x,'A'))
}else if(x>60){
  print(paste(x,'B'))
}else if(x>40){
  print(paste(x,'C'))
}else{
  print(paste(x,'F'))  
}

#2.
x <- as.numeric(readline("Enter Marks-->"))
if(x>80){
  print(paste(x,'A'))
}else if(x>60 & x<80){
  print(paste(x,'B'))
}else if(x>40 & x<60){
  print(paste(x,'C'))
}else{
  print(paste(x,'F'))  
}

if(x%%2==0) 'Even' else 'odd'

x <- 5
ifelse(x%%2==0,'Even','Odd')

ifelse(x>0,'+ve',ifelse(x<0,'-ve','0'))

for(i in 1:3){
  print(i)
}

x <- c(2,5,3,9,8,11,6)
for(num in x){
  print(num)
}

#Count numbers of even numbers
count <- 0
for(val in x){
  if(val %% 2 == 0){
    count=count+1
  }
}
print(count)

while(T){
  print('Never Stops')
}

while(F){
  print('Never Prints')
}

x <- 0
while(x < 20){
  print(x)
  x = x + 1
}

x <- 0
while(T){
  print(x)
  x = x + 1
  if(x==10) break
}

x <- 12
while(x){
  x <- x-1
  if(x%%2==0)
    next
  print(x)
  print("Prints only odd")
}

x <- 10

repeat{
  print(x)
}

x <- 10
repeat{
  print(x)
  if(x==0)
    break
}

system.time(mean(1:100000000))

count <- 0

x <- c(1:100000000)

system.time(for (val in x){  if (val %% 2 == 0) count=count+1})
print(count)

x <- 1
switch(x,
  print('You select 1'),       
  print('You select 2'),
  print('You select 3'),
  print('You select 4'),
)

x <- 1
switch(x,
       'Apple',
       'Nokia',
       'Samsung',
)

x <- 'App'
switch(x,
       'App'='Apple',
       'Nok'='Nokia',
       'Sam'='Samsung',
       'Others'
)

a <- list()

process <- readline("1. Add, 2. Remove:")
 if(process==1){
  name <- readline('Enter Name-->')
  id <- as.integer(readline('Enter ID-->'))
}else{
  id <- as.integer(readline('Enter ID-->'))
}

switch (process,
  "1" = a[id] <- name,
  "2" = a[id] <- NULL
)

#Using switch create 1.Add, 2.Subtract, 3.Divide , 4.Multiply
a <- list()

n1 <- as.integer(readline('Enter Number1-->'))
n2 <- as.integer(readline('Enter Number2-->'))

process <- readline("1.Add, 2.Subtract, 3.Divide , 4.Multiply")

switch (process,
        "1" = print(n1+n2),
        "2" = print(n1-n2),
        "3" = print(n1/n2),
        "4" = print(n1*n2)
)

