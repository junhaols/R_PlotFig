rm(list=ls())
source('~/data/Project/LJHProject/CommonCode/R/R_PlotFig/LJH_Draw_8_LI_Cases.R')

x1  <- seq(1, 10, 0.1)-12
x2<- x1
e1 <- pnorm(91,mean=0,sd=0.01);
y1=(-0.5)*(x1+e1);
y2=2*(x1+e1)+20;# 不变



x2<-x1


data1=cbind(x1,x2,y1,y2)
data2=data.frame(data1)
 # 1
Draw_8_LI_Case(data2)
# 22
