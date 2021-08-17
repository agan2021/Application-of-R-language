#代码 3-1
# 示例数据
data.iris <- data.frame(Sepal.Length = c(5.1, 4.9, 4.7, 4.6), Sepal.Width = c(3.5, 3.0, 3.2, 3.1), 
                        Petal.Length = c(1.4, 1.4, 1.3, 1.5), Pe.tal.Width = rep(0.2, 4))
# 列索引
data.iris[, 1]  # 索引第一列
data.iris$Sepal.Length  # 按列的名称索引
data.iris["Sepal.Length"]  # 按列的名称索引

# 行索引
data.iris[1, ]  # 索引第一行
data.iris[1:3, ]  # 索引第一至三行

#元素索引
data.iris[1, 1]  # 索引第一列第一个元素
data.iris$Sepal.Length[1]  # 索引Sepal.Length列第一个元素
data.iris["Sepal.Length"][1]  # 索引Sepal.Length列第一个元素

# subset函数索引 
subset(data.iris, Sepal.Length < 5)  # 按条件索引行  

# sqldf函数索引
library(sqldf)
newdf <- sqldf("select * from mtcars where carb = 1 order by mpg", row.names = TRUE)

#代码 3-2
# 创建数据框
mydata <- data.frame(x1 = c(2, 2, 6, 4), x2 = c(3, 4, 2, 8))

# 创建新变量
mydata$sumx <- mydata$x1 + mydata$x2
mydata$meanx <- (mydata$x1 + mydata$x2) / 2

# 创建新变量
mydata <- transform(mydata, sumx = x1 + x2, meanx = (x1 + x2) / 2)

#代码 3-3
# 交互式编辑器修改变量名
score <- data.frame(student = c("A", "B", "C", "D"), 
                    gender = c("M", "M", "F", "F"), 
                    math = c(90, 70, 80, 60), 
                    Eng = c(88, 78, 69, 98), 
                    p1 = c(66, 59, NA, 88))
fix(score)  # 打开交互式编辑器，数据框的交互式编辑器为一个Data Editor
score.list = as.list(score)  # 将score转化为列表
fix(score.list)  # 打开交互式编辑器，列表的交互式编辑器为一个记事本

#代码 3-4
# rename()函数修改变量名
library(reshape)  # 加载reshape包
rename(score, c(p1 = "Chinese"))  # 对score中的p1重命名为Chinese
rename(score.list, c(p1 = "Chinese"))  # 对score.list中的p1重命名为Chinese

#代码 3-5
# names()函数修改变量名
names(score)[5] = "Chinese"  # 将score的第5列列名改为Chinese

#代码 3-6
# colnames函数和rownames函数修改变量名
colnames(score)[5] = "Chinese"  # 将score的第5列列名改为Chinese
rownames(score) = letters[1:4]  # 将score的行名改为a,b,c,d