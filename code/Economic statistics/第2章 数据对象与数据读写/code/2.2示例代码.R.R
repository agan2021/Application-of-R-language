#代码 2-3
##向量创建
x1<-1:5              #创建数值型向量
x1
x2<-TRUE            #创建逻辑型向量
x2
x3<-"A"              #创建字符型向量
x3

#代码 2-4
##向量创建
x1<-c(1,4,6,3)                     #创建数值型向量                             
x2<-c("o","m","g")                 #创建字符型向量               
x3<-c(TRUE,FALSE,FALSE,TRUE)   #创建逻辑型向量

#代码 2-5
##等差序列的创建
x1<-seq(1,11,by=2)     #给出首项和末项数据以及步长，自动计算长度
x1
x2<-seq(1,-11,length.out = 7) #给出首项和末项以及序列长度，自动计算步长
x2
x3<-seq(4,by=2,length.out = 5)  #给出首项和步长以及序列长度，自动计算末项
x3
x4<-seq(by=3,along.with = x3)   #给出步长以及序列长度与x3相同，默认首项为1
x4
x5<-seq(length.out=5)       #给出序列长度默认首项为1
x5

#代码 2-6
##重复序列的创建
x1<-rep(1:4,3)	#重复序列3次
x1
x2<-rep(1:4,each=2)         #序列中每个元素分别重复2次
x2
x3<-rep(c(3,2),c(2,5))        #按照规则重复序列中的各个元素
x3
x4<-rep(c(3,2),each=2,length.out=3) #序列中各个元素分别重复2次，规定生成序列的长度为3
x4
x5<-rep(c(3,2),each=2,times=3)    #序列中各个元素分别重复2次，整个序列重复3次
x5
x6<-rep(c("因子1","因子2","因子3"),3) #将字符型变量序列重复3次
x6

#代码 2-7
##向量索引
 #下标索引
 ve<-c(1,2,3,4,5,6)              #创建向量
ve[2]                        #查看第二个元素
ve[1:3]                       #查看前三个元素
ve[c(2,4,5)]                   #查看第2,4,5元素的值
ve[-1]                        #查看除第一个元素之外的所有元素
ve[-c(1:3)]                    #查看除了前三个元素之外的所有元素
#逻辑索引
ve[c(TRUE,TRUE,FALSE,FALSE,TRUE,FALSE)]  #通过逻辑序列查看第1,2,5元素
#名称索引
names(ve) <- c("one","two","three","four","five","six")  #给向量中每个元素命名
ve[c("one","two","six")]          #查看名称为"one","two","six"的元素 
#which（）函数索引
which(ve==1)                  #向量中等于1的元素所在的位置
which(ve==1|ve==3)             #向量中等于1或3的元素所在的位置
which(ve>1 & ve<=4)         #满足多重条件的元素所在的位置
which.max(ve)               #最大值所在的位置
which.min(ve)                #最小值所在的位置
#subset（）函数索引
subset(ve,ve>1 & ve<5)         #检索向量中满足条件的元素
subset(ve,c(TRUE,FALSE,TRUE))  #逻辑向量通过重复自动补齐
#match（）函数索引
match(ve,c(1,2))               #match(x,y)该函数返回的是x中的每个元素在y中对应的位置，如果x中的元素在y中不存在，则该位置返回NA 
match(ve,c(1,3,5,6,8,9))         #ve中的2在给定的序列中不存在所以第2个为NA，3在给定的序列位置为2,所以ve中的第3个元素位置为2
c(1,5)%in%ve                #判断向量中是否包含某项数据

#代码 2-8
##向量编辑
x1<-c(1,2,3,4,5)            #创建一个向量
#向量扩展
x2<-c(x1,c(6,7,8))          #增加了3个元素
x2
x3<- append(x2,9)         #在向量最后追加一个新元素9
x3
x4 <- append(x3,c(88,99))    #在向量后追加两个新元素
x4
x5<- append(x4,100,3)       #在第三个元素后追加一个新元素100
x5
#改变元素的值
x1[1] <- 11                # 把向量的第一个元素改为11
x1
x1[1:3] <- 11              #把向量的前三个元素都改为11
x1
x1[1:3] <- c(11,22,33)       #把向量的前三个元素分别改为11,22,33
x1
x1[x1>5] <- 11            #把向量中大于5的元素改为11
x1
#删除元素
x1<-x1[-1]               #把向量的第一个元素删除
x1
x1<-x1[c(2:4)]            #删除除位置为2,3,4之外的元素
x1
x1<-x1[-c(1:2)]            #从向量中删除了位置为1,2的元素
x1

