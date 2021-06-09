data <- read.csv("D:/M.Tech Data Science/Semester 1/PS/iris.csv")
data

d1 <- data[data$variety == 'Versicolor',]
d1

iris$calculated <- d1$sepal.length - d1$sepal.width
iris$calculated

colMeans(Filter(is.numeric, data), na.rm = TRUE)

#New Dataset ChickWeight

data("ChickWeight")

ChickWeight

head(ChickWeight)

unique(ChickWeight$Diet) #Unique values for particular column

apply(ChickWeight,2,sum)
str(ChickWeight)

class(ChickWeight$Diet)

sapply(ChickWeight, class) #Checking column wise data types

ChickWeight$Diet <- as.numeric(ChickWeight$Diet)

ChickWeight <- sapply(ChickWeight, as.numeric) #Whole dataset will convert into numeric

typeof(ChickWeight)

apply(ChickWeight,2,sum)

lapply(ChickWeight[,1], mean)
lapply(list(ChickWeight[,1]), mean)

ChickWeight <- lapply(ChickWeight, as.numeric)
typeof(ChickWeight)

a <- lapply(ChickWeight$weight, FUN = function(x) x^2)
b <- lapply(list(ChickWeight$weight), FUN = function(x) x^2)

a <- sapply(ChickWeight$weight, FUN = function(x) x^2) #Output is in Vector format
b <- sapply(list(ChickWeight$weight), FUN = function(x) x^2)

with(ChickWeight,sapply(weight, function(x) x^2))

a <- vapply(ChickWeight$weight, function(x) x^2, numeric(1))
a <- mapply(function(x,y) x/y, ChickWeight$weight, ChickWeight$Chick) #Multiple variables we can apply

with(ChickWeight,mapply(function(x,y) x/y,weight, Chick))
a <- tapply(ChickWeight$weight, ChickWeight$Diet, mean)
tapply(ChickWeight$weight, ChickWeight$Diet, max)

aggregate(ChickWeight$weight, list(diet = ChickWeight$Diet), mean) #Give mean of according diet and weight
typeof(aggregate(ChickWeight$weight, list(diet = ChickWeight$Diet), mean))
aggregate(weight ~ Diet, ChickWeight, mean)

aggregate(ChickWeight$weight, list(time = ChickWeight$Time), mean)

a <- by(ChickWeight$weight, ChickWeight$Diet, mean)
a

a <- by(ChickWeight, ChickWeight$Diet, colMeans)
a

l1 <- list(a = 1:10, b = 11:20, c=c('d','a','t','a'))
l1

rapply(l1, mean, how = "unlist", classes = "integer") #Like sapply

rapply(l1, mean, how = "list", classes = "integer") #Like lapply (List)

rapply(l1, mean, how = "replace", classes = "integer")

rapply(ChickWeight, mean)

Map(sum, 1:5, 1:5, 1:5) #It maps the value of sum like (1,1,1) (2,2,2)

?new.env()
e <- new.env()
e$num <- 100
e$other_num <- 144

eapply(e, sqrt)

library(tidyverse)
dplyr::

install.packages("hflights")
library(hflights)  
data("hflights")

str(hflights)
hflights <- as_tibble(hflights) #Convert data into table
print(hflights, n=10)

temp <- hflights[hflights$Month == 1 & hflights$DayofMonth == 1, ]

filter(hflights, Month==1, DayofMonth==1) #By dplyr function filter
?filter

filter(hflights, UniqueCarrier=="AA" | UniqueCarrier=="UA")
filter(hflights, UniqueCarrier %in% c("AA","UA"))

filter(hflights, Month == max(Month))

hflights[, c("DepTime","ArrTime","FlightNum")]

select(hflights, DepTime, ArrTime, FlightNum) #By dplyr function select

select(hflights, Year:DayofMonth, contains("Taxi"), contains("Delay"))
?select
select(hflights, !(Year:DayofMonth))
select(hflights, -(Year:DayofMonth))
select(hflights, ends_with('Delay'))

filter(select(hflights, UniqueCarrier, DepDelay), DepDelay > 60)

hflights %>% select(UniqueCarrier, DepDelay) %>% filter(DepDelay > 60)  # Above things by Pipeline which will useful in more readability

hflights %>% select(UniqueCarrier, DepDelay) %>% filter(between(DepDelay,40,80))

hflights %>% filter(!is.na(DepDelay))

sqrt(2)^2 == 2 #Due to answer might be in some points(.)

