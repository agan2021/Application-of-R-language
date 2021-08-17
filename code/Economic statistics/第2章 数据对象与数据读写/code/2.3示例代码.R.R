#代码 2-23
##键盘输入
#创建一个指定模式但不含数据的变量
mydata<-data.frame(age=numeric(0),gender=character(0),weight=numeric(0))
#键盘输入变量
mydata<-edit(mydata)
#另外一种键盘输入的方法
fix(mydata)


#代码 2-24
##使用xlsx包读取xls文件
install.packages("xlsx")     #安装xlsx包
library(xlsx)              #加载xlsx包
file<-"E:/test/missing_data.xls" 
excel<-read.xlsx(file,1)     #使用read.clsx函数读取Excel表格
View(excel)              #查看是否读取成功
##使用RODBC读取xls文件
#安装RODBC包
install.packages("RODBC")
#加载RODBC包
library(RODBC)
#建立RODBC连接对象至Excel文件，并将连接赋予一个对象，myfile.xls为文件路径
channel<-odbcConnectExcel("E:/test/missing_data.xls ")   
#读取工作簿中的工作表至一个数据框，mysheet为要读取的工作表名
mydataframe<-sqlFetch(channel,"mysheet")  
odbcClose(channel)                     #关闭RODBC连接


#代码 2-25
#安装RODBC包
install.packages("RODBC") 
library(RODBC)

#代码 2-26
##访问SQL数据库示例程序
#查看内存使用及清理R工作空间中的内存变量
gc();rm(list=ls())
install.packages("RODBC")  #安装RODBC包
library(RODBC)           #载入RODBC包
#通过一个数据源名称（mydsn）和用户名（user）以及密码（rply，如果没有设置，可以直接忽略）打开了一个ODBC数据库连接
mycon<-odbcConnect("mydsn",uid="user",pwd="rply")
#将R自带的“USArrests”表写进数据库里
data(USArrests)
#将数据流保存，这时打开SQL Server就可以看到新建的USArrests表
sqlSave(mycon, USArrests,rownames="state",append=TRUE)
#清除USArrests变量
rm(USArrests)
#输出USArrests表中的内容
sqlFetch(mycon, "USArrests" ,rownames="state")
#对USArrests表执行了SQL语句select，并将结果输出
sqlQuery(mycon,"select * from USArrests")
#删除USArrests表
sqlDrop(channel,"USArrests")
#关闭连接
close(mycon)

#代码 2-27
##XML包抓取网络表格数据
# readHTMLtable()函数
library(XML)
strurl <- 'http://sports.163.com/zc/'
tables <- readHTMLTable(strurl,header = FALSE,stringsAsFactors = FALSE)
# 解决中文乱码问题的方法：将数据导出到本地的txt文件，再重新导入即可：
table_sub <- tables[[1]]
write.table(table_sub,"table_sub.txt",row.names=F)
read.table("table_sub.txt",encoding = 'UTF-8',header = T)

