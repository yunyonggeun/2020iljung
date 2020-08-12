# 2020 일급 정교사 자격 연수 생명과학 분과 연수 
# Date: 2020.8.17. Monday

## t-test: 그룹간 평균의 유의미한 차이가 있는지를 분석하는 통계적 방법
## 종류: 독립 표본 t-test, 대응 표본 t-test, 단일 표본 t-test

###### 가. 독립 표본 t-test: 서로 독립적인 두 집단의 평균을 비교하는 통계적 방법
##########예) 남학생과 여학생의 과학 점수의 차이 

###### 나. 대응 표본 t-test: 동일한 집단에 처치 전후의 평균을 비교하는 통계적 방법
##########예) 방과후 수업 전후의 과학 점수의 차이 

###### 다. 단일 표본 t-test: 단일 집단의 평균이 특정 수치와 차이가 있는지 비교하는 통계적 방법
##########예) 우리나라 고 3남학생의 평균 키가 180cm인지 여부


#### 통계처리 전 유의점: t-test 전에 등분산성과 정규성 검정이 먼저 이루어져야 함.


#### 1. 독립 표본 t-test ####

##  기어종류(am)에 따른 mpg의 차이가 통계적으로 유의한지 t-test 검증 

### 1-1. 데이터 불러오기 
str(mtcars)                       ## 데이터의 구조 미리 보기

head(mtcars)                      ## 전체 데이터를 살펴보기 전에 앞 10개의 데이터 검토 

## csv로 파일 저장하기 
write.csv(mtcars,"data/mtcars.csv", row.names = TRUE)

### 1-2. 등분산성 테스트
var.test(mtcars[mtcars$am==1,1], mtcars[mtcars$am==0,1])

var.test(mpg,am, data=mtcars)
## 귀무 가설 = 등분산성이다. // 대립가설 = 등분산이 아니다.
## p value가 유의수준 (0.05)보다 크면 귀무 가설인 등분산성 가정을 만족함



### 1-3. t-test
t.test(mtcars[mtcars$am==1,1], mtcars[mtcars$am==0,1],
       paired = FALSE, var.equal = TRUE, conf.level = 0.95)


t.test(mpg ~ am, data=mtcars, var.equal=TRUE)
## p value가 유의수준 (0.05)보다 작으므로 귀무 가설을 기각하고 유의미한 차이가 있다고 판단할 수 있다.


#### 2. 대응 표본 t-test ####

## 영양제 수액  처리가 뽕 나무 잎의 길이에 영향을 주는 지 t-test 검증 

## 2-1. 데이터 가져오기
pre_T = c(16, 20, 21, 22, 23, 22, 27, 25, 27, 28)
post_T = c(19, 22, 24, 24, 25, 25, 26, 26, 28, 32)


var.test(pre_T, post_T)

t.test(pre_T, post_T, paired = TRUE)

### 결과 해석 : 


#### 3. 단일 표본 t-test ####

## 영양제 수액  처리가 뽕 나무 잎의 길이에 영향을 주는 지 t-test 검증 

## 3-1. 데이터 가져오기
summary(post_T)

t.test(post_T, alternative = "greater", mu=24)

# 결론 : 영양제 수액 처리에 대한 검정 통계량의 p value(0.1696)>유의 수준(0.05)이므로 H0를 기각하지 못한다. 유의수준 5%에서 잎의 평균은 24보다 크다고 할 수 없다. 모평균의 추정 값은 25.1이고 가설검정 방향에 대한 모평균의 95% 신뢰 구간은 (23.10218, Inf)이다. 

## 4. 데이터를 그래프로 그리기
boxplot(pre_T,post_T,
        main="영양제 수액의 잎 성장 효과",
        xlab="수액 처리 전 후",
        ylab="길이(cm)",
        col = c("lightcyan", "mistyrose"))

## 5. 데이터를 그래프로 그리기-ggplot2를 이용하기 위해 데이터 프레임으로 자료 변환
####################################################################################
leaf_area <- data.frame(treat = c("pre", "pre","pre","pre","pre",
                                  "pre","pre","pre","pre","pre", 
                                  "post","post","post","post","post",
                                  "post","post","post","post","post"),
                        length = c(16, 20, 21, 22, 23, 22, 27, 25, 
                                   27, 28, 19, 22, 24, 24, 25, 25, 26, 26, 28, 32))
library(ggplot2)

ggplot(leaf_area, aes(x=treat, y=length)) + 
    geom_boxplot(color="blue",  fill="blue", alpha=0.2,
                 
                 # Notch?
                 notch=TRUE, notchwidth = 1.2,
                 
                 # custom outliers
                 outlier.colour="red", outlier.fill="red",  outlier.size=3
    )
########################################################################

