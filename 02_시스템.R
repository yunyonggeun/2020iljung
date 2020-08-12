# 2020 일급 정교사 자격 연수 생명과학 분과 연수 
# Date: 2020.8.17. Monday

#### 1. 시스템 설정하기 - 필수 내용 ####

# 1. 변수 설정 지우기  
rm(list=ls())

#2. 현재 설정된 작업 디렉토리 위치를 불러오기
getwd()

#3. 작업할 디렉토리 위치를 지정
setwd("c:/R_studio")

setwd("c:/R_studio/dataScience")


#4. 콘솔창에서 ctrl-L누르기 

#### 2. 패키지 다루기 ####
install.packages()
library()


#### 3. 통계의 기초  ####
#====================================
# t 검정하기
# 얻어진 값을 평균 7과 비교하기
#====================================

data <- c(5.8, 8.0, 9.3, 7.2, 7.8, 10.3, 11.2, 10.8, 9.7, 8.5)

summary(data)

boxplot(data, ylab='Strength')

t.test(data, mu=7.0, alt='two.sided') # 양측(같다고 할 수 있는가?)

t.test(data, mu=7.0, alt='greater') # 단측(크다고 할 수 있는가?)

t.test(data, mu=7.0, alt='less') # 단측(작다고 할 수 있는가?)





#====================================
# t 검정하기
# 얻어진 값을 비교하기
#====================================

data1 <- c(4.1, 3.3, 4.3, 4.2, 5.3, 6.5, 5.0)
data2 <- c(3.3, 4.3, 3.5, 3.6, 5.3, 2.7, 4.5)

ex_data <- data.frame(data1, data2)  
summary(ex_data)

boxplot(ex_data, xlab='지혈제의 종류', ylab='Strength', main = '지혈제의 효과 비교')
boxplot(ex_data, xlab='지혈제의 종류', ylab='Strength', main = '지혈제의 효과 비교', col = c('green','purple'))

t.test(data1, data2, var.equal=TRUE, alternative='two.sided') 



