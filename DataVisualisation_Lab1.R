# pro tip
data()

# load data
#install.packages('gapminder')
library(gapminder)
library(tidyverse)
# inspect the data
head(gapminder, n=8)
tail(gapminder, n =10)

summary(gapminder)

# Scatter plot


p <- ggplot( data=gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point() 
p

# scale linear scale to logarithmic scale
p <- p + scale_x_log10()

# color attribute
p <- p + aes(color=continent)
p

# Additional aesthetics
# size ,but many others...show size in the current graph but refer to cheat sheet for more


p + aes(size=pop)

p+geom_smooth(lwd=3, se=FALSE)


# line charts
p <- ggplot( data=gapminder, aes(x = year, y = lifeExp)) + geom_line() 

p<-p+aes(group=country)

p <- p +  aes(color=continent)



# subset specific countries

ggplot(subset(gapminder, country=='Afghanistan' | country=='China' | country=='United States' | country=='United Kingdom'), aes(x=year,y=lifeExp,colour=country))+geom_line()

# box plot
ggplot(data=gapminder, aes(x=continent, y=lifeExp))+geom_boxplot(outlier.colour = "red")+geom_jitter(width=0.2)

# histogram
ggplot(data=gapminder, aes(fill=continent, x=lifeExp))+geom_histogram()


# density plot
ggplot(data=gapminder, aes(fill=continent, x=lifeExp))+ geom_density(alpha = 0.2)+xlab('Life Expectancy')+ylab('Probability Density Function')

# bar chart
ggplot(data=gapminder, aes(x=continent))+ geom_bar()

ggplot(data=subset(gapminder, year==2007), aes(x=continent))+ geom_bar() +coord_flip()

