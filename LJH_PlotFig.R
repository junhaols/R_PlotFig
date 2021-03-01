## Functions for plotting

################################################################################
# library
# rm(list = ls())
library(R.matlab)
library(ggplot2)
library(ggpubr)
library(ggpmisc)
################################################################################

## function1:Scatters to plot and fit(linear)
# Inputs
# x,y:Vectors to be fitted.
# xlabel:Strings of x axis.
# ylabel:Strings of y axis.
# head_title:The figure name.
# savepath:The path to save the figure(default:null).
# fig_name:The saveing picture name of the figure(default:null,e,g.,'XXX.png').
##
#The functions should be sourced if used.
# e.g.,source('~/data/Project/LJHProject/CommonCode/R/PlotFig/LJH_PlotFig.R')
##
s_fitScatter<-function(x,y,xlabel,ylabel,head_title,savepath=NULL,fig_name=NULL){
 
  # draw pic
  gcf=ggplot(mapping = aes(x,y)) +
    #geom_point可以设置数据点的类型，颜色以及大小
    geom_point(shape=21,fill='black',size=0.8) +
    #geom_smooth就是绘制拟合曲线，lm 是线性，公式是y=a*x，se 表示是否设置置信区间
    geom_smooth(method = lm,formula = y ~ x,se=FALSE,colour='red',size=0.8)+theme(plot.title = element_text(hjust = 0.5)) #middle
  
  gcf1=gcf+xlab(xlabel)+ylab(ylabel)+ggtitle(head_title)+stat_cor(mapping = aes(x,y),method = 'pearson')
  
  # remove bacground and frames.
  gcf2=gcf1 + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                 panel.background = element_blank(), axis.line = element_line(colour = "black"))
  
  # save pic,optional
 
  if(is.null(fig_name)){
    print('The fig will not be saved.')
    # view the figure
    gcf2
  } else
  {
    print('The fig will be saved.')
    print(savepath)
    pic_name=file.path(savepath,fig_name)
    ggsave(pic_name)
    # view the figure
    gcf2
   }
 }
################################################################################
## function2:
s_fitScatter2<-function(x1,y1,x2,y2,xlabel,ylabel,head_title,savepath=NULL,fig_name=NULL){
  
  data1=cbind(x1,x2,y1,y2)
  data_input=data.frame(data1)
  gcf=ggplot(data_input) + 
    geom_jitter(aes(x1,y1), colour="black",size=0.8) + geom_smooth(aes(x1,y1), method=lm, se=FALSE,color='red',size=0.8) +
    geom_jitter(aes(x2,y2), colour="black",size=0.8) + geom_smooth(aes(x2,y2), method=lm, se=FALSE,color='blue',size=0.8) +
    xlab(xlabel)+ylab(ylabel)+ggtitle(head_title)
  #gcf1=gcf + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                   #panel.background = element_blank(), axis.line = element_line(colour = "black"))
  
  gcf1=gcf+theme_classic() + 
    theme(axis.ticks.length.y = unit(-0.15, 'cm'),
          axis.text.y = element_text(margin = unit(c(0.5, 0.5, 0.5, 0.5), 'cm'))) +  #修改y轴刻度朝内
          theme(axis.line = element_line(arrow = arrow(length = unit(0.5, 'cm'))))  #坐标轴尾端为箭头
  gcf2=gcf1 + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                   panel.background = element_blank(), axis.line = element_line(colour = "black"))+theme(plot.title = element_text(hjust = 0.5))
  
  ## view and save
  if(is.null(fig_name)){
    print('The fig will not be saved.')
    # view the figure
    gcf2
  } else
  {
    print('The fig will be saved.')
    print(savepath)
    pic_name=file.path(savepath,fig_name)
    ggsave(pic_name)
    # view the figure
    gcf2
  }
}      
    
  
## function3:
