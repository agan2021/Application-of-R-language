#代码 3-17
# 选取向量中的变量
vector <- c(1, 2, 3, 4)
vector[1]  # 选取第一个元素
vector[c(1:3)]  # 选取前3个元素

# 选取数据框中的变量
data.iris <- data.frame(Sepal.Length = c(5.1, 4.9, 4.7, 4.6), 
                        Sepal.Width = c(3.5, 3.0, 3.2, 3.1), 
                        Petal.Length = c(1.4, 1.4, 1.3, 1.5), 
                        Pe.tal.Width = rep(0.2, 4))
newdata <- data.iris[, c(3:4)]

# 输出结果如下
> vector <- c(1, 2, 3, 4)
> vector[1]  # 选取第一个元素
[1] 1
> vector[c(1:3)]  # 选取前3个元素
[1] 1 2 3
> data.iris
Sepal.Length Sepal.Width Petal.Length Pe.tal.Width
1          5.1         3.5          1.4          0.2
2          4.9         3.0          1.4          0.2
3          4.7         3.2          1.3          0.2
4          4.6         3.1          1.5          0.2
> newdata
Petal.Length Pe.tal.Width
1          1.4          0.2
2          1.4          0.2
3          1.3          0.2
4          1.5          0.2

#代码 3-18
# 删除向量中的变量
vector <- c(1, 2, 3, 4)
vector[-1]  # 删除第一个元素
vector[-c(1:3)]  # 删除前3个元素

# 删除数据框中的变量
data.iris <- data.frame(Sepal.Length = c(5.1, 4.9, 4.7, 4.6), 
                        Sepal.Width = c(3.5, 3.0, 3.2, 3.1), 
                        Petal.Length = c(1.4, 1.4, 1.3, 1.5), 
                        Pe.tal.Width = rep(0.2, 4))
newdata <- data.iris[, -c(3:4)]

# 输出结果如下
> vector <- c(1, 2, 3, 4)
> vector[-1]  # 删除第一个元素
[1] 2 3 4
> vector[-c(1:3)]  # 删除前3个元素
[1] 4
> data.iris
Sepal.Length Sepal.Width Petal.Length Pe.tal.Width
1          5.1         3.5          1.4          0.2
2          4.9         3.0          1.4          0.2
3          4.7         3.2          1.3          0.2
4          4.6         3.1          1.5          0.2
> newdata
Sepal.Length Sepal.Width
1          5.1         3.5
2          4.9         3.0
3          4.7         3.2
4          4.6         3.1

#代码 3-19
# 使用subset函数选取数据
df1 <- data.frame(name = c("aa", "bb", "cc"), age = c(20, 29, 30), 
                  sex = c("f", "m", "f"))
selectresult1 <- subset(df1, name == "aa", select = c(age, sex))
selectresult2 <- subset(df1, name == "aa" & sex == "f", select = c(age, sex))
df1
selectresult1
selectresult2

# 输出结果如下
> df1
name age sex
1   aa  20   f
2   bb  29   m
3   cc  30   f
> selectresult1
age sex
1  20   f
> selectresult2
age sex
1  20   f

#代码 3-20
# 有放回的简单随机抽样
library(sampling)
LETTERS
(s <- srswr(10, 26))  # 在26个字母中有放回地抽取10个样本
(obs <- ((1:26)[s != 0]) )  # 提取被抽到的样本单元的编号
(n <- s[s != 0])  # 提取每个样本被抽到的次数
(obs <- rep(obs, times = n))  # 被抽到的样本单元的编号按照抽到的次数重复。
(sample <- LETTERS[obs])

# 输出结果如下
> LETTERS
[1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U"
[22] "V" "W" "X" "Y" "Z"
> (s <- srswr(10, 26))  # 在26个字母中有放回地抽取10个样本
[1] 1 0 1 0 1 1 0 0 0 0 0 0 0 0 1 2 1 0 0 1 0 0 0 0 0 1
> (obs <- ((1:26)[s != 0]) )  # 提取被抽到的样本单元的编号
[1]  1  3  5  6 15 16 17 20 26
> (n <- s[s != 0])  # 提取每个样本被抽到的次数
[1] 1 1 1 1 1 2 1 1 1
> (obs <- rep(obs, times = n))  # 被抽到的样本单元的编号按照抽到的次数重复。
[1]  1  3  5  6 15 16 16 17 20 26
> (sample <- LETTERS[obs])
[1] "A" "C" "E" "F" "O" "P" "P" "Q" "T" "Z"

#代码 3-21
# 不放回的简单随机抽样
library(sampling)
LETTERS
(s <- srswor(10, 26))  # 在26个样本中无放回地抽取10个样本
(obs <- ((1:26)[s != 0]) )  # 提取被抽到的样本单元的编号
(sample <- LETTERS[obs])

# 输出结果如下
> LETTERS
[1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U"
[22] "V" "W" "X" "Y" "Z"
> (s <- srswor(10, 26))  # 在26个样本中无放回地抽取10个样本
[1] 0 1 1 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0 1 1 1 0 0
> (obs <- ((1:26)[s != 0]) )  # 提取被抽到的样本单元的编号
[1]  2  3  4  6 12 14 20 22 23 24
> (sample <- LETTERS[obs])
[1] "B" "C" "D" "F" "L" "N" "T" "V" "W" "X"

#代码 3-22
# 使用sample函数抽样
LETTERS
sample(LETTERS, 5, replace = TRUE)  # 放回简单随机抽样
sample(LETTERS, 5, replace = FALSE)  # 不放回简单随机抽样

# 生成随机分组结果，第一组和第二组比例为7:3
n <- sample(2, 26, replace = TRUE, prob = c(0.7, 0.3)) 
n
(sample1 <- LETTERS[n == 1]) #第一组
(sample2 <- LETTERS[n == 2]) #第二组

# 输出结果如下
> LETTERS
[1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U"
[22] "V" "W" "X" "Y" "Z"
> sample(LETTERS, 5, replace = TRUE)  # 放回简单随机抽样
[1] "H" "L" "P" "S" "S"
> sample(LETTERS, 5, replace = FALSE)  # 不放回简单随机抽样
[1] "O" "C" "I" "F" "D"
> #生成随机分组结果，第一组和第二组比例为7:3
  > n <- sample(2, 26, replace = TRUE, prob = c(0.7, 0.3))
> n
[1] 1 2 1 1 1 1 1 1 2 1 1 1 1 2 2 1 1 2 1 1 1 1 2 2 1 1
> (sample1 <- LETTERS[n == 1]) #第一组
[1] "A" "C" "D" "E" "F" "G" "H" "J" "K" "L" "M" "P" "Q" "S" "T" "U" "V" "Y" "Z"
> (sample2 <- LETTERS[n == 2]) #第二组
[1] "B" "I" "N" "O" "R" "W" "X"