#代码 2-9
##向量排序
#创建3个无序的向量
x<-c(5,6,8,7,4,1,9)
x1<-c("B","A","C")
x2<-c(3,2,NA,1,4,5)
sort(x,decreasing = FALSE)    #数值型数据排序（默认顺序为升序）
sort(x,decreasing=TRUE)
sort(x1)                    #字符型数据排序
sort(x2,na.last = TRUE)       #将缺失值（NA）放置到序列最末尾
rev(x)                      #rev（）函数将向量倒序，即将原向量的元素按位置翻转

#代码 2-10
##创建矩阵
x<-1:6    
diag(x)      #创建对角矩阵
x1<- rep(1, 5)
diag(x1)        #创建单位矩阵
a<-matrix(1:10,ncol=2,nrow=5,byrow=T) #创建一个矩阵，定义矩阵的列数为2，行数为5，按行读取数据
a
b<-matrix(1:10) #创建一个矩阵，定义矩阵的列数为2，行数为5，按列读取数据
dim(b)=c(5,2)
b
#创建一个5行2列，按列读取数据的矩阵，dimnames定义矩阵行列的名称
(c<-matrix(1:10,ncol=2,nrow=5,byrow=F,dimnames=list(c("r1","r2","r3","r4","r5"),c("c1","c2"))))

#代码 2-11
##矩阵索引
#示例矩阵
a<-matrix(1:10,ncol=2,nrow=5,byrow=F,dimnames=list(c("r1","r2","r3","r4","r5"),c("c1","c2")))
a
#根据位置索引
a[3,2]
#根据行和列的名称索引
a["r2","c2"]
#使用一维下标索引
a[1,]            #检索第一行
a[,1]            #检索第一列
#使用数值型向量索引
a[c(3:4),]        #检索第3至第4行


#代码 2-12
##矩阵的编辑
x<-c(1:12)
a<-matrix(x,ncol=4,nrow=3,byrow=F,dimnames=list(c("r1","r2","r3"),c("c1","c2","c3","c4")))
a
#修改单个值
a[1,2] = 12
a["r2","c2"] = 22
a
#修改某一行的数据
a[2,] = c(21,22,23,24)  #将矩阵第2行的数据修改为21,22,23
a["r1" ,] = c(11,13)    #将矩阵名称为r1的行的数据修改为11 ，13向量的数据可以重复以补齐到与矩阵a的列数相同
a
#修改某一列的数据
a[, 1] = c(11,21,31)    #将矩阵的第一列数据修改为11,21，31
a[, "c2"] = c(221:223)  #将矩阵中名为c2的列数据改为221,222，223
a
#删除指定的行或列
a <- a[-2,]            #删除矩阵的第二行
a
a <- a[,-2]                     #删除矩阵的第二列
a
#矩阵合并
a1<-rbind(a,c(11,12,13))         #按行的形式合并
a1
a2<-cbind(a,c(21,22))           #按列的形式合并
a2
a3<-rbind(a,1)                 #按行的形式合并时，循环不足后合并
a3
a4<-cbind(a,1)                 #按列的形式合并时，循环不足后合并
a4

代码2-13
##矩阵的运算
A<-matrix(c(1:9),ncol=3,nrow=3)
B<-matrix(c(9:1),ncol=3,nrow=3)
#四则运算：加减乘除，要求两个矩阵的维数相同，对应各位置的元素做运算
C=2*A+B-B/A
#对矩阵的各列求和
colsums_A=colSums(A)
#对矩阵的各列求均值
colmeans_A=colMeans(A)
#对矩阵的各行求和
rowsums_A=rowSums(A)
#对矩阵的各行求均值
rowmeans_A=rowMeans(A)
#转置运算
trans_A=t(A)      #行列转置
det_A=det(A)     #方阵求解行列式
#矩阵的内积 
crossprod(A,B)
inner_product=t(A)%*%B        #等价于crossprod(A,B)
#矩阵的外积（叉积）
outer(A,B)
cross_product=A%o%B        #等价于outer(A,B)
#矩阵的乘法,要求矩阵A的列数和矩阵B的行数相等
(D=A%*%B)
#矩阵取对角运算及生成对角阵
diag_A=diag(A)       #矩阵取对角
diag(diag_A)         #生成对角阵
#求解逆矩阵，要求矩阵可逆（行列式不为0）
M<-matrix(c(1:8,10),ncol=3,nrow=3)   
inverse_M=solve(M)
#求解矩阵的特征值和特征向量
ev_M=eigen(M)

#代码 2-14
##创建数组
#定义数组各维度的名称
dim1 <- c("A1", "A2")           
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
#创建数组，数组维数为3，各维度下标的最大值为2,3,4
z <- array(1:24, c(2, 3, 4), dimnames=list(dim1, dim2, dim3))
z

