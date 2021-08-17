#代码 2-1
##查看数据类型
#创建一个数据框，内含3个不同类型的向量，设置参数避免自动转化为因子型
data<-data.frame(c1=c(1,2,-3),c2=1:3,c3=TRUE,c4="mingtian",stringsAsFactors=F)
#使用mode（）函数分别查看4个向量的数据类型
sapply(data,mode)                       
#使用class（）函数分别查看4个向量的数据类型
sapply(data, class)
#使用typeof（）函数分别查看4个向量的数据类型
sapply(data, typeof)

#代码 2-2
##数据类型的判别及转换
x<-c(1,0,3,4)                      #构建一个对象
is.numeric(x)                      #判别是否是数值型数据
x1<-"xiaoming"                    #构建一个对象
is.character(x1)                     #判别是否是字符型数据
x2<-FALSE                        #构建一个对象
is.logical(x2)                       #判别是否是逻辑型数据
x3<-2i                             #构建一个对象
is.complex(x3)                      #判别是否是复数型数据
x4<-as.character(x3)                  #将对象转化为字符型数据
is.character(x4)                      #判断是否转化为字符型数据
x4                                 #查看转化之后的对象
is.na(x)                             #判别是否存在缺失值
x5<-as.logical(x)                     #将对象转化为逻辑型数据
is.logical(x5)                        #判别是否转化为逻辑型数据
x5                                 #查看转化之后的对象


