# USING A PREMADE FUNCTION

plot_all_genes <- function(timepoint1, timepoint2, xlabels){
  
  for (i in 1:ncol(timepoint1)){
    boxplot(timepoint1[,i], timepoint2[,i], 
            names = xlabels, 
            main = colnames(timepoint1)[i],
            ylab = 'Log2 Expression', 
            col = 'dodgerblue')
    
  }
  
}
