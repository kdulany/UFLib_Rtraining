# Save packages as a vector
all.lib<-c("tidyverse","ggplot2", "dplyr","tidyr","modelr")

# Load packages
lapply(all.lib,require,character.only=TRUE)

# Load data
data("mpg")
head(mpg)

# Useful functions in exploring the data
tail(mpg)
ncol(mpg)
nrow(mpg)
dim(mpg)
str(mpg)
summary(mpg)


##Creating a TIBBLE
data <- data.frame(a = 1:3, b = letters[1:3], c = Sys.Date() - 1:3)
data

as_tibble(data)

## Creating a tibble from preloaded dataset
data(iris)
head(iris)

as_tibble(iris)

# Saving the tibble a new dataset
iris.updated<-as_tibble(iris)



#exploring thru visualization

ggplot(data=mpg)+
  geom_bar(mapping = aes(y=manufacturer))

mpg %>%
  count(manufacturer)

mpg %>%
  ggplot()+
  geom_histogram(mapping = aes(x=displ), binwidth = 0.5)

mpg %>%
  count(cut_width(displ, 0.5))

mpg.sub20<-mpg %>%
  filter(cty>20)
View(mpg.sub20)


mpg.sub20 %>%
  ggplot()+
  geom_histogram(mapping = aes(x=cty), binwidth = 0.5)+
  coord_cartesian(ylim=c(0,50), x=c(0,50))

mpg.filtercol <- mpg %>%
  filter(cty <10 | cty >15) %>%
  select(manufacturer, cty, displ) %>%
  arrange(cty)
View(mpg.filtercol)



#mutate function
#ifelse(condition, VALUE IF TRUE, VALUE IF FALSE)

mpg.mutate <- mpg.filtercol %>%
  mutate(newcol = ifelse(cty < 10, 0, 1))
View(mpg.mutate)

#can add more col
mpg.mutate2 <- mpg.filtercol %>%
  mutate(newcol = ifelse(cty < 10, 0, 1),
         anothercol = cty*10,
         secondcol = rep ("something"),
         testcol = 1:142)
View(mpg.mutate2)


mpg %>%
  ggplot()+
  geom_boxplot(mapping = aes(x=reorder(manufacturer, hwy, FUN= median), y= hwy))
