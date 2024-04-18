



setwd("~/Documents/GitHub/UFLib_Rtraining")
getwd()


1+1 #add
1-2 #subtract
544*90 # mult
1234567/231 #division

#Comparisons/ Logic
1==3 #False
1==1 #true

1!=7 #not equal
4>7 #greater than
6<9 #less than
6>= 1234 #greater than equal to

#functions

sin(1)
cos(1)
tan(1)

log(2)
log10(2)
exp(1)

#Asking for help
#?sin #help through R
#??sin #fuzzy search through all packages

#variables
x <- 12324
y <- x+1
z=12

#removing variables
rm(z)

##Vectors
x <- 1:10
View(x)
x
y <- 11:232

#subset values
y[16]
y[133]
y[4:7]

mynewvar <- c(1,7,9,12321, 3434)
str(mynewvar) #type of vector

#string vector
stringvector <- c("Courtnet", "Sam", "car")
str(stringvector)
stringvector[2]

#logical vector
x.log <- c(TRUE, FALSE, TRUE, TRUE)
str(x.log)

#sequence
seq(from=1, to=100)
1:100

seq(from=1, to =100, by =5)
