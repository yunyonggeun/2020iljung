#### 2. barplot 함수 다루기 ####
### 자료 출처 : https://riptutorial.com/

# 1-1. 데이터 입력하기
grades<-c("A+","A-","B+","B","C")
Marks<-sample(grades,40,replace=T,prob=c(.2,.3,.25,.15,.1))  #sample 함수 사용법 정리 
Marks

# 1-2. 기본 차트
barplot(table(Marks),main="과학과제 연구 1차 지필 점수")

# 1-3. names.arg 옵션을 이용하여 x축 라벨을 등급 순으로 배열 가능 
barplot(table(Marks),names.arg=grades ,main="과학과제 연구 1차 지필 점수")

# 1-4. 차트에 색깔 넣기: col 옵션을 이용 
barplot(table(Marks),names.arg=grades,
        col = c("lightblue","lightcyan", "lavender", "mistyrose",  "cornsilk"),        
        main="과학과제 연구 1차 지필 점수")  

# 1-5. 수평 차트 만들기: horiz=TRUE 옵션 이용
barplot(table(Marks),names.arg=grades,horiz=TRUE,
        col = c("lightblue","lightcyan", "lavender", "mistyrose",  "cornsilk"),
        main="과학과제 연구 1차 지필 점수")

# 1-6. Y축 비율료 나타내기: prop.table(table(Marks))
barplot(prop.table(table(Marks)),names.arg=grades,
        col = c("lightblue","lightcyan", "lavender", "mistyrose",  "cornsilk"),
        main="과학과제 연구 1차 지필 점수")

# 1-7. X축 라벨 크기 조정하기
barplot(prop.table(table(Marks)),names.arg=grades,
        col = c("lightblue","lightcyan", "lavender", "mistyrose",  "cornsilk"),
        main="과학과제 연구 1차 지필 점수",cex.names=1.5)

# 1-8. 행렬 데이터 만들기 
gradTab <- matrix(c(13, 10, 4, 8, 5, 10, 7, 2, 19, 2,7,2,14,12,5), nrow = 5)

# 1-8-1. 행렬 이름 만들기 
dimnames(gradTab)=list(row=c("A-","A+","B","B+","C"),
                       col=c("Algorithms", "Operating System", "Discrete Math"));gradTab

# 1-8-2. 누적 그래프 만들기 
barplot(gradTab,col = c("lightblue","lightcyan","lavender", "mistyrose",  "cornsilk"),
        legend.text = grades, 
        main="과학과제 연구 1차 지필 점수")

# 1-8-3. 병렬 막대 그래프 만들기
barplot(gradTab,beside = T,
        col = c("lightblue","lightcyan","lavender", "mistyrose","cornsilk"),
        legend.text = grades,
        main="과학과제 연구 1차 지필 점수")

barplot(gradTab,beside = T,horiz=T,
        col = c("lightblue","lightcyan","lavender", "mistyrose",  "cornsilk"),
        legend.text = grades,
        cex.names=.75,
        main="과학과제 연구 1차 지필 점수")
