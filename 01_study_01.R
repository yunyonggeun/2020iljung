y <- c(5.8, 8.0, 9.3, 7.2, 7.8, 10.3, 11.2, 10.8, 9.7, 8.5) 
y
mean(y)
summary(y)


plot(y)

boxplot(y)

sd(y); var(y); summary(y)

plot(y)

boxplot(y, ylab='Strength', xlab='kind')

hist(c(5, 1 ,5 ,2, 4, 1, 5 ,4 ,5 ,1 ,1 ,3)) 

plot(function(x){ 2*x^3 - 5*x }, xlim=range(-10,10))
