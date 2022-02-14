# WALKING THROUGH RSTUDIO: 
# console 
# global environment
# scripting space 
# plot and help viewer

# Using R as a calculator 
# addition  + 
5 + 3
# subtraction - 
5 - 3
# multiplication *
5 * 3
# division /
5 / 3

# mod (reminader) %%
5 %% 3

#exponent 
5 ** 3
5 ^3 

#combining terms together (PEMDAS)
5 - 3^2
(5-3) ^ 2

# VARIABLES:
weight_kg <- 55
weight_kg = 55 

#print to console
weight_kg
print(weight_kg)

#weight in pounds
weight_lb = 2.2 * weight_kg
weight_lb

2.2*55

weight_kg  = 100
weight_lb
weight_lb = weight_kg * 2.2
weight_lb

# READING DATA INTO R: 

# To import the file, first we need to tell our computer where the file is. 
# We do that by choosing a working directory, that is, a local directory on our 
# computer containing the files we need. This is very important in R. If we forget 
# this step we’ll get an error message saying that the file does not exist. We 
# can set the working directory using the function setwd.
setwd('~/Box Sync/DFB-2019/')


# LOAD IN LIBRARY 
library(openxlsx) # We need a package to read in an excel sheet. Go over packages 

# READ IN EXCEL FILES <- functions
six_weeks = openxlsx::read.xlsx('log2_expression_6wks.xlsx', sheet = 1)
twenty_four_weeks = openxlsx::read.xlsx('log2_expression_24wks.xlsx', sheet = 1)

# LOOKING AT OUR DATA
head(six_weeks) 
ncol(six_weeks) 
nrow(six_weeks)
dim(six_weeks)
colnames(six_weeks)
rownames(six_weeks)

#reference things in the data frame
#data_frame[row,column]
dim(dat)
six_weeks[1,1]
six_weeks[5,]
six_weeks[,5]
six_weeks[,2]
six_weeks$ACTN2



# Let's make more informatitve row names: MAKE THE FIRST COLUMN ROW NAMES 
row.names(six_weeks) = six_weeks[,1]
six_weeks = six_weeks[,-1] #removing from data frame 

row.names(twenty_four_weeks) = twenty_four_weeks[,1]
twenty_four_weeks = twenty_four_weeks[,-1]

# USING FUNCTIONS
mean(six_weeks$ACTN2)
mean(twenty_four_weeks$ACTN2)

summary(six_weeks$ACTN2)
summary(twenty_four_weeks$ACTN2)


#PLOT 
# can reference by gene 
boxplot(six_weeks[,1], twenty_four_weeks[,1], 
        names = c('6wk', '24wk'), 
        main = colnames(twenty_four_weeks)[1],
        ylab = 'Log2 Expression', 
        col = 'dodgerblue'
)

# or by index 
boxplot(six_weeks[,'ACTN2'], twenty_four_weeks[,'ACTN2'], 
        names = c('6wk', '24wk'), 
        main = colnames(twenty_four_weeks)[1],
        ylab = 'Log2 Expression', 
        col = 'dodgerblue'
)

my_plot <- boxplot(six_weeks[,1], twenty_four_weeks[,1], 
                   names = c('6wk', '24wk'), 
                   main = colnames(twenty_four_weeks)[1],
                   ylab = 'Log2 Expression', 
                   col = 'dodgerblue'
)


# CHALLENGE: 
# Make a boxplot plot for expression of the gene GATA4 at 6 weeks compared to 24 weeks. 
# Bonus: make each box a different color. 


# SAVING YOUR PLOT 
pdf('my_plot.pdf')
#everything in between pdf() and dev.off() gets saved in the pdf 
my_plot
dev.off()

# IF TIME: USING A PRE-MADE FUNCTION TO PLOT ALL THE GENES 
source('plot_all_genes.R') # use source to load in the function 
plot_all_genes(timepoint1 = six_weeks, timepoint2 = twenty_four_weeks, xlabels = c('6wk', '24wk'))

# SAVE ALL PLOTS TO A PDF 
pdf('all_plots.pdf')
plot_all_genes(timepoint1 = six_weeks, timepoint2 = twenty_four_weeks, xlabels = c('6wk', '24wk'))
dev.off()