#代码 2-15
##数组索引
#示例数组
dim1 <- c("A1", "A2")           
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
#创建数组，数组维数为3，各维度下标的最大值为2,3,4
z <- array(1:24, c(2, 3, 4), dimnames=list(dim1, dim2, dim3))
#根据位置索引
z[2,3,1]
#根据维度名称索引
z["A2","B3","C1"]
#查看数组的维度
dim(z)

#代码 2-16
##创建数据框
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata

#代码 2-17
##数据框索引
#创建数据框
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata
#列索引
patientdata[,1]   #索引第一列
patientdata$age  #按列的名称索引
#行索引
patientdata[1,]    #索引第一行
patientdata[2:4,]  #索引第2至4行
#元素索引
patientdata[2,3]  #索引第2行第3列元素
#subset（）函数索引
subset(patientdata,diabetes=="Type1")  #按条件索引行
#sqldf（）函数索引
library(sqldf)
newdf<-sqldf("select*from patientdata where age==25 ",row.names=T)
newdf

#代码 2-18
##数据框编辑
#创建示例数据框
data_iris<-data.frame(Sepal.Length=c(5.1,4.9,4.7,4.6),Sepal.Width=c(3.5,3.0,3.2,3.1),Petal.Length=c(1.4,1.4,1.3,1.5),Pe.tal.Width=rep(0.2,4))
data_iris
#手动修改
data_irisnew<-edit(data_iris)
fix(data_iris)
#增加新的样本数据
(data_iris<-rbind(data_iris,list(5.0,3.6,1.4,0.2)))
#增加数据集的新属性变量
(data_iris<-cbind(data_iris,Species=rep("setosa",5)))
#数据框的删除
data_iris[,-1]                        #删除第一列
data_iris[-1,]                        #删除第一行
#数据框列名的编辑
names(data_iris)                      #查看数据框的列名   
names(data_iris)[1]="sepal.length"       #将数据框的第一列列名改为sepal.length
names(data_iris)                      #查看修改后数据框的列名  

#代码 2-19
##创建列表
data<-list(a=c(11,22,33,44),b=matrix(1:10,nrow=2),c="one,two,three",d=c(FALSE,TRUE))
#输出整个列表
data
#查看列表的数据结构
summary(data)
data[[3]]  #输出第3个成分
data[["c"]]

#代码 2-20
##列表索引
#示例列表
data<-list(a=c(11,22,33,44),b=matrix(1:10,nrow=2),c="one,two,three",d=c(FALSE,TRUE))
#输出整个列表
data
#列索引
data[[1]]             #索引第一列
data$a                #索引列名称为a的列
data[["a"]]           #索引列名称为a的列
#元素索引
data[[1]][1]          #索引第一列的第一个元素

#代码 2-21
##列表编辑
#示例列表
data<-list(a=c(11,22,33,44),b=matrix(1:10,nrow=2),c="one,two,three",d=c(FALSE,TRUE))
#输出整个列表
data
#删除名称为a的一列
data$a<-NULL
data
#增加名称为e的一列
data1<-c(data,list(e=c(5,6,7)))
data1
#另外一种形式，与上面等价
data2<-c(data,e=list(c(5,6,7)))      
#列表转化为向量
unlist(data1)
#创建一个新列表
data2<-list(1,2,3,4)
data2
#列表合并
c(data1,data2)

#代码 2-22
##数据结构的判别及转换
data1<-c(1,2,3,4)       #构建一个向量
is.vector(data1)        #判断是否是向量
data2<-matrix(1:9,3,3)   #构建一个矩阵
data2
is.matrix(data2)         #判断是否是矩阵
dim1<-c("A1","A2")
dim2<-c("B1","B2","B3")
dim3<-c("c1","c2")
data3<-array(1:12, c(2, 3, 2), dimnames=list(dim1, dim2, dim3))#构建一个数组
is.array(data3)          #判断是否是数组
data4<-data.frame(a=c(1,2),b=c("Happy","you"),c=c(TRUE,FALSE))   #构建一个数据框
is.data.frame(data4)      #判断是否是数据框
data5<-list(a=c(11,22,33,44),b=matrix(1:10,nrow=2),c="one,two,three")   #构建一个列表
is.list(data5)             #判断是否是列表
data6<-as.matrix(data1)   #将向量转化为矩阵
is.matrix(data6)
data6                  #查看转换之后的对象
data9<-as.matrix(data4)   #将数据框转化为向量需要先转化为矩阵再转化为向量
data10<-as.vector(data9)
is.vector(data10)
data10                 #查看转化之后的对象
data11<-unlist(data5)     #将列表转化为向量
is.vector(data11)
data12<-as.matrix(data5)   #将列表转化为矩阵
data12                  #查看转化之后的对象
is.matrix(data12)          #判断是否是矩阵



