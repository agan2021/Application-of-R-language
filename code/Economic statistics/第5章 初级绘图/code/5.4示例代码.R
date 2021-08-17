#代码 5-32
# 图片输出到屏幕
windows()  # 打开图形设备界面，UNIX用X11()
plot(iris)  # 在打开的图形界面绘制散点矩阵图

#代码 5-33
# 保存为jpg格式
jpeg(filenames = 'C:\\Users\\45543\\Desktop\\iris.jpg')  # 保存的路径及文件名称、类型
plot(iris[, 1:4])  # 绘制图形
dev.off()  # 关闭关联

#代码 5-34
# 保存为PDF文件
pdf("colors-bar.pdf", height=120)  # 保存到当前工作目录下
par(mar = c(0, 10, 3, 0)  +0.1, yaxs = "i")
barplot(rep(1, length(colors())), col = rev(colors()), names.arg=rev(colors()),
horiz = T, las = 1, xaxt="n", main = expression("Bars of colors in"~ italic(colors())))
dev.off()
