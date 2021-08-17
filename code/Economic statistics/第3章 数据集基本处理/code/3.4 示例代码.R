#代码 3-23
# 使用SQL语句操作数据
name <- c(rep("张三", 1, 3), rep("李四", 3))
subject <- c("数学", "语文", "英语", "数学", "语文", "英语")
score <- c(89, 80, 70, 90, 70, 80)
stuid <- c(1, 1, 1, 2, 2, 2)
stuscore <- data.frame(name, subject, score, stuid)
library(sqldf)
# 计算每个人的总成绩并排名(要求显示字段：姓名，总成绩)
sqldf("select name, sum(score) as allscore from stuscore group by name order 
      by allscore")
# 计算每个人的总成绩并排名(要求显示字段: 学号，姓名，总成绩)
sqldf("select name, stuid, sum(score) as allscore from stuscore group by name 
      order by allscore")
# 计算每个人单科的最高成绩(要求显示字段: 学号，姓名，课程，最高成绩)
sqldf("select stuid, name, subject, max(score) as maxscore from stuscore group 
      by stuid")
# 计算每个人的平均成绩（要求显示字段: 学号，姓名，平均成绩）
sqldf("select stuid, name, subject, avg(score) as avgscore from stuscore group 
      by stuid")
# 列出各门课程成绩最好的学生(要求显示字段: 学号，姓名,科目，成绩)
sqldf("select stuid, name, subject,max(score) as maxscore from stuscore group 
      by subject order by stuid")
# 列出各门课程的平均成绩（要求显示字段：课程，平均成绩）
sqldf("select subject, avg(score) as avgscore from stuscore group by subject")

#代码 3-24
# 数据汇总统计
score <- data.frame(ID = c(101, 102, 103, 104, 105, 106, 107, 108, 109, 110), 
                    score1 = c(92, 86, 85, 74, 82, 88, 96, 91, 84, 72), 
                    score2 = c(73, 69, 82, 93, 80, 94, 71, 87, 86, 91), 
                    gender = c("male", "male", "female", "female", "female", 
                               "female", "female", "male", "male", "male"))
# 提取score中的gender字段
gd <- list(score[, 4])
# 对score1和score2列进行分组统计
aggregate(score[, c(2, 3)], gd, mean)

#代码 3-25
# 数据汇总统计
attach(mtcars)
colnames(mtcars)  # 变量重命名
aggregate(mtcars[, c(1, 3)], by = list(cyl, gear), FUN = mean)  # 数据汇总统计

#代码 3-26
# 数据合并
df1 <- data.frame(CustomerId = c(1:6), 
                  Product = c(rep("Toaster", 3), rep("Radio", 3)))
df2 <- data.frame(CustomerId = c(2, 4, 6, 7), 
                  State = c(rep("Alabama", 3), rep("Ohio", 1)))
merge(df1, df2, all = TRUE)  # 取并集
merge(df1, df2, all = FALSE)  # 取交集
merge(df1, df2, all.x = TRUE)  # 以df1所拥有的显示

#代码 3-27
ID <- c(1, 2, 3, 4)
name <- c("A", "B", "C", "D")
score <- c(60, 70, 80, 90)
student1 <- data.frame(ID, name)
student2 <- data.frame(ID, score)
total.student1 <- merge(student1, student2, by = "ID")
total.student1

#代码 3-28
# 数据融合
library(reshape2)

# 作用于数据框的例子
head(airquality)
# 保留变量"Ozone","Month","Day"，其他的变量作为观测值，拉长数据框。
air.melt <- melt(airquality, id = c("Ozone", "Month", "Day"), na.rm = TRUE) 
head(air.melt)

# 作用于数组的例子
a <- array(c(1:11, NA), c(2, 3, 2))
a
# 把高维数组a拉成一个数据框
a.melt <- melt(a, na.rm = TRUE, varnames = c("X", "Y", "Z"))
head(a.melt)