(1/49)*49 == 1

near(sqrt(2)^2, 2) #By dplyr near function it's true
?near

x1 <- 1:5
x2 <- 2:6
sqrt(sum((x1-x2)^2))
(x1-x2)^2 %>% sum() %>% sqrt()

hflights <- hflights %>% rename(Cancellation = CancellationCode)

hflights[order(hflights$DepDelay), c("UniqueCarrier","DepDelay")]

hflights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay)

hflights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(desc(DepDelay))

hflights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(desc(DepDelay)) %>% slice(5:10) #From row no. 5 to 10 by slice function

hflights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(desc(DepDelay)) %>% slice_head(n=5)

hflights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(desc(DepDelay)) %>% slice_tail(n=5)

hflights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(desc(DepDelay)) %>% slice_sample(n=5)

?arrange

hflights %>%
  select(UniqueCarrier, DepDelay) %>%
  slice_max(DepDelay, n=5)

hflights %>%
  select(UniqueCarrier, DepDelay) %>%
  slice_min(DepDelay, n=5)

hflights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(UniqueCarrier, desc(DepDelay))

hflights$speed <- hflights$Distance / hflights$AirTime*60

hflights[, c("Distance","AirTime","speed")]

hflights %>%
  select(Distance, AirTime) %>%
  mutate(speed = Distance/AirTime*60) #By dplyr mutate function

hflights <- hflights %>% mutate(speed = Distance/AirTime*60)

a <- hflights %>% transmute(Speed = Distance/AirTime*60) #For extract particular column
a

with(hflights, tapply(ArrDelay, Dest, mean, na.rm = TRUE))

aggregate(ArrDelay ~ Dest, hflights, mean)

typeof(with(hflights, tapply(ArrDelay, Dest, mean, na.rm = TRUE)))
typeof(aggregate(ArrDelay ~ Dest, hflights, mean))

hflights %>%
  group_by(Dest) %>%
  summarise(avg_delay = mean(ArrDelay, na.rm = TRUE))

str(hflights)

temp <- hflights %>%
  group_by(Dest) %>%
  summarise(across(where(is.numeric), mean, na.rm = TRUE))

hflights %>%
  group_by(Dest) %>%
  summarise(across(starts_with("Taxi"), sum, na.rm = TRUE))

hflights %>%
  group_by(Dest) %>%
  summarise(across(starts_with("Taxi"), list(sum=sum,mean=mean), na.rm = TRUE))

hflights %>%
  group_by(Dest) %>%
  summarise(across(starts_with("Taxi"), list(sum=sum,mean=mean), na.rm = TRUE, .names = "{.fn} of {.col}"))

temp <- hflights %>% mutate(across(where(is.numeric), ~ . / 100))

hflights %>%
  group_by(Month, DayofMonth) %>%
  summarise(flight_count = n()) %>%
  arrange(desc(flight_count))

hflights %>%
  group_by(Month, DayofMonth) %>%
  tally(sort = TRUE)

hflights %>%
  group_by(Dest) %>%
  summarise(flight_count = n(), plane_count = n_distinct(TailNum))

hflights %>%
  group_by(Dest) %>%
  select(Cancelled) %>%
  table() %>%
  head()

cratio <- hflights %>% 
  select(Dest, Cancelled) %>%
  group_by(Dest) %>%
  transmute(cratio = sum(Cancelled)/n()) %>% 
  ungroup %>%
  distinct() %>%
  arrange(cratio) %>% 
  slice_tail(n=5)

creatio

hflights %>%
  group_by(UniqueCarrier) %>%
  select(Month, DayofMonth, DepDelay) %>%
  top_n(1) %>%
  arrange(UniqueCarrier, desc(DepDelay))

hflights$Speed_t <- lag(hflights$Speed,12)
hflights$Speed_t1 <- lead(hflights$Speed,12)

hflights %>%
  group_by(Month) %>%
  summarise(flight_count = n()) %>%
  mutate(change = ((flight_count - lag(flight_count)))/lag(flight_count,3))*100

hflights %>%
  group_by(Month) %>%
  tally() %>%
  mutate(change = n - lag(n))

a <- hflights %>%
  group_by(Month, DayOfWeek) %>%
  tally() %>%
  mutate(change = n - lag(n,2))

hflights %>% sample_n(5)

a <- hflights %>% sample_frac(0.25, replace=TRUE)
b <- hflights %>% sample_frac(0.25, replace=FALSE)

?sample_frac

summary(hflights)
