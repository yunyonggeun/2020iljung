#### 1. 데이터 불러오기 ####
rdata <- read.csv("sample.csv", stringsAsFactors=T)
data <- rdata


#### 2. 기술통계 ####
summary(data)

cor(data[,c(4:10)])
cor(data[,c(4:10)], method="pearson")   # 정규성을 만족할 때
cor(data[,c(4:10)], method="spearman")  # 조건없이 사용 가능



#### 3. 통계 분석 ####
#### 가. 상관관계 ####
library(PerformanceAnalytics) 
chart.Correlation(data[,c(4:10)], method="spearman")
# https://link.springer.com/content/pdf/10.1007/s10389-020-01329-5.pdf



#### 나. 회귀분석 ####
summary(fit.lm <- lm(만족도~., data))

shapiro.test(resid(fit.lm))  # 정규성 검정

library(lmtest)
bptest(fit.lm)               # 등분산 검정

library(car)                    
dwt(fit.lm)                  # 자기상관성

vif(fit.lm)                  # 다중공선성

#### _1) 정규성, 등분산, 자기상관성 없고, 다중공선성 없을 때 ####
summary(fit.lm <- lm(만족도~., data))
cor(predict(fit.lm, data), data$만족도)^2

summary(fit.lm <- step(lm(만족도~., data)))


#### _2) 정규성을 만족하지 않을 때 선형회귀 ####
library(tidymodels); library(tidyr)
print(fit.bootslm <- data %>% bootstraps(100) %>% 
          mutate(model=map(splits, function(x){lm(만족도~., x)})) %>% 
          mutate(tidy=map(model, tidy)) %>% unnest(tidy) %>% group_by(term) %>% 
          summarise(estimate=mean(estimate), low=quantile(estimate, .05/2),
                    high=quantile(estimate, 1-.05/2),
                    std.error=mean(std.error), t=mean(statistic), p=mean(p.value)))


#### _3) 비선형 회귀분석 ####
library(caret)
fit.svm <- train(만족도~., data, method="svmRadial")
cor(predict(fit.svm, data), data$만족도)^2
plot(varImp(fit.svm))

