#### 2. barplot �Լ� �ٷ�� ####
### �ڷ� ��ó : https://riptutorial.com/

# 1-1. ������ �Է��ϱ�
grades<-c("A+","A-","B+","B","C")
Marks<-sample(grades,40,replace=T,prob=c(.2,.3,.25,.15,.1))  #sample �Լ� ���� ���� 
Marks

# 1-2. �⺻ ��Ʈ
barplot(table(Marks),main="���а��� ���� 1�� ���� ����")

# 1-3. names.arg �ɼ��� �̿��Ͽ� x�� ���� ��� ������ �迭 ���� 
barplot(table(Marks),names.arg=grades ,main="���а��� ���� 1�� ���� ����")

# 1-4. ��Ʈ�� ���� �ֱ�: col �ɼ��� �̿� 
barplot(table(Marks),names.arg=grades,
        col = c("lightblue","lightcyan", "lavender", "mistyrose",  "cornsilk"),        
        main="���а��� ���� 1�� ���� ����")  

# 1-5. ���� ��Ʈ �����: horiz=TRUE �ɼ� �̿�
barplot(table(Marks),names.arg=grades,horiz=TRUE,
        col = c("lightblue","lightcyan", "lavender", "mistyrose",  "cornsilk"),
        main="���а��� ���� 1�� ���� ����")

# 1-6. Y�� ������ ��Ÿ����: prop.table(table(Marks))
barplot(prop.table(table(Marks)),names.arg=grades,
        col = c("lightblue","lightcyan", "lavender", "mistyrose",  "cornsilk"),
        main="���а��� ���� 1�� ���� ����")

# 1-7. X�� �� ũ�� �����ϱ�
barplot(prop.table(table(Marks)),names.arg=grades,
        col = c("lightblue","lightcyan", "lavender", "mistyrose",  "cornsilk"),
        main="���а��� ���� 1�� ���� ����",cex.names=1.5)

# 1-8. ��� ������ ����� 
gradTab <- matrix(c(13, 10, 4, 8, 5, 10, 7, 2, 19, 2,7,2,14,12,5), nrow = 5)

# 1-8-1. ��� �̸� ����� 
dimnames(gradTab)=list(row=c("A-","A+","B","B+","C"),
                       col=c("Algorithms", "Operating System", "Discrete Math"));gradTab

# 1-8-2. ���� �׷��� ����� 
barplot(gradTab,col = c("lightblue","lightcyan","lavender", "mistyrose",  "cornsilk"),
        legend.text = grades, 
        main="���а��� ���� 1�� ���� ����")

# 1-8-3. ���� ���� �׷��� �����
barplot(gradTab,beside = T,
        col = c("lightblue","lightcyan","lavender", "mistyrose","cornsilk"),
        legend.text = grades,
        main="���а��� ���� 1�� ���� ����")

barplot(gradTab,beside = T,horiz=T,
        col = c("lightblue","lightcyan","lavender", "mistyrose",  "cornsilk"),
        legend.text = grades,
        cex.names=.75,
        main="���а��� ���� 1�� ���� ����")