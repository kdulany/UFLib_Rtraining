#Second UF Lib Intro to R series


#checking for datasets from R
data()

data("Orange")
View(Orange)
Orange

head(Orange) #Top 6 rows
tail(Orange) #Last 6 rows
str(Orange) #Data types
dim(Orange) #Row then Column

##DATA FRAMES
# CAN CONTAIN MULT DATA TYPES
dat.new <- data.frame()

name <- c("Ana", "Bob", "Chris")
language <- c("R", "C", "Java")
year <- c(4, 6,7)

firstdata <- data.frame(name, language, year)

#Data frames - need to use = signs to set contents
data.new <- data.frame (name=c("Anna", "Bob", "Chris", "Dave"),
                       bol = c(TRUE, FALSE, TRUE, FALSE),
                       year = c(4,6,7, 9))
data.new

write.csv(data.new, file = "mynewdata.csv", row.names = FALSE)

read.csv("mynewdata.csv")

#subsetting data frames
#indexing
dataReadback <- read.csv("mynewdata.csv", header = TRUE)

dataReadback$name[3]
dataReadback[4,1]
dataReadback[4,]

dataReadback[-2,]


data.new
data.more <- data.frame (name=c("Emma", "Felicia", "George"),
                         bol = c(TRUE, FALSE, TRUE),
                         year = c(4,6,7))

#rowbind
rowbind.data <-rbind(data.more, data.new)
#Col number needs to be the same

#column bind

colbind.data <- cbind(data.new, data.more)
#row info needs to be the same number








###Matrices // MATRIX
#ALL NUMBERS 
mat.example <- matrix(0, ncol = 4, nrow = 8)
View(mat.example)
class(mat.example)
dim(mat.example)

mat.dataex <- rnorm(20)

#populate the matrix
mat.example1 <- matrix(mat.dataex, nrow= 4, ncol = 5, byrow = FALSE)
View(mat.example1)

mat.example1[4,4]


##LISTS in R
#lists contain multiple elements containing data - DFs Matrix, Rows/Cols

list.example <- list(c("Red", "Green"), name, TRUE, mat.example1, data.new)
list.example

list.example[[1]][2] # call which part of the list then which row/col in that df


