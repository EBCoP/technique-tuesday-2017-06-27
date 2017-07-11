## Removed by Andy.
##setwd("P:/Bureau/Temp/Tabassum/concatenating-files-challenge")

## OK - I confess - I never got this one work. I think there are one or two things missing from the script.

foo <- function(nameFile){ 
  
    file_list <- list.files(path="../data", pattern=".csv", full.names=)
  
  dataset1 <- read.csv(file_list[1])
  dataset1$rownum<-paste0("1_",as.numeric(rownames(dataset1)))
  
  dataset1$datanum<-1
  
  for (i in 2:length(file_list)){
    
    
    temp_dataset<-read.csv(file_list[i])
    temp_dataset$datanum<-i
    temp_dataset$rownum<-paste0(i,"_",as.numeric(rownames(temp_dataset)))
    dataset1<-rbind(dataset1, temp_dataset)
    rm(temp_dataset)
    
  } 
 
 write.csv(dataset1,file="combined.csv")
  save(dataset1,file="combine")
  return(dataset1)
  

 
}
   foo(x)
   load("combine")
     
   summarySE <- function(data=NULL, measurevar, groupvars=NULL, na.rm=FALSE,
                         conf.interval=.95, .drop=TRUE) {
     library(plyr)
     
     # New version of length which can handle NA's: if na.rm==T, don't count them
     length2 <- function (x, na.rm=FALSE) {
       if (na.rm) sum(!is.na(x))
       else       length(x)
     }
     
     # This does the summary. For each group's data frame, return a vector with
     # N, mean, and sd
     datac <- ddply(data, groupvars, .drop=.drop,
                    .fun = function(xx, col) {
                      c(N    = length2(xx[[col]], na.rm=na.rm),
                        mean = mean   (xx[[col]], na.rm=na.rm),
                        sd   = sd     (xx[[col]], na.rm=na.rm)
                      )
                    },
                    measurevar
     )
     
     # Rename the "mean" column    
     datac <- rename(datac, c("mean" = measurevar))
     
     datac$se <- datac$sd / sqrt(datac$N)  # Calculate standard error of the mean
     
     # Confidence interval multiplier for standard error
     # Calculate t-statistic for confidence interval: 
     # e.g., if conf.interval is .95, use .975 (above/below), and use df=N-1
     ciMult <- qt(conf.interval/2 + .5, datac$N-1)
     datac$ci <- datac$se * ciMult
     
     return(datac)
   }
   tgc1 <- summarySE(dataset1, measurevar="first_col", groupvars=("datanum"))
   tgc2 <- summarySE(dataset1, measurevar="second_col", groupvars=("datanum"))
   tgc3 <- summarySE(dataset1, measurevar="third_col", groupvars=("datanum"))
  
   
   global_x<-summarySE(dataset1,measurevar="first_col")
   global_x$datanum<-21
   global_1<-cbind(global_x[7],global_x[2:6])
   tgc1_1<-rbind(tgc1,global_1)
   
   global_y<-summarySE(dataset1,measurevar="second_col")
   global_y$datanum<-21
   global_2<-cbind(global_y[7],global_y[2:6])
   tgc2_2<-rbind(tgc2,global_2)
   
   global_z<-summarySE(dataset1,measurevar="third_col")
   global_z$datanum<-21
   global_3<-cbind(global_z[7],global_z[2:6])
   tgc3_3<-rbind(tgc3,global_3)
   
   
   ggplot(tgc1_1, aes(x=datanum, y=first_col) ) +
     geom_errorbar(aes(ymin=first_col-ci,ymax=first_col+ci), width=.1) +
     geom_point(color="blue")+ggtitle("First_col Mean and CI") + geom_point(data=tgc1_1[21, ], aes(x=datanum, y=first_col), colour="red", size=5)
   ggplot(tgc2_2, aes(x=datanum, y=second_col) ) +
     geom_errorbar(aes(ymin=second_col-ci,ymax=second_col+ci), width=.1) +
     geom_point(color="blue")+ggtitle("Second_col Mean and CI")+
     geom_point(data=tgc2_2[21, ], aes(x=datanum, y=second_col), colour="red", size=5)
     
   ggplot(tgc3_3, aes(x=datanum, y=third_col) ) +
     geom_errorbar(aes(ymin=third_col-ci,ymax=third_col+ci), width=.1) +
     geom_point()+ggtitle("Third_col Mean and CI")+geom_point(data=tgc3_3[21, ], aes(x=datanum, y=third_col), colour="red", size=5)
   
   
   
   write.csv(tgc1_1,file="summ_col_1.csv")
   write.csv(tgc2_2,file="summ_col_2.csv") 
   write.csv(tgc3_3,file="summ_col_3.csv")
