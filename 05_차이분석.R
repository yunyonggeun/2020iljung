#### 1. 데이터 불러오기 ####
rdata <- read.csv("sample.csv", stringsAsFactors=T)
data <- rdata


#### 2. 기술통계 ####
summary(data)

library(rstatix)
get_summary_stats(data)

library(FSA)
Summarize(만족도~성별, data)
Summarize(만족도~성별+나이, data)
write.csv(Summarize(만족도~성별+나이, data), "result.csv")


#### 3. 통계 분석 ####
#### 가. 성별에 따른 만족도 차이 ####
#### _1) 정규성, 등분산을 만족할 때 ####
shapiro.test(resid(lm(만족도~성별, data)))  # 정규성 검정

library(car)
leveneTest(만족도~성별, data)               # 등분산 검정

t.test(만족도~성별, data)                   # T 검정
summary(aov(만족도~성별, data))

library(rstatix)
data %>% cohens_d(만족도~성별)
# 0.2 (작은 차이), 0.5(중간 크기의 차이), 0.8(큰 차이)


#### _2) 조건 없이 분석 ####
wilcox.test(만족도~성별, data) # Wilcoxon 검정 : 강추!!! 아무 조건 없이 사용
kruskal.test(만족도~성별, data)

library(rcompanion)
wilcoxonR(data$만족도, data$성별)


#### _3) 데이터의 시각화 ####
library(ggpubr)
ggbarplot(data, x="성별", y="만족도", add=c("mean_ci"), fill="성별", 
          legend="right", label=T, lab.nb.digits=2, lab.hjust=1.5)+
    stat_compare_means(method="wilcox", label.x=1.2, label.y=5.5) +
    scale_fill_grey(start=0.4, end=0.8)



#### 나. 나이에 따른 만족도 차이 ####
#### _1) 정규성과 등분산을 만족할 때 ####
shapiro.test(resid(lm(만족도~나이, data)))  # 정규성 검정

library(car)
leveneTest(만족도~나이, data)               # 등분산 검정

#### __가) 차이 여부 ####
summary(aov(만족도~나이, data))             # ANOVA 검정

#### __나) 효과 크기 ####
library(effectsize)
cohens_f(aov(만족도~나이, data))

#### __다) 사후 검정 ####
pairwise.t.test(data$만족도, data$나이)     # 정규성, 등분산 만족할 때 사후검정



#### _2) 조건없이 분석 ####
kruskal.test(만족도~나이, data)             # Kruskal-Wallis 검정 : 초강추!!!!!!

library(rstatix)
data %>% kruskal_effsize(만족도~나이)       # 효과크기
# ~0.06 (작은 효과), 0.06~0.14 (중간 효과), 0.14~ (큰 효과)

library(FSA)
dunnTest(만족도~나이, data)                 # kruskal.test 사후검정
Summarize(만족도~나이, data)

# 논문에 표시하는 방법
# https://www.kidney-international.org/article/S0085-2538(20)30532-9/fulltext

#### _3) 데이터의 시각화 ####
library(ggpubr)
ggbarplot(data, x="나이", y="만족도", add=c("mean_ci"), fill="나이",
          legend="right", label=T, lab.nb.digits=2, lab.hjust=1.2)+
    stat_compare_means(method="kruskal", label.x=2.5, label.y=5.5)  # 초강추!!!!



#### 다. 성별에 따른 음식맛 ####







#### 라. 나이에 따른 인테리어 ####






