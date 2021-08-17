#代码 5-14
colors()[1:20]  #查看前20种颜色

#代码5-15
par(mfrow = c(length(colors())%/%60 + 1, 1))  # 画布分割
par(mar=c(0.1,0.1,0.1,0.1), xaxs = "i", yaxs = "i")
for(i in 1:(length(colors())%/%60 + 1)){
  barplot(rep(1,60), col=colors()[((i-1)*60+1):(i*60)], border = colors()[((i - 1)*60 + 1):(i*60)], axes=FALSE)
  box()  # 加边框
}

#代码 5-16
palette()            #返回当前的调色板设置，此时为默认值
palette(colors()[1:10])    #重新设置调色板为colors()的前10种颜色
palette()               #返回当前的调色板设置，此时为colors()的前10种颜色
palette('default')      #恢复默认的调色板设置

#代码 5-17
plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Species)  # Species为因子型数据,setosa versicolor virginica分别对应数字1，2，3，即等价于col = rep(1:3, each = 50)
plot(iris$Sepal.Length, iris$Sepal.Width, col = rep(palette()[1:3], each = 50))  # 效果同上


#代码 5-18
rgb<-rgb(red=255,green=1:255,blue=0,max=255)
par(mfrow=c(6,1))
par(mar=c(0.1,0.1,2,0.1), xaxs="i", yaxs="i")
barplot(rep(1,255),col= rgb,border=rgb,main="rgb")
barplot(rep(1,100),col=rainbow(100),border=rainbow(100),main="rainbow(100))")
barplot(rep(1,100),col=heat.colors(100),border=heat.colors(100),main="heat.colors(100))")
barplot(rep(1,100),col=terrain.colors(100),border=terrain.colors(100),main="terrain.colors(100))")
barplot(rep(1,100),col=topo.colors(100),border=topo.colors(100),main="topo.colors(100))")
barplot(rep(1,100),col=cm.colors(100),border=cm.colors(100),main="cm.colors(100))")


#代码 5-19
par(mfrow = c(1,3))
library(RColorBrewer)
par(mar=c(0.1,3,0.1,0.1))
display.brewer.all(type="seq")
display.brewer.all(type="div")
display.brewer.all(type="qual")

#代码 5-20
# 左图
library(RColorBrewer)
my_col <- brewer.pal(3, 'RdYlGn') # brewer.pal(n, name),其中n为颜色的数量，name表示颜色组的名称
plot(iris$Sepal.Length, iris$Sepal.Width, col = rep(my_col, each =50))
# 右图
plot(iris$Sepal.Length, iris$Sepal.Width, col = rep(rainbow(3), each = 50))


#代码 5-21
plot(1,col="white",xlim=c(1,8),ylim=c(1,7))  # 绘制空白画布
symbol=c("*","、",".","o","O","0","+","-","|")
#创建循环添加点
for(i in c(0:34)){
  x<-(i %/% 5)*1+1
  y<-6-(i%%5)
  if(i>25){
    points(x,y,pch=symbol[i-25],cex=1.3)
    text(x+0.5,y+0.1,labels=paste("pch=",symbol[i-25]),cex=0.8)
  }else{
    if(sum(c(21:25)==i)>0){ 
      points(x,y,pch=i,bg="red",cex=1.3) # 
    } else {
      points(x,y,pch=i,cex=1.3)
    }
    text(x+0.5,y+0.1,labels=paste("pch=",i),cex=0.8)
  }
}

#代码 5-22
plot(iris$Sepal.Length, iris$Sepal.Width, pch = rep(1:3, each = 50))

#代码 5-23
par(mfrow = c(2, 3))
# 图一：线的样式
data<-matrix(rep(rep(1:7),10),ncol=10,nrow=7)
plot(data[1,],type="l",lty=0,ylim=c(1,8),xlim=c(-1,10),axes=F, main = '线的样式')
text(0,1,labels="lty=0")
for(i in c(2:7)){
  lines(data[i,],lty=i-1)
  text(0,i,labels=paste("lty=",i-1))
}
# 图二：线的宽度
data<-matrix(rep(rep(1:6),10),ncol=10,nrow=6)
plot(data[1,],type="l",lwd=0.5,ylim=c(1,8),xlim=c(-1,10),axes=F,main = '线的宽度')
text(0,1,labels="lwd=0.5")
lines(data[2,],type="l",lwd=0.8);text(0,2,labels="lwd=0.8")
lines(data[3,],type="l",lwd=1);text(0,3,labels="lwd=1")
lines(data[4,],type="l",lwd=1.5);text(0,4,labels="lwd=1.5")
lines(data[5,],type="l",lwd=2);text(0,5,labels="lwd=2")
lines(data[6,],type="l",lwd=4);text(0,6,labels="lwd=4")
# 图三：添加参考线
plot(c(0:10),col="white", main = '添加参考线')  # 绘制空白画布
abline(h=c(2,6,8))  # 添加水平线
abline(v=seq(2,10,2),lty=2,col="blue")  # 添加垂直线
abline(a=2,b=1)  # 添加直线y=2+x
# 图四：添加线段和箭头
plot(c(0:10), col = "white", main = '添加线段和箭头')
segments(2,1,4,8)
arrows(4,0,7,3,angle=30)
arrows(4,2,7,5,angle=60)
# 图五：添加网格线
plot(c(0:10), col = "white", main = '添加网格线')      #空白画布
grid(nx=4,ny=8,lwd=1,lty=2,col="blue")  #添加网格线
# 图六：绘制坐标轴须
set.seed(123)        #种子
x=rnorm(500)       #生成500个标准正态分布的数据
plot(density(x), main = '绘制坐标轴须')     #绘制核密度曲线
rug(x ,col="blue")            #添加坐标轴须

