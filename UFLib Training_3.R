#UFLib R Trianing Session 3 
#Data Visualization

#Set Libraries and Packages
library("reshape2")
library("ggplot2")
library("gridExtra")
install.packages("ggpubr")
library("ggpubr")
install.packages("ggthemes")
library("ggthemes")
library("scales")
library("RColorBrewer")
library("tidyverse")
install.packages("hrbrthemes")
library("hrbrthemes")
install.packages("extrafont")
library("extrafont")
install.packages("ggtext")
library("ggtext")

############################################
#How to use Color in R
############################################

library(RColorBrewer)
par(mar=c(3,4,2,2))
display.brewer.all()


#Creating your own color pallete

pastel.colpal<-c("#355070", "#6d597a", "#b56576", "#e56b6f", "#eaac8b","#a44200")


####ADD DATA####

data() #all R data sets
data("iris") #Floral Data Set Example
head(iris)
str(iris)
dim(iris)
class(iris)

## ggplot 2 ##

#set data, aesthetics, graph type
ggplot(data = iris, mapping = aes (x=Species, y=Sepal.Width, color = Species))+
  geom_point()

ggplot(data = iris, mapping = aes (x=Species, y=Sepal.Width, color = Species))+
  geom_boxplot()

ggplot(data = iris, mapping = aes (x=Species, y=Sepal.Width, color = Species))+
  geom_violin()



ggplot(data = iris, mapping = aes (x=Species, y=Sepal.Width, color = Species))+
  geom_violin()+
  geom_point()


#Investigating petal length with sepal length

ggplot(data=iris, mapping = aes(x=Sepal.Length, y = Petal.Length))+
  geom_point()

#add grouping and color - can layer 2 plot types
ggplot(data=iris, mapping = aes(x=Sepal.Length, y = Petal.Length, group=Species, color = Species))+
  geom_point()+
  geom_line()

#add grouping and color can identify aes by graph type
ggplot(data=iris, mapping = aes(x=Sepal.Length, y = Petal.Length, group=Species))+
  geom_point(alpha = 0.2)+
  geom_line(aes(color = Species))

#specifying colors - basic
ggplot(data=iris, mapping = aes(x=Sepal.Length, y = Petal.Length, group=Species))+
  geom_point(alpha = 0.2)+
  geom_line(aes(color = Species))+
  scale_color_manual(values = c("blue", "yellow", "red"))

#specifying colors - custom color pal
ggplot(data=iris, mapping = aes(x=Sepal.Length, y = Petal.Length, group=Species, color = Species))+
  geom_point()+
  geom_line(alpha = 0.2)+
  scale_color_manual(values = c(pastel.colpal))+
  geom_smooth(method ="lm", linewidth=1)

# adding in facet wrap and facet grid - break by species
ggplot(data=iris, mapping = aes(x=Sepal.Length, y = Petal.Length, group=Species, color = Species))+
  geom_point()+
  geom_line(alpha = 0.2)+
  scale_color_manual(values = c(pastel.colpal))+
  geom_smooth(method ="lm", linewidth=1)+
  #facet_wrap(~Species)
  facet_grid(Species~.) # ~TEXT vertical separation TEXT~. horizontal separation


# Graph Labels and Themes
ggplot(data=iris, mapping = aes(x=Sepal.Length, y = Petal.Length, group=Species, color = Species))+
  geom_point()+
  geom_line(alpha = 0.2)+
  scale_color_manual(values = c(pastel.colpal))+
  geom_smooth(method ="lm", linewidth=1)+
  facet_wrap(~Species)+
  xlab("Sepal Length")+
  ylab("Petal Lenth")+
  theme_classic2()+
  ggtitle("Relationship between petal and sepal lengths")


# Custom Label qualities
figure1 <- ggplot(data=iris, mapping = aes(x=Sepal.Length, y = Petal.Length, group=Species, color = Species))+
  geom_point()+
  geom_line(alpha = 0.2)+
  scale_color_manual(values = c(pastel.colpal))+
  geom_smooth(method ="lm", linewidth=1)+
  facet_wrap(~Species)+
  xlab("Sepal Length")+
  ylab("Petal Lenth")+
  theme_classic2()+
  ggtitle("Relationship between petal and sepal lengths")+
  theme(axis.ticks.x=element_blank(),
      legend.title = element_text(size=14,face = "bold"),
      legend.text = element_markdown(size=12,face="bold"),
      axis.text.x = element_text(size=14,face="bold"),
      axis.text.y = element_text(size=14,face="bold"),
      axis.title.y = element_text(size=18,face="bold"),
      axis.title.x = element_text(size = 18,face="bold"))



ggsave(filename = "MyNewFigure.jpeg", plot = figure1, width = 10, height = 7, dpi = 1000)




##########################################
#MULTIPLE PLOTS AND COMBINING IMAGES
##########################################

fig1<-ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + 
  geom_boxplot(fill="slateblue", alpha=0.2) + 
  xlab("cyl")
fig1

data <- data.frame(
  type = c( rep("variable 1", 1000), rep("variable 2", 1000) ),
  value = c( rnorm(1000), rnorm(1000, mean=4) ))

fig2<- data %>%
  ggplot( aes(x=value, fill=type)) +
  geom_histogram( color="#e9ecef", alpha=0.6, position = 'identity') +
  scale_fill_manual(values=c("#69b3a2", "#404080")) +
  theme_ipsum() +
  labs(fill="")
fig2

path<-"https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/1_OneNum.csv"

data <- read.table(path, header=TRUE)

# Make the histogram
fig3<- data %>%
  filter( price<300 ) %>%
  ggplot( aes(x=price)) +
  geom_density(fill="#69b3a2", color="#e9ecef", alpha=0.8)
fig3


# Note you will have to specify a dataset here from your computer for this to work
data("Orange")
write.csv(Orange,"newlysaved.csv",row.names = FALSE)
data<-read.csv(file = "newlysaved.csv")

fig4<- data %>%
  ggplot(aes(x=Tree,y=circumference,color=Tree))+
  geom_boxplot(aes(factor(Tree)))
fig4



all.fig<-ggarrange(nrow = 2,ncol = 2, 
                   fig1,fig2,fig3,fig4,
                   labels = c("a)","b)","c)","d)"))
all.fig

ggsave(filename="MultipleFigures.jpeg", plot=all.fig, width=15, height=8,dpi=600)
