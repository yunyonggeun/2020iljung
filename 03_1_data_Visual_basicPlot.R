## 1. basicplot 함수 다루기 ##
### 자료 출처 : https://riptutorial.com/


##사용한 데이터 : R자체 데이터인 cars 데이터 이용하기 


### 1. 가장 기본적인 그래프 그리기 
plot(x = cars$speed, y = cars$dist, pch = 1, col = 2, 
     main = "Distance vs Speed of Cars", 
     xlab = "Speed", ylab = "Distance")


### 2. 반복적인 내용은 with 옵션으로 처리 
with(cars, plot(dist~speed, pch = 2, col = 3, 
                main = "Distance to stop vs Speed of Cars", 
                xlab = "Speed", ylab = "Distance"))

### 3. 추가적인 시각화 처리
plot(dist~speed, pch = "*", col = "magenta", data=cars,
     main = "Distance to stop vs Speed of Cars", 
     xlab = "Speed", ylab = "Distance")

mtext("In the 1920s.")
# mtext("In the 1920s.", side=1, line =1, adj=0.5)
grid(col="lightblue")


### 4. 한 화면에 여러 그래프를 그리기 
par(mfrow=c(2,2))
plot(cars, main="Speed vs. Distance")
hist(cars$speed, main="Histogram of Speed")
boxplot(cars$dist, main="Boxplot of Distance")
boxplot(cars$speed, main="Boxplot of Speed")


### 5. 한 화면에 여러 그래프를 그리기 
layout(matrix(c(1,1,2,3), 2,2, byrow=T))
hist(cars$speed, main="Histogram of Speed")
boxplot(cars$dist, main="Boxplot of Distance")
boxplot(cars$speed, main="Boxplot of Speed")


par(mfrow=c(1,1))

### 6. 밀도 함수 그리기 
plot(density(rnorm(100)),main="Normal density",xlab="x")

x=rnorm(100)
hist(x,prob=TRUE,main="Normal density + histogram")
lines(density(x),lty="dotted",col="red")
