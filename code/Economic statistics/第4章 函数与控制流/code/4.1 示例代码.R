#代码 4-1
abs(-5)  # 绝对值，返回值为5
sqrt(16)  # 平方根，返回值为4
16^(0.5)  # 和sqrt(16)等价，返回值为4
ceiling(3.457)  # 不小于x的最小整数，返回值为4
floor(3.457)  # 不大于x的最大整数，返回值为3
trunc(5.99)  # 向0的方向截取x中的整数部分，返回值为5
trunc(-5.99)  # 向0的方向截取x中的整数部分，返回值为-5
round(3.457, digits = 2)  # 将x舍入为指定位的小数，返回值为3.46
signif(3.457, digits = 2)  # 将x舍入为指定的有效数字位数，返回值为3.5
cos(2)  # 余弦，返回值为-0.4161468
acos(-0.4161468)  # 反余弦，返回值为2
sinh(2)  # 双曲正弦，返回值为3.62686
asinh(3.62686)  # 反双曲正弦，返回值为2
log(10,base = 10)  # 对10取以10为底的对数，返回值为1
log(10)  # 对10取自然对数，返回值为2.302585
log10(10)  # 对10取常用对数，返回值为1
exp(2.3026)  # 指数函数，返回值为10

#代码 4-2
x <- c(1, 2, 3, 4)
mean(x)  # 平均数，返回值为2.5
median(x)  # 中位数，返回值为2.5
sd(x)  # 标准差，返回值为1.29
var(x)  # 方差，返回值为1.67
mad(x)  # 绝对中位差，返回值为1.48
quantile(x, c(.3, .84))  # 求x的30%和48%分位点，返回值为1.90和3.52
range(x)  # 求值域，返回值为c(1, 4)
sum(x)  # 求和，返回值为10
min(x)  # 求最小值，返回值为1
max(x)  # 求最大值，返回值为4
scale(x, center = TRUE, scale = FALSE)  # 中心化
scale(x, center = TRUE, scale = TRUE)  # 标准化
diff(x)  # 滞后差分

# 求时间间隔
date <- c("2016-01-27", "2016-02-27")
difftime(date[2], date[1], units = "days")  # 时间间隔为天
difftime(date[2], date[1], units = "weeks")  # 时间间隔为周

#代码 4-3
# 在区间[-3,3]上绘制标准正态曲线
x <- pretty(c(-3, 3), 30)
y <- dnorm(x)
plot(x, y, type = "l", xlab = "Normal Deviate", ylab = "Density", yaxs = "i")

# 求位于z=1.96左侧的标准正态曲线下方的面积
pnorm(1.96)

# 求均值为500，标准差为100的正态分布的0.9分位点值
qnorm(.9, mean = 500, sd = 100)

# 生成50个均值为50，标准差为10的正态随机数
rnorm(50, mean = 50, sd = 10)

#代码 4-4
# 随机生成正态分布数据并求其密度和分位数
date <- rnorm(20)  # 生成20个标准正态分布的数据
date
dnorm(date)  # 计算date中各个值对应标准正态分布的密度
pnorm(date)  # 计算date中各个值对应标准正态分布的分位数
pnorm(0.9, mean = 0, sd = 1)  # 计算标准正态分布的0.9分位数

#代码 4-5
使用apply函数计算矩阵的均值
x <- matrix(1:20, ncol = 4)
x
apply(x, 1, mean)  # 计算各行的均值
apply(x, 2, mean)  # 计算各列的均值

#代码 4-6
# 使用lapply函数计算各子列表的均值
x <- list(a = 1:5, b = exp(0:3))
x
lapply(x, mean)  # 对列表x的每一个元素计算均值

#代码 4-7
# 使用sapply函数处理列表的字符串连接
list <- list(c("a", "b", "c"), c("A", "B", "C"))
list

# 列表list中的元素与数字1~3连接，输出结果为矩阵
sapply(list, paste, 1:3, simplify = TRUE)

# 列表list中的元素与数字1~3连接，输出结果为列表
sapply(list, paste, 1:3, simplify = FALSE)

#代码 4-8
# 使用tapply函数进行分组统计
height <- c(174, 165, 180, 171, 160)
sex <- c("F", "F", "M", "F", "M")
tapply(height, sex, mean)  # 计算不同sex对应的height的均值

#代码 4-9
# 使用mapply函数重复生成列表
# 重复生成列表list(x=1:2),重复次数times=1:3,结果为一个列表
mapply(rep, times = 1:3, MoreArgs = list(x = 1:2))
# 重复生成列表list(x=1:2),重复次数times=c(2,2),结果为一个矩阵
mapply(rep, times = c(2, 2), MoreArgs = list(x = 1:2))
