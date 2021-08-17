#代码 1-3
getwd()
my_iris <- read.csv('.\\iris.csv')   # iris.csv文件不存储在当前工作路径下
## 方法一：读取时输入完整的文件路径
my_iris <- read.csv('C:\\Users\\45543\\Desktop\\iris.csv', row.names = 1)
## 方法二：更改当前工作路径
setwd('C:\\Users\\45543\\Desktop')
my_iris <- read.csv('.\\iris.csv', row.names = 1)

#代码 1-4
tex <- 'Hello, world!'
print(tex)