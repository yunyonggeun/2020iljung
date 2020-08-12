## 3. ggplot2 함수 다루기 ##
### 자료 출처 : https://riptutorial.com/


##사용한 데이터 : R자체 데이터인 cars 데이터 이용하기 

###1. 라이브러리 불러오기
library(ggplot2)

ggplot(mpg, aes(x = displ, y = hwy)) + geom_point() + facet_wrap(~class)

ggplot(mpg, aes(x = displ, y = hwy)) + geom_point() + facet_grid(.~class)

ggplot(mpg, aes(x = displ, y = hwy)) + geom_point() + facet_grid(class~.)

ggplot(mpg, aes(x = displ, y = hwy)) + geom_point() + facet_grid(trans~class)
                                     #"row" parameter, then "column" parameter

ggplot(iris, aes(x = Petal.Width, y = Petal.Length, color = Species)) + 
    geom_point()

ggplot(diamonds, aes(cut, price)) + geom_violin()

ggplot(diamonds, aes(cut, price)) + geom_violin() +
    geom_boxplot(width = .1, fill = "black", outlier.shape = NA) +
    stat_summary(fun = "median", geom = "point", col = "white")
