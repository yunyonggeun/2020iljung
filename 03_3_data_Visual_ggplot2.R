## 3. ggplot2 �Լ� �ٷ�� ##
### �ڷ� ��ó : https://riptutorial.com/


##����� ������ : R��ü �������� cars ������ �̿��ϱ� 

###1. ���̺귯�� �ҷ�����
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