library(lattice)
library(ggplot2)
library(grid)
bankloan=read.csv("F:/R/bankloan.csv") 
bankloan$age_group=cut(bankloan$age,breaks=paste0(2:6,0),include.lowest=TRUE)
bankloan$seniority_group=cut(bankloan$seniority,breaks=c(0,1,3,5,10,15,20,30,40),include.lowest=TRUE)
bankloan$education=factor(bankloan$education)
bankloan$debt=bankloan$debt_rate/100*bankloan$income
page=function(x,y)viewport(layout.pos.row = x,layout.pos.col = y)
tbankloan=table(bankloan$education,bankloan$seniority_group,bankloan$age_group,bankloan$default)
function(input, output){
  output$lahie <- renderPlot({
    histogram_ie=histogram(~income|education,data=bankloan,layout=c(1,5),nint=30,type="count")
    densityplot_ie=densityplot(~income,groups=education,data=bankloan,plot.points=FALSE,
                               lty=1:5,col=1:5,key=list(title="education",text=list(levels(bankloan$education)),
                                                        column=2,lines=list(lty=1:5,col=1:5)))
    plot(histogram_ie,position=c(0,0,0.5,1))  
    plot(densityplot_ie,position=c(0.5,0,1,1),newpage=FALSE)
  })
  output$lahia <- renderPlot({
    histogram_ia=histogram(~income|age_group,data=bankloan,layout=c(1,4),nint=30,type="count")
    densityplot_ia=densityplot(~income,groups=age_group,data=bankloan,plot.points=FALSE,
                               lty=1:4,col=1:4,key=list(title="age",text=list(levels(bankloan$age_group)),
                                                        column=2,lines=list(lty=1:4,col=1:4)))
    plot(histogram_ia,position=c(0,0,0.5,1))  
    plot(densityplot_ia,position=c(0.5,0,1,1),newpage=FALSE)
  })
  output$lahis <- renderPlot({
    histogram_is=histogram(~income|seniority_group,data=bankloan,layout=c(1,8),nint=30,type="count")
    densityplot_is=densityplot(~income,groups=seniority_group,data=bankloan,plot.points=FALSE,
                               lty=1:8,col=1:8,key=list(title="seniority",text=list(levels(bankloan$seniority_group)),
                                                        column=2,lines=list(lty=1:8,col=1:8)))
    plot(histogram_is,position=c(0,0,0.5,1))  
    plot(densityplot_is,position=c(0.5,0,1,1),newpage=FALSE)
    
  })
  output$gghie <- renderPlot({
    hist_ie=ggplot(data=bankloan,aes(x=income))+
      geom_histogram(bins=30,fill="#0080ff")+
      facet_grid(education~.)
    density_ie=ggplot(data=bankloan,aes(x=income,colour=education))+
      geom_density()+
      theme(legend.position="top")
    grid.newpage()
    pushViewport(viewport(layout=grid.layout(1,2)))
    print(hist_ie,vp=page(1,1))
    print(density_ie,vp=page(1,2))
  })
  output$gghia<- renderPlot({
    hist_ia=ggplot(data=bankloan,aes(x=income))+
      geom_histogram(bins=30,fill="#0080ff")+
      facet_grid(age_group~.)
    density_ia=ggplot(data=bankloan,aes(x=income,colour=age_group))+
      geom_density()+
      theme(legend.position="top")
    grid.newpage()
    pushViewport(viewport(layout=grid.layout(1,2)))
    print(hist_ia,vp=page(1,1))
    print(density_ia,vp=page(1,2))
  })
  output$gghis <- renderPlot({
    hist_is=ggplot(data=bankloan,aes(x=income))+
      geom_histogram(bins=30,fill="#0080ff")+
      facet_grid(seniority_group~.)
    density_is=ggplot(data=bankloan,aes(x=income,colour=seniority_group))+
      geom_density()+
      theme(legend.position="top")
    grid.newpage()
    pushViewport(viewport(layout=grid.layout(1,2)))
    print(hist_is,vp=page(1,1))
    print(density_is,vp=page(1,2))
  })
  output$lahde <- renderPlot({
    histogram_de=histogram(~debt_rate|education,data=bankloan,layout=c(1,5),nint=30,type="count")
    densityplot_de=densityplot(~debt_rate,groups=education,data=bankloan,plot.points=FALSE,
                               lty=1:5,col=1:5,key=list(title="education",text=list(levels(bankloan$education)),
                                                        column=2,lines=list(lty=1:5,col=1:5)))
    plot(histogram_de,position=c(0,0,0.5,1))  
    plot(densityplot_de,position=c(0.5,0,1,1),newpage=FALSE)
  })
  output$lahda<- renderPlot({
    histogram_da=histogram(~debt_rate|age_group,data=bankloan,layout=c(1,4),nint=30,type="count")
    densityplot_da=densityplot(~debt_rate,groups=age_group,data=bankloan,plot.points=FALSE,
                               lty=1:4,col=1:4,key=list(title="age",text=list(levels(bankloan$age_group)),
                                                        column=2,lines=list(lty=1:4,col=1:4)))
    plot(histogram_da,position=c(0,0,0.5,1))  
    plot(densityplot_da,position=c(0.5,0,1,1),newpage=FALSE)
  })
  output$lahds<- renderPlot({
    histogram_ds=histogram(~debt_rate|seniority_group,data=bankloan,layout=c(1,8),nint=30,type="count")
    densityplot_ds=densityplot(~debt_rate,groups=seniority_group,data=bankloan,plot.points=FALSE,
                               lty=1:8,col=1:8,key=list(title="seniority",text=list(levels(bankloan$seniority_group)),
                                                        column=2,lines=list(lty=1:8,col=1:8)))
    plot(histogram_ds,position=c(0,0,0.5,1))  
    plot(densityplot_ds,position=c(0.5,0,1,1),newpage=FALSE)
  })
  output$gghde <- renderPlot({
    hist_de=ggplot(data=bankloan,aes(x=debt_rate))+
      geom_histogram(bins=30,fill="#0080ff")+
      facet_grid(education~.)
    density_de=ggplot(data=bankloan,aes(x=debt_rate,colour=education))+
      geom_density()+
      theme(legend.position="top")
    grid.newpage()
    pushViewport(viewport(layout=grid.layout(1,2)))
    print(hist_de,vp=page(1,1))
    print(density_de,vp=page(1,2))
    
  })
  output$gghda<- renderPlot({
    hist_da=ggplot(data=bankloan,aes(x=debt_rate))+
      geom_histogram(bins=30,fill="#0080ff")+
      facet_grid(age_group~.)
    density_da=ggplot(data=bankloan,aes(x=debt_rate,colour=age_group))+
      geom_density()+
      theme(legend.position="top")
    grid.newpage()
    pushViewport(viewport(layout=grid.layout(1,2)))
    print(hist_da,vp=page(1,1))
    print(density_da,vp=page(1,2))
    
  })
  output$gghds <- renderPlot({
    hist_ds=ggplot(data=bankloan,aes(x=debt_rate))+
      geom_histogram(bins=30,fill="#0080ff")+
      facet_grid(seniority_group~.)
    density_ds=ggplot(data=bankloan,aes(x=debt_rate,colour=seniority_group))+
      geom_density()+
      theme(legend.position="top")
    grid.newpage()
    pushViewport(viewport(layout=grid.layout(1,2)))
    print(hist_ds,vp=page(1,1))
    print(density_ds,vp=page(1,2))
    
  })
  
  output$lasid <- renderPlot({
    id_e=xyplot(debt~income|education,data=bankloan,layout=c(1,5),
                panel=function(...){panel.lmline(...)
                  panel.xyplot(...)})
    id_a=xyplot(debt~income|age_group,data=bankloan,layout=c(1,4),
                panel=function(...){panel.lmline(...)
                  panel.xyplot(...)})
    id_s=xyplot(debt~income|seniority_group,data=bankloan,layout=c(1,8),
                panel=function(...){panel.lmline(...)
                  panel.xyplot(...)})
    plot(id_e,split=c(1,1,3,1))  
    plot(id_a,split=c(2,1,3,1),newpage=FALSE)
    plot(id_s,split=c(3,1,3,1),newpage=FALSE)
    
  })
  output$ggsid <- renderPlot({
    ggid_e=ggplot(data=bankloan,aes(x=income,y=debt))+
      geom_point(colour="#0080ff")+
      stat_smooth(method=lm,lwd=0.5,se=FALSE)+
      facet_grid(education~.)
    ggid_a=ggplot(data=bankloan,aes(x=income,y=debt))+
      geom_point(colour="#0080ff")+
      stat_smooth(method=lm,lwd=0.5,se=FALSE)+
      facet_grid(age_group~.)
    ggid_s=ggplot(data=bankloan,aes(x=income,y=debt))+
      geom_point(colour="#0080ff")+
      stat_smooth(method=lm,lwd=0.5,se=FALSE)+
      facet_grid(seniority_group~.)
    
    grid.newpage()
    pushViewport(viewport(layout=grid.layout(1,3)))
    print(ggid_e,vp=page(1,1))
    print(ggid_a,vp=page(1,2))
    print(ggid_s,vp=page(1,3))
    
    
  })
  output$lasdeid <- renderPlot({
    glmdei=as.vector(glm(default~income,data=bankloan,family=binomial(link="logit"))$coefficients)
    glmded=as.vector(glm(default~debt_rate,data=bankloan,family=binomial(link="logit"))$coefficients)
    
    paneli=function(x,y){panel.curve(exp(glmdei[1]+glmdei[2]*x)/(1+exp(glmdei[1]+glmdei[2]*x)),col="red",lwd=1,lty=2)
      panel.xyplot(x,y)}
    paneld=function(x,y){panel.curve(exp(glmded[1]+glmded[2]*x)/(1+exp(glmded[1]+glmded[2]*x)),col="red",lwd=1,lty=2)
      panel.xyplot(x,y)}
    glmla_dei=xyplot(default~income,data=bankloan,panel=paneli)
    glmla_ded=xyplot(default~income,data=bankloan,panel=paneld)
    plot(glmla_dei,split=c(1,1,2,1))  
    plot(glmla_ded,split=c(2,1,2,1),newpage=FALSE)
    
    
  })
  
  output$ggsdeid <- renderPlot({
    glmgg_dei=ggplot(data=bankloan,aes(x=income,y=default)) +
      geom_point() + 
      stat_smooth(method=glm,method.args=list(family="binomial"),se=FALSE)
    glmgg_ded=ggplot(data=bankloan,aes(x=debt_rate,y=default)) +
      geom_point() + 
      stat_smooth(method=glm,method.args=list(family="binomial"),se=FALSE)
    grid.newpage()
    pushViewport(viewport(layout=grid.layout(1,2)))
    print(glmgg_dei,vp=page(1,1))
    print(glmgg_ded,vp=page(1,2))
    
    
  })
  output$labde <- renderPlot({
    barchart(tbankloan,auto.key=list(title="default",columns=2))
  })
  output$ggbde <- renderPlot({
    ggplot(bankloan,aes(x=education,fill=factor(default)))+
      geom_bar(position = "stack")+
      facet_grid(age_group~seniority_group)
  })
  
}



