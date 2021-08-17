#代码 3-7
# 缺失值分析
is.na(score)  # 缺失值检测，TURE表明该位置的值为缺失值
student	gender	math	Eng	Chinese
[1,]	FALSE	FALSE	FALSE	FALSE	FALSE
[2,]	FALSE	FALSE	FALSE	FALSE	FALSE
[3,]	FALSE	FALSE	FALSE	FALSE	TRUE
[4,]	FALSE	FALSE	FALSE	FALSE	FALSE
anyNA(score)  # 检测score是否存在缺失值
[1] TRUE
na.omit(score)  # 删除score中存在缺失值的行
student	gender	math	Eng	Chinese
1	A	M	90	88	66
2	B	M	70	78	59
4	D	F	60	98	88
complete.cases(score)  # 检测哪一行存在缺失值，FALSE表明该值所对应的行存在缺失值
[1]  TRUE  TRUE  FALSE  TRUE
score[complete.cases(score), ]  # 删除score中存在缺失值的行
student	gender	math	Eng	Chinese
1	A	M	90	88	66
2	B	M	70	78	59
4	D	F	60	98	88

#代码 3-8
# 日期变量的转换
# 创建字符串的日期值
dates <- c("01/27/2016", "02/27/2016", "01/14/2016", "02/28/2016", "02/01/2016")
# 按照月日年的格式进行转换
(date <- as.Date(dates, "%m/%d/%Y"))

#代码 3-9
# 时间变量的转换
# 创建一个字符型日期时间变量
x <- c("2016-02-08 10:07:52", "2016-08-07 19:33:02")
# 判定是否为字符型变量
> is.character(x)
[1] TRUE
# 对字符串形式的日期时间值按照格式进行转换
as.POSIXlt(x, tz = "", "%Y-%m-%d %H:%M:%S")
[1] "2016-02-08 10:07:52 CST" "2016-08-07 19:33:02 CST"

#代码 3-10
# 时间变量的转换
# 沿用上例的数据
x
[1] "2016-02-08 10:07:52" "2016-08-07 19:33:02" 
# 按年月日 时分秒的格式转换为时间变量
(x <- strptime(x, "%Y-%m-%d %H:%M:%S")) 
[1] "2016-02-08 10:07:52 CST" "2016-08-07 19:33:02 CST"

#代码 3-11
# 转化日期时间变量为字符串
# 使用上例的结果
x
[1] "2016-02-08 10:07:52 CST" "2016-08-07 19:33:02 CST"
# 输出的格式转换成format指定的格式
strftime(x, format = "%Y/%m/%d")  
[1] "2016/02/08" "2016/08/07"

#代码 3-12
# 使用format()函数转换为字符串
# 使用和上例的同样的数据
x
[1] "2016-02-08 10:07:52 CST" "2016-08-07 19:33:02 CST"
# 输出的格式转换成format定义的格式
format(x,"%d/%m/%Y")
[1] "08/02/2016" "07/08/2016"

#代码 3-13
# 使用sort函数排序
sort(score$math)  # 对score的math列按照从小到大排列
[1] 60  70  80  90
sort(score$math, decreasing=TRUE)  # 对score的math列按照从大到小排列
[1] 90  80  70  60
sort(score$Chinese, na.last=TRUE)  # 对score的Chinese列按照从小到大排列，并且把缺失值放在最后
[1] 59  66  88  NA

#代码 3-14
# 使用rank函数排序
x <- c(3, 4, 2, 5, 5, 3, 8, 9)
rank(x)  # 求出x的秩
[1] 2.5  4.0  1.0  5.5  5.5  2.5  7.0  8.0
rank(x, ties.method = "first")  # 求x的秩，ties.method="first"
[1] 2  4  1  5  6  3  7  8
rank(x, ties.method = "random")  # 求x的秩，ties.method="random" 
[1] 2  4  1  5  6  3  7  8
rank(x, ties.method = "max")  # 求x的秩，ties.method="max"
[1] 3  4  1  6  6  3  7  8

#代码 3-15
# 使用order函数排序
order(score$math)  # 对score$math升序排列，返回的值表示对应值在原向量中的位置。
[1] 4 2 3 1
score[order(score$math), ]
student	gender	math	Eng	
Chinese
4	D	
M	60	98	88
2	B	M	70	78	
9
3	C	F	80	69	NA
1	D	M	90	88	6
score[order(-score$math), ]  # 输出排序结果
student	g
nder	math	Eng	Chinese
1	A	M	90	88	66
3	C	F	80	69	NA
2	B	M	70	78	59
4	D	F	60	98	88

#代码 3-16
# 数据框编辑
# 创建示例数据框
data.iris <- data.frame(Sepal.Length = c(5.1, 4.9, 4.7, 4.6), Sepal.Width = c(3.5, 3.0, 3.2, 3.1), 
                        Petal.Length = c(1.4, 1.4, 1.3, 1.5), Pe.tal.Width = rep(0.2, 4))
data.iris
Sepal.Length  Sepal.Width  Petal.Length  Pe.tal.Width
1          5.1         3.5          1.4          0.2
2          4.9         3.0          1.4          0.2
3          4.7         3.2          1.3          0.2
4          4.6         3.1          1.5          0.2
# 增加新的样本数据
(data.iris <- rbind(data.iris, list(5.0, 3.6, 1.4, 0.2)))
Sepal.Length  Sepal.Width  Petal.Length  Pe.tal.Width
1          5.1         3.5          1.4          0.2
2          4.9         3.0          1.4          0.2
3          4.7         3.2          1.3          0.2
4          4.6         3.1          1.5          0.2
5          5.0         3.6          1.4          0.2
# 增加数据集的新属性变量
(data.iris <- cbind(data.iris, Species = rep("setosa", 5)))
Sepal.Length  Sepal.Width  Petal.Length  Pe.tal.Width  Species
1          5.1         3.5          1.4          0.2  setosa
2          4.9         3.0          1.4          0.2  setosa
3          4.7         3.2          1.3          0.2  setosa
4          4.6         3.1          1.5          0.2  setosa
5          5.0         3.6          1.4          0.2  setosa


