#代码 5-30
#图一：将图形按2行3列摆放，参数mfrow分割页面
mfrow1=par(mfrow=c(2,3))
for(i in 1:6){
  plot(c(1:i),main=paste("I'm image:",i))
}
#图二：mar参数设置图形边距
mar1 = par(mar=c(4,5,2,3))
for(i in 1:6){
  plot(c(1:i),main=paste("I'm image:",i))
}
par(mar1)       ##去除par()函数mar参数的设置mar1
#图三：oma参数设置外边界宽度
oma1 = par(oma = c(4,5,2,3))
for(i in 1:6){
  plot(c(1:i),main=paste("I'm image:",i))
}
par(oma1)     ##去除par()函数oma参数的设置oma1
#图四：mgp参数控制坐标轴位置
mgp1 = par(mgp = c(1,2,3))
for(i in 1:6){
  plot(c(1:i),main=paste("I'm image:",i))
}
par(mgp1)     ##去除par()函数mgp参数的设置mgp1
par(mfrow1)   ##去除par()函数mfrow参数的设置mfrow1


#代码 5-31
mat<-matrix(c(1,1,2,3,3,4,4,5,5,6), nrow = 2, byrow = TRUE)
layout(mat)
for(i in 1:6){
  plot(c(1:i),main=paste("I'm image:",i))
}
