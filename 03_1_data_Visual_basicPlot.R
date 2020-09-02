## 1. basicplot �Լ� �ٷ�� ##
### �ڷ� ��ó : https://riptutorial.com/


##����� ������ : R��ü �������� cars ������ �̿��ϱ� 


### 1. ���� �⺻���� �׷��� �׸��� 
plot(x = cars$speed, y = cars$dist, pch = 1, col = 2, 
     main = "Distance vs Speed of Cars", 
     xlab = "Speed", ylab = "Distance")


### 2. �ݺ����� ������ with �ɼ����� ó�� 
with(cars, plot(dist~speed, pch = 2, col = 3, 
                main = "Distance to stop vs Speed of Cars", 
                xlab = "Speed", ylab = "Distance"))

### 3. �߰����� �ð�ȭ ó��
plot(dist~speed, pch = "*", col = "magenta", data=cars,
     main = "Distance to stop vs Speed of Cars", 
     xlab = "Speed", ylab = "Distance")

mtext("In the 1920s.")
# mtext("In the 1920s.", side=1, line =1, adj=0.5)
grid(col="lightblue")


### 4. �� ȭ�鿡 ���� �׷����� �׸��� 
par(mfrow=c(2,2))
plot(cars, main="Speed vs. Distance")
hist(cars$speed, main="Histogram of Speed")
boxplot(cars$dist, main="Boxplot of Distance")
boxplot(cars$speed, main="Boxplot of Speed")


### 5. �� ȭ�鿡 ���� �׷����� �׸��� 
layout(matrix(c(1,1,2,3), 2,2, byrow=T))
hist(cars$speed, main="Histogram of Speed")
boxplot(cars$dist, main="Boxplot of Distance")
boxplot(cars$speed, main="Boxplot of Speed")


par(mfrow=c(1,1))

### 6. �е� �Լ� �׸��� 
plot(density(rnorm(100)),main="Normal density",xlab="x")

x=rnorm(100)
hist(x,prob=TRUE,main="Normal density + histogram")
lines(density(x),lty="dotted",col="red")