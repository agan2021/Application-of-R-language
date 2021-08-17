#操作题(1)
x <- list(a = 1:5, b = exp(0:3))
lapply(x, max)
lapply(x, min)
lapply(x, median)

#操作题(2)
#在区间[-5,5]上绘制标准正态曲线
x <- pretty(c(-5,5), 50)
y <- dnorm(x)##密度函数
plot(x, y, type = 'l', xlab = 'Normal Deviate', ylab = 'Density', yaxs = 'i')
#位于z=1.96左侧的标准正态曲线下方的面积
pnorm(1.96)

#操作题（3）
x <- sample(0:100, 1)#随机产生一个0-100的成绩
if(x>=90){
  grade <- '成绩等级：A'
}else if(x>=80){
  grade <- '成绩等级：B'
}else if(x>=70){
  grade <- '成绩等级：C'
}else if(x>=60){
  grade <- '成绩等级：D'
}else{
  grade <- '成绩等级：E'
}
grade

#操作题（4）
x <- 101:200
y <- matrix(nrow = 200, ncol = 100)
count <- 0
c <- NULL
for(i in 1:100){
  for(j in 1:200){
    y[j,i] <- x[i] %% j
  }
  if(length(which(y[,i]==0))<=2){
    count <- count + 1
    c[count] <- i
  }
}
count#计数
x[c]#所有素数

#操作题（5）
POM <-function(x,y)
{
  maxer <- function(x.)
  {
    print(max(x.))
  }
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
  maxer(s)
  return(s)
}
#矩阵s的行数等于矩阵x的行数，s的列数等于y的列数。
#乘积s的第m行第n列的元素等于矩阵x的第m行的元素与矩阵y的第n列对应元素乘积之和。
x <-matrix(c(1:6),2,3,byrow = TRUE)#按行
y <-matrix(c(1:6),3,2,byrow = FALSE)#按列
POM(x,y)
