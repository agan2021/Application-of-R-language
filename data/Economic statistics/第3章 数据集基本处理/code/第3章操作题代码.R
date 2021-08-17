#操作题（1）
a<-matrix(1:12,3,4)
fix(a)
a<-c(1,2,3,4)
b<-c(11,22,33,44)
x1<-data.frame(a,b,d=a-b,e=a*b,f=a%%b)
x1

#操作题（2）
x2<-data.frame(id=c(1,2,3,4),name=c("张三","李四","王五","赵六"),
               math=c(70,89,NA,80),English=c(86,78,65,92))
anyNA(x2)
na.omit(x2)
dates <- c("10/27/2017", "02/25/2017", "01/14/2017", "07/18/2017", "04/01/2017")
 # 按照月日年的格式进行转换
(date <- as.Date(dates, "%m/%d/%Y"))
datas1<- c("2017-09-08 11:17:52", "2017-08-07 20:33:02")
# 对字符串形式的日期时间值按照格式进行转换
as.POSIXlt(datas1, tz = "", "%Y-%m-%d %H:%M:%S")
(datas2 <- strptime(datas1, "%Y-%m-%d %H:%M:%S")) 
score <- data.frame(student = c("A", "B", "C", "D"), 
                    gender = c("M", "M", "F", "F"), 
                    math = c(90, 70, 80, 60), 
                    Eng = c(88, 78, 69, 98), 
                    p1 = c(66, 59, NA, 88))
names(score)[5] = "Chinese"
score
sort(score$Chinese,decreasing=TRUE, na.last=TRUE) 

#操作题（3）
data<- data.frame(a = c(5.1, 4.9, 4.7), b = c(3.5, 3.0, 3.2), c = c( 1.4, 1.3, 1.5),d = rep(0.2, 3))
newdata <- data[, c(3:4)]
newdata1 <- subset(data, a == "4.9", select = c(b, d))

a<-c(11,22,33,44,55,66,77,88,99)
sample(a, 5, replace = TRUE) #放回简单随机抽样
sample(a, 5, replace = FALSE)  # 不放回简单随机抽样

#操作题（4）
name <- c(rep("张三", 1, 3), rep("李四", 3))
subject <- c("数学", "语文", "英语", "数学", "语文", "英语")
score <- c(89, 80, 70, 90, 70, 80)
stuid <- c(1, 1, 1, 2, 2, 2)
stuscore <- data.frame(name, subject, score, stuid)
library(sqldf)
# 计算每个人的总成绩并排名(要求显示字段：学号，总成绩)
sqldf("select stuid, sum(score) as allscore from stuscore group by stuid order 
      by allscore")
# 计算每个人单科的最高成绩(要求显示字段: 学号，课程，最高成绩)
sqldf("select stuid, subject, max(score) as maxscore from stuscore group 
      by stuid")
# 列出各门课程成绩最好的学生(要求显示字段: 学号,科目，成绩)
sqldf("select stuid,  subject,max(score) as maxscore from stuscore group 
      by subject order by stuid")
# 列出各门课程成绩最差的学生（要求显示字段：学号,科目，成绩）
sqldf("select stuid,subject, min(score) as minscore from stuscore group by 
      subject order by stuid")
data<-list(a=c(11,22,33,44),b=matrix(1:10,nrow=2),c="one,two,three",d=c(TRUE,FALSE))
data
library(reshape2)
melt(data, varnames = c("X", "Y"), value.name = "value", na.rm = FALSE)

#操作题（5）
data1<-c("we","are","family","you","good")
sub("eo","t",txt)
gsub("eo","t",txt)
b<-paste("ab", 1:3, sep = "")  
x <- list(a = "st", b = "nd", c = "yw")
y <- list(d = 1, e = 2)
c<-paste(x, y, sep = "-", collapse = "; ")  # 设置collapse参数，连成一个字符串