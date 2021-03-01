rm(list = ls())
source('~/data/Project/LJHProject/CommonCode/R/R_PlotFig/LJH_PlotFig.R')
#x1=runif(100,1,10)
#x2=runif(100,1,20)
#s_fitScatter(x1,x2,'x1','x2','tets','/Users/Junhao/data/Project/LJHProject/CommonCode/R/R_PlotFig/test','test7.png')
#s_fitScatter(x1,x2,'x1','x2','tets')

x1  <- seq(1, 10, 0.1)
e1 <- pnorm(91,mean=0,sd=0.01);
y1=1*(x1+e1);
y2=2*(x1+e1);
data1=cbind(x1,y1,y2)
data2=data.frame(data1)

x3=1.5*x1+0.5
#s_fitScatter(x1,x2,'x1','x2','tets')
s_fitScatter2(x1,y1,x3,y2,'x','y','test','/Users/Junhao/data/Project/LJHProject/CommonCode/R/R_PlotFig/test','test8.png')

# ggplot(data2,aes(x=x1)) +
# geom_line(aes(y = y1), color = "darkred") +
# geom_line(aes(y = y2), color="steelblue", linetype="twodash")
gcf=ggplot(data2,aes(x=x1)) +
geom_point(shape=21,fill='black',size=0.8) +
  #geom_smooth就是绘制拟合曲线，lm 是线性，公式是y=a*x，se 表示是否设置置信区间
geom_smooth(method = lm,formula = y ~ x,se=FALSE,colour='red',size=0.8)+theme(plot.title = element_text(hjust = 0.5)) #middle
gcf1=gcf+xlab('xlabel')+ylab('ylabel')+ggtitle('head_title')+stat_cor(mapping = aes(x,y),method = 'pearson')

##


ggplot(data2) + 
  geom_jitter(aes(x1,y1), colour="blue") + geom_smooth(aes(x1,y1), method=lm, se=FALSE) +
  geom_jitter(aes(x1,y2), colour="green") + geom_smooth(aes(x1,y2), method=lm, se=FALSE) +
  labs(x = "Percentage cover (%)", y = "Number of individuals (N)")



# ggplot(economics, aes(x=date)) + 
# geom_line(aes(y = psavert), color = "darkred") + 
# geom_line(aes(y = uempmed), color="steelblue", linetype="twodash")