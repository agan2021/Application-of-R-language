#操作题(1)
x<-c(1,3,5,6,8)   #创建一个对象x
is.numeric(x)    #判断x是否是数值型数据
x1<-as.logical(x)  #将对象转化为逻辑型数据
is.logical(x1)  #判断是否为逻辑型数据

#操作题(2)
setwd("./第2章 数据对象与数据读写/02-习题程序/code")                    #设置工作科技目录
x<-c(11,23,25,46,38,30,59,47,21,67)     #创建向量x
x[c(2,4)]                           #查询向量中第2，第4位置的元素
which(x>35& x<=50)                #查询x中大于35小于等于50元素的位置
#创建一个重复因子序列
Species<-rep(c("setosa","versicolor","virginica"),each=2,length.out=5)   a<-matrix(x,5,2)                    #创建一个元素为x的矩阵
#将矩阵写入数据框data_iris并更改列名
data_iris<-data.frame(Sepal.Length=a[,1],Sepal.Width=a[,2])
write.table(data_iris," ./data_iris.txt")  #将数据框保存为txt文件
#将数据框转化为向量y
b<-as.matrix(data_iris)
y<-as.vector(b)
is.vector(y)   #判断是否为向量

#操作题(3)
read.table("./第2章 数据对象与数据读写/02-习题程序/code/data_iris.txt")  #读取txt文件data_iris
data_iris1<-data.frame(iris[6:10,])     #将数据集iris中第6到10行写入数据框
#将数据框data_iris和data_iris1合并为data_iris2
data_iris2<-cbind(data_iris,data_iris1)   
#将数据框data_iris2保存为csv文件
write.csv(data_iris2,"./第2章 数据对象与数据读写/02-习题程序/code/data_iris2.csv")

