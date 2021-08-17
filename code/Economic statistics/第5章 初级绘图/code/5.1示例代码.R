#代码 5-1
hist(cars$speed)

#代码 5-2
barplot(VADeaths, beside = TRUE)

#代码 5-3
percent <- colSums(VADeaths)*100/sum(VADeaths)
pie(percent,labels = paste0(colnames(VADeaths),'\n',round(percent,2),'%'))

#代码 5-4
par(mfrow = c(1,2))  # 同一画布显示下面两个箱线图
boxplot(iris[1:4], main = '单独的箱线图')
boxplot(Sepal.Length ~ Species, data = iris, main = '组间比较的箱线图')
par(mfrow = c(1,1))

#代码 5-5
plot(cars[, 1], cars[, 2])  # > plot(cars)  # 效果同上

#代码 5-6
plot(iris[,1:4]) 

#代码 5-7
pairs(iris[,1:4])
pairs(~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data = iris)  # 效果同上

#代码 5-8
library(corrgram) 
corrgram(mtcars, order=TRUE, upper.panel=panel.ellipse, main="Correlogram of mtcars intercorrelations")  # 相关图，主对角线上方绘制置信椭圆和平滑拟合曲线，主对角线下方绘制阴影
corrgram(mtcars, order=TRUE, upper.panel=panel.pts, lower.panel=panel.pie, main="Correlogram of mtcars intercorrelations")  # 相关图，主对角线上方绘制散点图，主对角线下方绘制饼图
corrgram(mtcars, order=TRUE, upper.panel=panel.conf, lower.panel=panel.cor, main="Correlogram of mtcars intercorrelations")  # 相关图，主对角线上方绘制置信区间，主对角线下方绘制相关系数

#代码 5-9
library(sm)      # 加载sm包
sm.density.compare(mtcars$wt, factor(mtcars$cyl))     # 绘制核密度图

#代码 5-10
library(vioplot)      # 加载vioplot包
attach(mtcars)
par(mfrow = c(2, 1))
vioplot(wt[cyl==4], wt[cyl==6], wt[cyl==8],  border="black", col = "light green", rectCol = "blue", horizontal = TRUE)  # 绘制小提琴图
title(main = '小提琴图')  # 添加标题
boxplot(wt~cyl, main = '箱线图', horizontal=TRUE, pars=list(boxwex=0.1), border="blue")  # 绘制箱线图
par(mfrow = c(1, 1))

#代码 5-11
qqnorm(wt)     #正态分布QQ图
qqline(wt)      #QQ线
qqplot(qt(ppoints(length(wt)), df = 5), wt,xlab = "Theoretical Quantiles", ylab = "Sample Quantiles", main = "Q-Q plot for t dsn")       #t分布QQ图
qqline(wt)      #QQ线


#代码 5-12
stars(mtcars, draw.segments = TRUE)

#代码 5-13
library(KernSmooth)  # 计算二维核密度的包
mtcars1 = data.frame(wt, mpg)
est = bkde2D(mtcars1, apply(mtcars1, 2, dpik))     # 计算二维核密度
contour(est$x1, est$x2, est$fhat, nlevels = 15, col = "darkgreen", xlab = "wt", ylab = "mpg")  # 画等高图
points(mtcars1)  # 添加散点
