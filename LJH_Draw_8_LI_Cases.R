
##  1 case
library(ggplot2)
Draw_8_LI_Case<-function(data_input){
  gcf=ggplot(data_input) + 
    geom_jitter(aes(x1,y1), colour="black",size=0.8) + geom_smooth(aes(x1,y1), method=lm, se=FALSE,color='red',size=0.8) +
    geom_jitter(aes(x2,y2), colour="black",size=0.8) + geom_smooth(aes(x2,y2), method=lm, se=FALSE,color='blue',size=0.8) +
    labs(x = "<--- Left-lateralization                           Right-lateralization ---> ", y = "Some index")#+scale_y_continuous(limits=c(0, 8))+xlim(-12,12)+ # 从0开始绘图
  # gcf1=gcf + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
  #                     panel.background = element_blank(), axis.line = element_line(colour = "black"))
  
  gcf1=gcf + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                   panel.background = element_blank(), axis.line = element_line(colour = "black"))
  
  gcf2=gcf1+theme_classic() + 
    theme(axis.ticks.length.y = unit(-0.15, 'cm'),
          axis.text.y = element_text(margin = unit(c(0.5, 0.5, 0.5, 0.5), 'cm'))) +  #修改y轴刻度朝内
    theme(axis.line = element_line(arrow = arrow(length = unit(0.5, 'cm'))))  #坐标轴尾端为箭头
  ## adjust axis
  p=gcf2
  
  
  ###
  p<-p+xlim(-12,12)+ylim(0,40)+#geom_hline(yintercept = 0) 
    geom_vline(xintercept = 0)
  
  p
  
}