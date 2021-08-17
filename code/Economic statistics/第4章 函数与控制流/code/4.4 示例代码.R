#代码 4-17
# 自编函数计算标准差
sd2 <- function(x) {
  # 异常处理，当输入的数据不是数值类型时报错
  if (!is.numeric(x)) {
    stop("the input data must be numeric!\n")
  }
  # 异常处理，当仅输入一个数据时，告知不能计算标准差
  if (length(x) == 1) {
    stop("can not comput sd for one number,a unmeric vector required.\n")
  }
  # 初始化一个临时向量，保存循环的结果
  # 求每个值与平均值的平方
  x2 <- c()
  # 求该向量的平均值
  meanx <- mean(x)
  # 循环
  for (i in 1:length(x)) {
    xn <- x[i] - meanx
    x2[i] <- xn^2
  }
  # 求总平方和
  sum2 <- sum(x2)
  # 计算标准差
  sd <- sqrt(sum2 / (length(x) - 1))
  # 返回值
  return(sd)
}

# 程序的检验
sd2(c(2, 6, 4, 9, 12))  # 正常的情况
sd2(3)  # 一个数值的情况
sd2(c("1", "2"))  # 输入数据不为数值类型时


#代码 4-18
# 使用switch结构的用户自编函数
mydate <- function(type = "long") {
  switch(type,
         long = format(Sys.time(), "%A %B %d %Y"),
         short = format(Sys.time(), "%m-%d-%y"),
         cat(type, "is not a recognized type\n")
  )
}

# 程序的检验
mydate("long")
mydate("short")
mydate()
mydate("medium")

#代码 4-19
POM <-function(x,y)
{
  m1 <- ncol(x)
  n <- nrow(y)
  if(m1!=n)
  {
    print('error dimension is not siutable')
    return(0)
  }
  m <- nrow(x)
  n1 <- ncol(y)
  s <-matrix(0,m,n1)
  for(i in 1:m)
    for(j in 1:n1)
      s[i,j] <- sum(x[i,]*y[,j])
  return(s)
}
#矩阵s的行数等于矩阵x的行数，s的列数等于y的列数。
#乘积s的第m行第n列的元素等于矩阵x的第m行的元素与矩阵y的第n列对应元素乘积之和。
x <-matrix(c(1:6),2,3,byrow = TRUE)
y <-matrix(c(1:6),3,2,byrow = FALSE)
POM(x,y)