#代码5-24
attach(mtcars)
smpg=(mpg-min(mpg))/(max(mpg)-min(mpg))
plot(wt,smpg,ylab="standardized mpg")
#添加核密度曲线图
lines(density(wt),col="red")
#指向密度曲线的箭头
arrows(1.8,0.05,1.5,0.1,angle=10,cex=0.5)
text(2,0.05,"核密度曲线",cex=0.6)
#添加回归线
abline(lm(smpg~wt),lty=2,col="green")
#指向回归直线的箭头
arrows(2,0.5,2,0.7,angle=10,cex=0.5)
text(2,0.45,"回归线",cex=0.6)
#wt与mpg反向线性相关，添加最大最小值线段表现这种关系
segments(min(wt),max(smpg),max(wt),min(smpg),lty=3,col="blue")
#指向最大最小值线段的箭头
arrows(3,0.8,2.5,0.76,angle=10,cex=0.5)
text(3.3,0.8,"最大最小值线段",cex=0.6)
#添加网格线作为背景
grid(nx=4,ny=5,lty=2,col="grey")


#代码 5-25
par(mfrow = c(2, 2))
# 图一：图形添加标题
plot(c(0:5),col="white",xlab="",ylab="")
title(main=list("主标题",cex=1.5),sub=list("副标题",cex=1.2), xlab="x轴标题",ylab="y轴标题")
# 图二：图形周边添加文本
plot(c(0:5),col="white")
mtext('side=1:下边',side=1,line=2)
mtext('side=2:左边' ,side=2,line=2)
mtext('side=3:上边' ,side=3)
mtext('side=4:右边' ,side=4)
# 图三：字体展示
plot(c(0:5),col="white")
text(2,4,labels="font=1:正常字体（默认）",font=1)
text(3,3,labels="font=2:粗体字体",font=2)
text(4,2,labels="font=3:斜体字体",font=3)
text(5,1,labels="font=4:粗斜体字体",font=4)
# 图四：字体大小展示
plot(c(0:6),col="white",xlim=c(1,8))
text(2,5,labels="cex=0.5:放大0.5倍",cex=0.5)
text(3,4,labels="cex=0.8:放大0.8倍",cex=0.8)
text(4,3,labels="cex=1(默认):正常大小",cex=1)
text(5,2,labels="cex=1.2:放大1.2倍",cex=1.2)
text(6,1,labels="cex=1.5:放大1.5倍",cex=1.5)

#代码 5-26
attach(mtcars)
plot(wt, mpg, xlab = "Weight (1000 lbs)", ylab = "Miles/(US) gallon")  # 绘图，并修改x，y轴的标题
title(main=list("mtcars wt V.S. mpg", cex=1.5))  # 添加标题
text(4.5, 34, labels = 'extracted from the 1974', cex = 1.5)  # 说明数据来源
text(4.5, 32, labels = 'Motor Trend US', font = 3)  # 杂志名称

#代码 5-27
# 设置坐标轴
plot(c(1:12), col="white", xaxt="n", yaxt="n", ann = FALSE)
axis(1, at=1:12, col.axis="red", labels=month.abb)
axis(2, at=seq(1,12,length=10), col.axis="red", labels=1:10, las=2)
axis(3, at=seq(1,12,length=7), col.axis="blue", cex.axis=0.7, tck=-0.01, labels = c("Mon", "Tues", "Wed", "Thu", "Fri", "Sat", "Sun")) 
axis(4, at=seq(1,12,length=11), col.axis="blue", cex.axis=0.7, tck=-0.01, labels=seq(0, 1, 0.1), las=2)

#代码 5-28
#添加图例
local=c("bottomright", "bottom", "bottomleft", "left", "topleft", "top", "topright", "right", "center")
par(mar = c(4,2,4,2), pty='m')
plot(c(0:10), col = "white")
legend(3, 8, "图例在(3,8)")
legend(1, 13, "图例在(11,11)", xpd=T)
for(i in 1:9){
  legend(local[i], paste("图例在", local[i]))
}

#代码 5-29
plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Species, main = list('鸢尾花的花萼长与宽的散点图', cex = 1.5), xlab="花萼长度", ylab="花萼宽度")
grid(nx=8, ny=5, lty=2, col="grey")  # 添加网格线
legend('topright', c('setosa', 'versicolor', 'virginica'), pch=1, col = 1:3)  # 添加图例
lines(c(4.3, 6.5), c(2, 4.5), col ='blue')  # 添加直线
arrows(6, 4 , 6.5 ,4, angle=10, cex=0.5)  # 添加箭头
text(6.9, 4, "左上角全是setosa", cex=0.8)  # 添加文字说明
