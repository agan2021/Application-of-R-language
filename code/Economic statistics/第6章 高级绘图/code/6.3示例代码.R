#代码 6-45
## rCharts包3
install.packages('devtools')
require(devtools)
install_github('ramnathv/rCharts')

#代码 6-46
# 散点图
library(rCharts)
names(iris) = gsub("\\.", "", names(iris))
rPlot(SepalLength ~ SepalWidth | Species, data = iris, color = 'Species', type = 'point')

#代码 6-47
# nPlot
library(rCharts)
hair_eye_male<-subset(as.data.frame(HairEyeColor), Sex == "Male")
hair_eye_male[, 1] <- paste0("Hair", hair_eye_male[, 1])
hair_eye_male[, 2] <- paste0("Eye", hair_eye_male[, 2])
nPlot(Freq ~ Hair, group = "Eye", data = hair_eye_male, type = "multiBarChart")

#代码 6-48
# hplot
a <- hPlot(Pulse ~ Height, data = MASS::survey, type = "bubble", 
           title = "Zoomdemo", subtitle = "bubblechart",size="Age",group="Exer")
a$colors('rgba(223, 83, 83, 0.5)', 'rgba(119, 152, 191, 0.5)', 'rgba(60, 179, 113, 0.5)')
a$chart(zoomType = "xy")
a$exporting(enabled = T)
a

#代码 6-49
# mplot
data(economics, package = 'ggplot2')
dat <- transform(economics, date = as.character(date))
p1 <- mPlot(x = "date", y = list("psavert", "uempmed"), data = dat, type = 'Line', pointSize = 0, lineWidth = 1)
p1

#代码 6-50
p1$set(type = "Area")
p1

#代码 6-51
## googleVis包
# 利用gvisMotionChart函数绘制功能强大的交互图
install.packages('googleVis')
library(googleVis)
M1 <- gvisMotionChart(Fruits, idvar = "Fruit", timevar = "Year")
plot(M1)
print(M1) #查看代码 ，把此代码插入你的网页中即可 
cat(M1$html$chart, file = "m.html") #通过本地打开文件查看可视化效果 

#代码 6-52
## htmlwidgets包
# 利用leaflet函数绘制的交互地图
library(leaflet)
leaflet()%>%
  addTiles()%>%
  addMarkers(lng=174.768,lat=-36.852,popup="ThebirthplaceofR")

#代码 6-53
# 利用dygraphs函数绘制的交互时序图
install.packages('dygraphs')
library(dygraphs)
lungDeaths <- cbind(mdeaths, fdeaths)
dygraph(lungDeaths)

#代码 6-54
# 利用函数plot_ly绘制的交互散点图
library(plotly)
pal <- RColorBrewer::brewer.pal(nlevels(iris$Species), "Set1")
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species,
        colors = pal, mode = "markers")

#代码 6-55
# 由ggplot2转化的交互散点图
p <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, colour = Species))+
  scale_color_brewer(palette = "Set1")+
  geom_point()
ggplotly(p)

#代码 6-56
# 交互数据表格
library(DT)
datatable(iris)

#代码 6-57
# 利用simpleNetwork绘制简单网络图
library(networkD3)
src <- c("A","A","A","A","B","B","C","C","D")
target <- c("B","C","D","J","E","F","G","H","I")
networkData <- data.frame(src, target)
simpleNetwork(networkData, zoom = T)

#代码 6-58
# 利用forceNetwork绘制力导向图
data(MisLinks)
data(MisNodes)
forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Group = "group", opacity = 0.8)

#代码 6-59
## shiny
library(shiny)
shinyUI(fluidPage(
  titlePanel("title panel"),
  sidebarLayout(
    sidebarPanel( "sidebar panel"),
    mainPanel("main panel")
  )
))

#代码 6-60
# 基本的网页界面布局UI代码
library(shiny)
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    x <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
})

#代码 6-61
# 相应的ui.R如下：
library(shiny)
shinyUI(fluidPage(
  titlePanel("Old Faithful Geyser Data"), 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 30)), 
    mainPanel(
      plotOutput("distPlot")))))

#代码 6-62
# 自动生成一个网页展示结果
library(shiny)
runApp("./myapp")

#代码 6-63
# shinyApp执行app
library(shiny)
ui <- fluidPage(
  numericInput(inputId = "n", 
               "Samplesize", value = 25), 
  plotOutput(outputId = "hist")
)
server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$n))
  })
}
shinyApp(ui = ui, server = server)

#代码 6-64
# 得到shinydashboard的基本框架
library(shiny)
library(shinydashboard)
ui <- dashboardPage(
  dashboardHeader(), 
  dashboardSidebar(), 
  dashboardBody()
)
server <- function(input, output) {}
shinyApp(ui, server)
# 用renderPlot()函数将图形赋予输出对象mygraph形式
# server.R #
output$mygraph <- renderPlot({
  graph_function(formula, data = ,...)
})
# ui.R #
plotOutput("mygraph")

#代码 6-65
# 评价线性模型拟合情况可视化
ui <- fluidPage(
  plotOutput("lm.fit")
)
server <- function(input, output) {
  output$lm.fit <- renderPlot({
    fit <- lm(Sepal.Length ~ Sepal.Width, data = iris[, 1:4])
    par(mfrow = c(2, 2), pch = "*", bg = "aliceblue")
    plot(fit)
  })
}
shinyApp(ui = ui, server = server)

#代码 6-66
# nPlot函数绘制的交互柱状图web展示
# server.R #
server <- function(input, output) {
  output$mychart1 <- renderChart({
    hair_eye_male <- subset(as.data.frame(HairEyeColor), Sex == "Male")
    hair_eye_male[, 1] <- paste0("Hair", hair_eye_male[, 1])
    hair_eye_male[, 2] <- paste0("Eye", hair_eye_male[, 2])
    p1 <- nPlot(Freq ~ Hair, group = "Eye", data = hair_eye_male, type = "multiBarChart")
    p1$chart(color = c('brown', 'blue', '#594c26', 'green'))
    p1$addParams(dom = "mychart1")
    return(p1)
  })
}
# ui.R #
ui <- fluidPage(
  showOutput("mychart1", "nvd3")
)
shinyApp(ui = ui, server = server)
