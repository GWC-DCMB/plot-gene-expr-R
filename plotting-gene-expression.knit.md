---
title: "Plotting gene expression in R"
author: |
  | Kelly Sovacool, Audrey Drotos, and Stephanie Thiede
  | Adapted from [U of Michigan Carpentries](umcarpentries.org/intro-curriculum-r/)
date: "version May 26, 2022"
output:
  html_document:
    toc: yes
    toc_depth: 3
    toc_float:
      collapsed: no
  pdf_document:
    toc: yes
    toc_depth: '3'
editor_options:
  chunk_output_type: console
urlcolor: blue
---



# Intro R

## RStudio

In this workshop, we will plot gene expression levels from an RNAseq dataset.
To do this, we'll need two things: data and a platform to analyze the data.

We could try to use a spreadsheet program like Microsoft Excel or Google sheets that have limited access, less flexibility, and don't easily allow for things that are critical to ["reproducible" research](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003285), like easily sharing the steps used to explore and make changes to the original data.

Instead, we'll use a programming language to test our hypothesis. Today we will use R, but we could have also used Python for the same reasons we chose R (and we teach workshops for both languages). Both R and Python are freely available, the instructions you use to do the analysis are easily shared, and by using reproducible practices, it's straightforward to add more data or to change settings like colors or the size of a plotting symbol.

To run R, all you really need is the R program, which is available for computers running the Windows, Mac OS X, or Linux operating systems. 
To make your life in R easier, there is a great (and free!) program called RStudio. As we work today, we'll use features that are available in RStudio for writing and running code, managing projects, installing packages, getting help, and much more. It is important to remember that R and RStudio are different, but complementary programs. You need R to use RStudio.

To get started, we'll spend a little time getting familiar with the RStudio environment and setting it up to suit your tastes. When you start RStudio, you'll have three panels.

<img src="https://github.com/GWC-DCMB/plot-gene-expr-R/blob/main/images/initial_rstudio.png?raw=true" width="700"/>

On the left you'll have a panel with three tabs - Console, Terminal, and Jobs. The Console tab is what running R from the command line looks like. This is where you can enter R code. Try typing in `2+2` at the prompt (>). In the upper right panel are tabs indicating the Environment, History, and a few other things. If you click on the History tab, you'll see the command you ran at the R prompt.

<img src="https://github.com/GWC-DCMB/plot-gene-expr-R/blob/main/images/history.png?raw=true" width="700"/>

In the lower right panel are tabs for Files, Plots, Packages, Help, and Viewer. You used the Packages tab to install tidyverse.

We'll spend more time in each of these tabs as we go through the workshop, so we won't spend a lot of time discussing them now.

You might want to alter the appearance of your RStudio window. The default appearance has a white background with black text. If you go to the Tools menu at the top of your screen, you'll see a "Global options" menu at the bottom of the drop down; select that.

<img src="https://github.com/GWC-DCMB/plot-gene-expr-R/blob/main/images/global_options.png?raw=true" width="600"/>

From there you will see the ability to alter numerous things about RStudio. Under the Appearances tab you can select the theme you like most. As you can see there's a lot in Global options that you can set to improve your experience in RStudio. Most of these settings are a matter of personal preference.

However, you can update settings to help you to insure the reproducibility of your code. In the General tab, none of the selectors in the R Sessions, Workspace, and History should be selected. In addition, the toggle next to "Save workspace to .RData on exit" should be set to never. These setting will help ensure that things you worked on previously don't carry over between sessions.

<img src="https://github.com/GWC-DCMB/plot-gene-expr-R/blob/main/images/general_options.png?raw=true" width="600"/>

Let's get going on our analysis!

One of the helpful features in RStudio is the ability to create a project. A project is a special directory that contains all of the code and data that you will need to run an analysis.

At the top of your screen you'll see the "File" menu. Select that menu and then the menu for "New Project...".

<img src="https://github.com/GWC-DCMB/plot-gene-expr-R/blob/main/images/new_project_menu.png?raw=true" width="600"/>

When the smaller window opens, select "New Directory" and then the "Browse" button in the next window.

<img src="https://github.com/GWC-DCMB/plot-gene-expr-R/blob/main/images/existing_directory.png?raw=true" width="600"/>

<img src="https://github.com/GWC-DCMB/plot-gene-expr-R/blob/main/images/browse.png?raw=true" width="600"/>

Creat a new project called "heart-gene-expr-2022" and click the "Open" button.

<img src="https://github.com/GWC-DCMB/plot-gene-expr-R/blob/main/images/navigate_to_project.png?raw=true" width="600"/>

Then click the "Create Project" button.

<img src="https://github.com/GWC-DCMB/plot-gene-expr-R/blob/main/images/create_project.png?raw=true" width="600"/>

Did you notice anything change?

In the lower right corner of your RStudio session, you should notice that your
Files tab is now your project directory. You'll also see a file called
heart-gene-expr-2022.Rproj in that directory.

From now on, you should start RStudio by double clicking on that file. 
This will make sure you are in the correct directory when you run your analysis.

<img src="https://github.com/GWC-DCMB/plot-gene-expr-R/blob/main/images/files_with_rproj.png?raw=true" width="600"/>

We'd like to create a file where we can keep track of our R code.

Back in the "File" menu, you'll see the first option is "New File". Selecting "New File" opens another menu to the right and the first option is "R Script". Select "R Script".

Now we have a fourth panel in the upper left corner of RStudio that includes an **Editor** tab with an untitled R Script. Let's save this file as `gene_expression.R` in our project directory.

We will be entering R code into the **Editor** tab to run in our **Console** panel.

On line 1 of `gene_expression.R`, type `2+2`.

With your cursor on the line with the `2+2`, click the button that says <kbd>Run</kbd>. You should be able to see that `2+2` was run in the Console.

As you write more code, you can highlight multiple lines and then click <kbd>Run</kbd> to run all of the lines you have selected.

## R as a calculator

You can use R like a calculator to add (`+`), multiply (`*`), divide (`/`), and more!


```r
# Using R as a calculator
# addition  +
5 + 3
```

```
## [1] 8
```

```r
# subtraction -
5 - 3
```

```
## [1] 2
```

```r
# multiplication *
5 * 3
```

```
## [1] 15
```

```r
# division /
5 / 3
```

```
## [1] 1.666667
```

```r
# mod (remainder) %%
5 %% 3
```

```
## [1] 2
```

```r
#exponent
5 ** 3
```

```
## [1] 125
```

```r
5 ^3
```

```
## [1] 125
```

```r
#combining terms together (PEMDAS)
5 - 3^2
```

```
## [1] -4
```

```r
(5-3) ^ 2
```

```
## [1] 4
```

## Variables and Types

- character
- logical
- double
- integer


```r
name <- "Kelly"
favorite_color <- "green"
height_inches <- 64
likes_cats <- TRUE
num_plants <- 14L
```

You can think of variables as labelled boxes where you store your belongings.

The `<-` symbol is the **assignment operator**. It assigns values generated or typed on the right to objects on the left. An alternative symbol that you might see used as an **assignment operator** is the `=` but it is clearer to only use `<-` for assignment. We use this symbol so often that RStudio has a keyboard short cut for it: <kbd>Alt</kbd>+<kbd>-</kbd> on Windows, and <kbd>Option</kbd>+<kbd>-</kbd> on Mac.

If you're not sure of the type of a variable, 
you can find out with the `typeof()` function.


```r
typeof(name)
```

```
## [1] "character"
```

```r
typeof(favorite_color)
```

```
## [1] "character"
```

```r
typeof(height_inches)
```

```
## [1] "double"
```

```r
typeof(likes_cats)
```

```
## [1] "logical"
```


> #### Comments
> Sometimes you may want to write comments in your code to help you remember
> what your code is doing, but you don't want R to think these comments are a part
> of the code you want to evaluate. That's where **comments** come in! Anything
> after a `#` symbol in your code will be ignored by R. For example, let's say we
> wanted to make a note of what each of the functions we just used do:
> 
> ```r
>  Sys.Date()  # outputs the current date
> ```
> 
> ```
> ## [1] "2022-05-26"
> ```
> 
> ```r
>  getwd()     # outputs our current working directory (folder)
> ```
> 
> ```
> ## [1] "/Users/kelly/projects/gwc/plot-gene-expr-R"
> ```
> 
> ```r
>  sum(5, 6)   # adds numbers
> ```
> 
> ```
> ## [1] 11
> ```

> #### Assigning values to objects
> Try to assign values to some objects and observe each object after you have assigned a new value. What do you notice?
>
> 
> ```r
> name <- "Ben"
> name
> height <- 72
> height
> name <- "Jerry"
> name
> ```
>
> > #### Solution
> > When we assign a value to an object, the object stores that value so we can access it later. However, if we store a new value in an object we have already created, it replaces the old value. The `height` object does not change, because we never assign it a new value.

> #### Guidelines on naming objects
> - You want your object names to be explicit and not too long.
> - They cannot start with a number (2x is not valid, but x2 is).
> - R is case sensitive, so for example, weight_kg is different from Weight_kg.
> - You cannot use spaces in the name.
> - There are some names that cannot be used because they are the names of fundamental functions in R (e.g., if, else, for; see [here](https://stat.ethz.ch/R-manual/R-devel/library/base/html/Reserved.html) for a complete list). If in doubt, check the help to see if the name is already in use (`?function_name`).
> - It is recommended to use nouns for object names and verbs for function names.
> - Be consistent in the styling of your code, such as where you put spaces, how you name objects, etc. Using a consistent coding style makes your code clearer to read for your future self and your collaborators. One popular style guide can be found through the [tidyverse](https://style.tidyverse.org/).

The power of variables is that you can re-use them later!


```r
cm_per_inch <- 2.54
height_cm <- height_inches * cm_per_inch
height_cm
```

```
## [1] 162.56
```

```r
height_cm / cm_per_inch
```

```
## [1] 64
```

The above variables hold a single value. What if you need multiple values?


```r
dial_numbers <- c(1, 2, 3)
dial_numbers2 <- 1:3
typeof(dial_numbers)
```

```
## [1] "double"
```

```r
fan_settings <- c('low', 'medium', 'high')
typeof(fan_settings)
```

```
## [1] "character"
```

```r
fan_settings <- factor(c('low', 'high', 'medium', 'high', 'medium'), levels = c('low', 'medium', 'high'))
```


## Error messages

Sometimes we make a mistake when writing code, and the code isn't able to run.
In that case, the code will give us an error message.

An error tells us, "there's something wrong with your code or your data and R didn't do what you asked". 
A warning tells us, "you might want to know about this issue, but R still did what you asked". 
You need to fix any errors that arise in order for your code to work.
Warnings, are probably best to resolve or at least understand why they are coming up.

> ### Exercise: error messages
>
> How can you fix the error messages in these next lines of code?
> 
> 
> ```r
> heihgt_cm
> ```
> 
> ```
> ## Error in eval(expr, envir, enclos): object 'heihgt_cm' not found
> ```
> 
> ```r
> 2 + "three"
> ```
> 
> ```
> ## Error in 2 + "three": non-numeric argument to binary operator
> ```
> 
> #### Solution
> 
> 
> ```r
> height_cm
> ```
> 
> ```
> ## [1] 162.56
> ```
> 
> ```r
> 2 + 3
> ```
> 
> ```
> ## [1] 5
> ```

## Functions

Earlier, the `typeof()` function took the variable we provided and told us the 
`type` that the variable belonged to.
A function is a way to re-use code, either written by you or by someone else.
Functions make it easier to write code because you don't have to re-invent the 
wheel for certain tasks.

> ### Viewing function documentation
>
> Each function has a help page that documents what arguments the function
> expects and what value it will return. You can bring up the help page a few
> different ways. If you have typed the function name in the **Editor** windows,
> you can put your cursor on the function name and press <kbd>F1</kbd> to open
> help page in the **Help** viewer in the lower right corner of RStudio. You can
> also type `?` followed by the function name in the console.
>
> For example, try running `?typeof`. A help page should pop up with
> information about what the function is used for and how to use it, as well as
> useful examples of the function in action. As you can see, the first
> **argument** of `type` is the variable name.
>

Whenever using a funciton, you type the name of the function followed immediately
by parentheses. Any arguments, or inputs, go between the parentheses.

Do all functions need arguments? Let's test some other functions:


```r
  Sys.Date()
```

```
## [1] "2022-05-26"
```

```r
  getwd()
```

```
## [1] "/Users/kelly/projects/gwc/plot-gene-expr-R"
```

While some functions don't need any arguments, in other
functions we may want to use multiple arguments. When we're using multiple
arguments, we separate the arguments with commas. For example, we can use the
`sum()` function to add numbers together:


```r
sum(5, 6)
```

```
## [1] 11
```

> #### Learning more about functions
> Look up the function `round`. What does it do? What will you get as output for the following lines of code?
>
> 
> ```r
> round(3.1415)
> round(3.1415,3)
> ```
>
> > #### Solution
> > `round` rounds a number. By default, it rounds it to zero digits (in our example above, to 3). If you give it a second number, it rounds it to that number of digits (in our example above, to 3.142)


> #### Position of the arguments in functions
>
> Which of the following lines of code will give you an output of 3.14? For the one(s) that don't give you 3.14, what do they give you?
>
> 
> ```r
> round(x = 3.1415)
> round(x = 3.1415, digits = 2)
> round(digits = 2, x = 3.1415)
> round(2, 3.1415)
> ```
>
> > #### Solution
> > The 2nd and 3rd lines will give you the right answer because the arguments are named, and when you use names the order doesn't matter. The 1st line will give you 3 because the default number of digits is 0. Then 4th line will give you 2 because, since you didn't name the arguments, x=2 and digits=3.1415.

Sometimes it is helpful - or even necessary - to include the argument name, but often we can skip the argument name, if the argument values are passed in a certain order. If all this function stuff sounds confusing, don't worry! We'll see a bunch of examples as we go that will make things clearer.


## Packages

So far, all of the functions we have used are part of base R. 
When you install R, these functions are included by default.
However, anyone can write code and share it with other people by putting them in packages.
A package is a collection of code that is intended to be shared and re-used.
Sometimes you need to do something that isn't included in base R, or in a 
different way than the way it is implemented in base R.

Let's load our first package with `library(tidyverse)`.

Go ahead and run that line in the **Console** by clicking the <kbd>Run</kbd> button on the top right of the **Editor** tab and choosing <kbd>Run Selected Lines</kbd>. This loads a set of useful functions and sample data that makes it easier for us to do complex analyses and create professional visualizations in R.


```r
#install.packages('tidyverse')
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
```

```
## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
## ✔ readr   2.1.2     ✔ forcats 0.5.1
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

> #### What's with all those messages???
>
> When you loaded the `tidyverse` package, you probably got a message like the
> one we got above. Don't panic! These messages are just giving you more
> information about what happened when you loaded `tidyverse`. The `tidyverse` is
> actually a collection of several different packages, so the first section of the
> message tells us what packages were installed when we loaded `tidyverse` (these
> include `ggplot2`, `dyplr`, and `tidyr`, which we will use a lot!
>
> The second section of messages gives a list of "conflicts." Sometimes, the
> same function name will be used in two different packages, and R has to decide
> which function to use. For example, our message says that:
>
> ~~~
> dplyr::filter() masks stats::filter()
> ~~~
>
> This means that two different packages (`dplyr` from `tidyverse` and `stats`
> from base R) have a function named `filter()`. By default, R uses the function
> that was most recently loaded, so if we try using the `filter()` function after
> loading `tidyverse`, we will be using the `filter()` function > from `dplyr()`.
> You can use double colons (`::`) to specify which package's version of the 
> function you want to use. This syntax follows the pattern `package::function()`.


> #### The tidyverse vs Base R
> If you've used R before, you may have learned commands that are different than the ones we will be using during this workshop. We will be focusing on functions from the [tidyverse](https://www.tidyverse.org/). The "tidyverse" is a collection of R packages that have been designed to work well together and offer many convenient features that do not come with a fresh install of R (aka "base R"). These packages are very popular and have a lot of developer support including many staff members from RStudio. These functions generally help you to write code that is easier to read and maintain. We believe learning these tools will help you become more productive more quickly.


# Data frames

The variable types we discussed above are useful for simple variables, but
what if you want to store attributes about lots of different things, like patient samples? 
For that we use data frames. Just about anything that you can store as rows and columns, 
like in an Excel spreadsheet, are a great use for data frames. 
Let's find out how to read in a dataset as a data frame.

## load



```r
# READING DATA INTO R
six_weeks <- read_csv('https://raw.githubusercontent.com/GWC-DCMB/plot-gene-expr-R/main/data/log2_expression_6wks.csv')
```

```
## Rows: 48 Columns: 19
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (1): Sample_Num
## dbl (18): ACTN2, COL1A1, COL1A2, COL3A1, COL5A1, COL5A2, GATA4, MYH6, MYH7, ...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
twenty_four_weeks <- read_csv('https://raw.githubusercontent.com/GWC-DCMB/plot-gene-expr-R/main/data/log2_expression_24wks.csv')
```

```
## Rows: 88 Columns: 19
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (1): Sample_Num
## dbl (18): ACTN2, COL1A1, COL1A2, COL3A1, COL5A1, COL5A2, GATA4, MYH6, MYH7, ...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

`read_csv` gave us lots of useful information about the data frames we just loaded. Take a look at the column names and their types.


> ##### The dataset is curated from this paper:
>
> Cui Y _et al._ 2019. Single-Cell Transcriptome Analysis Maps the Developmental Track of the Human Heart. 
> Cell Reports 26:1934-1950.e5.
> https://doi.org/10.1016/j.celrep.2019.01.079

## view

If you want to take a peak at just the first 10 rows of the data frame, you can do so with
`head`, or to peak at the last 10 rows using `tail()`,or look at the whole data frame interactively with `View`:


```r
# LOOKING AT OUR DATA
head(six_weeks)
head(twenty_four_weeks)
tail(six_weeks)
tail(twenty_four_weeks)
View(six_weeks)
View(twenty_four_weeks)
```


```r
ncol(six_weeks)
```

```
## [1] 19
```

```r
nrow(six_weeks)
```

```
## [1] 48
```

```r
dim(six_weeks)
```

```
## [1] 48 19
```

```r
colnames(six_weeks)
```

```
##  [1] "Sample_Num" "ACTN2"      "COL1A1"     "COL1A2"     "COL3A1"    
##  [6] "COL5A1"     "COL5A2"     "GATA4"      "MYH6"       "MYH7"      
## [11] "MYL2"       "MYL3"       "MYL4"       "MYL6"       "NOTCH1"    
## [16] "NOTCH2"     "NPPA"       "NPPB"       "SIRT1"
```

```r
rownames(six_weeks)
```

```
##  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14" "15"
## [16] "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30"
## [31] "31" "32" "33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43" "44" "45"
## [46] "46" "47" "48"
```

```r
#reference things in the data frame
#data_frame[row,column]
dim(six_weeks)
```

```
## [1] 48 19
```

```r
six_weeks[1,1]
```

```
## # A tibble: 1 × 1
##   Sample_Num
##   <chr>     
## 1 Sample1
```

```r
six_weeks[5,]
```

```
## # A tibble: 1 × 19
##   Sample_Num ACTN2 COL1A1 COL1A2 COL3A1 COL5A1 COL5A2 GATA4  MYH6  MYH7  MYL2
##   <chr>      <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl>
## 1 Sample5        0   1.20   7.99   9.58   5.22   3.33  4.44     0  4.68  1.20
## # … with 8 more variables: MYL3 <dbl>, MYL4 <dbl>, MYL6 <dbl>, NOTCH1 <dbl>,
## #   NOTCH2 <dbl>, NPPA <dbl>, NPPB <dbl>, SIRT1 <dbl>
```

```r
six_weeks[,5]
```

```
## # A tibble: 48 × 1
##    COL3A1
##     <dbl>
##  1   8.33
##  2   9.11
##  3   8.12
##  4   8.89
##  5   9.58
##  6   4.29
##  7   8.32
##  8   3.93
##  9   2.77
## 10   7.95
## # … with 38 more rows
```

```r
six_weeks[,2]
```

```
## # A tibble: 48 × 1
##    ACTN2
##    <dbl>
##  1 0    
##  2 0    
##  3 0.642
##  4 0    
##  5 0    
##  6 4.20 
##  7 0    
##  8 5.69 
##  9 0    
## 10 0    
## # … with 38 more rows
```

```r
six_weeks$ACTN2
```

```
##  [1] 0.000000 0.000000 0.641546 0.000000 0.000000 4.204141 0.000000 5.692176
##  [9] 0.000000 0.000000 0.000000 0.000000 1.328262 0.000000 0.000000 0.000000
## [17] 3.200536 3.242603 0.000000 0.000000 7.427522 3.292340 7.691709 0.000000
## [25] 0.000000 7.614025 0.000000 5.111449 0.000000 0.000000 0.000000 5.914421
## [33] 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
## [41] 0.000000 0.708408 5.755208 0.000000 4.578093 0.000000 0.000000 0.000000
```

## explore


```r
# USING FUNCTIONS
mean(six_weeks$ACTN2)
```

```
## [1] 1.383384
```

```r
mean(twenty_four_weeks$ACTN2)
```

```
## [1] 1.543963
```

```r
summary(six_weeks$ACTN2)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   0.000   0.000   0.000   1.383   1.796   7.692
```

```r
summary(twenty_four_weeks$ACTN2)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   0.000   0.000   0.000   1.544   3.734   7.554
```

# Data manipulation

Data comes in many shapes and sizes, and one way we classify data is either "wide" or "long." Data that is "long" has one row per observation. These data are in a wide format. We have one row for each patient sample and each column is a different gene. 
However, to make our data easier to work with, we'll want to convert it to a long format.
Instead of having each gene be a different column, we'll create a new column for the gene names and a new column for the expression level. 
The `tidyr` package contains the functions `pivot_wider` and `pivot_longer` that make it easy to switch between the two formats. The `tidyr` package is included in the `tidyverse` package so we don't need to do anything to load it.

## pivot


```r
# pivot longer
dat_long_6wks <- six_weeks %>%
    pivot_longer(-Sample_Num, names_to = "gene", values_to = '6')
dat_long_6wks
```

```
## # A tibble: 864 × 3
##    Sample_Num gene     `6`
##    <chr>      <chr>  <dbl>
##  1 Sample1    ACTN2  0    
##  2 Sample1    COL1A1 3.38 
##  3 Sample1    COL1A2 6.29 
##  4 Sample1    COL3A1 8.33 
##  5 Sample1    COL5A1 3.98 
##  6 Sample1    COL5A2 4.46 
##  7 Sample1    GATA4  4.64 
##  8 Sample1    MYH6   0    
##  9 Sample1    MYH7   3.42 
## 10 Sample1    MYL2   0.621
## # … with 854 more rows
```

```r
dat_long_24wks <- twenty_four_weeks %>%
    pivot_longer(-Sample_Num, names_to = "gene", values_to = '24')
dat_long_24wks
```

```
## # A tibble: 1,584 × 3
##    Sample_Num gene    `24`
##    <chr>      <chr>  <dbl>
##  1 Sample1    ACTN2   0   
##  2 Sample1    COL1A1  4.98
##  3 Sample1    COL1A2  5.42
##  4 Sample1    COL3A1  4.33
##  5 Sample1    COL5A1  0   
##  6 Sample1    COL5A2  0   
##  7 Sample1    GATA4   0   
##  8 Sample1    MYH6    0   
##  9 Sample1    MYH7    4.98
## 10 Sample1    MYL2    6.20
## # … with 1,574 more rows
```

## join

Now that our two data frames are in a long format, we're ready to join them 
together to make one bigger data frame.
The dplyr package has a number of tools for joining data frames together depending on what we want to do with the rows of the data of countries that are not represented in both data frames. 

`?join`

We have a few options here:

> The mutating joins add columns from y to x, matching rows based on the keys:
>  - inner_join(): includes all rows in x and y.
>  - left_join(): includes all rows in x.
>  - right_join(): includes all rows in y.
>  - full_join(): includes all rows in x or y.


In an "inner join", the new data frame only has those rows where the same key is found in both data frames. 
A "full join" uses all the rows in both data frames, even when the key is not found in both.

<img src="https://github.com/BIGslu/2022_ASM_Microbe_RNAseq/blob/main/2_tidyverse/images/r-data-analysis/join-inner.png?raw=true" width="400"/>

Let's use a full join on our dataset:


```r
# join
dat_joined <- full_join(dat_long_6wks, dat_long_24wks, by = c('Sample_Num', 'gene'))
dat_joined
```

```
## # A tibble: 1,584 × 4
##    Sample_Num gene     `6`  `24`
##    <chr>      <chr>  <dbl> <dbl>
##  1 Sample1    ACTN2  0      0   
##  2 Sample1    COL1A1 3.38   4.98
##  3 Sample1    COL1A2 6.29   5.42
##  4 Sample1    COL3A1 8.33   4.33
##  5 Sample1    COL5A1 3.98   0   
##  6 Sample1    COL5A2 4.46   0   
##  7 Sample1    GATA4  4.64   0   
##  8 Sample1    MYH6   0      0   
##  9 Sample1    MYH7   3.42   4.98
## 10 Sample1    MYL2   0.621  6.20
## # … with 1,574 more rows
```

This is looking pretty tidy. But still, it could be tidier! 
Let's use pivot longer again so we'll have a column for the number of weeks.


```r
# pivot longer again
dat_joined_long <- dat_joined %>% pivot_longer(c('6', '24'),
                                               names_to = 'weeks',
                                               values_to = 'log2_expr')
dat_joined_long
```

```
## # A tibble: 3,168 × 4
##    Sample_Num gene   weeks log2_expr
##    <chr>      <chr>  <chr>     <dbl>
##  1 Sample1    ACTN2  6          0   
##  2 Sample1    ACTN2  24         0   
##  3 Sample1    COL1A1 6          3.38
##  4 Sample1    COL1A1 24         4.98
##  5 Sample1    COL1A2 6          6.29
##  6 Sample1    COL1A2 24         5.42
##  7 Sample1    COL3A1 6          8.33
##  8 Sample1    COL3A1 24         4.33
##  9 Sample1    COL5A1 6          3.98
## 10 Sample1    COL5A1 24         0   
## # … with 3,158 more rows
```

# Data visualization

## Your first boxplot

Now we're ready to make our first plot!

First, let's try just plotting the ACTN2 gene. We'll use `filter()` to get rows for this gene only:


```r
dat_joined_long %>%
    filter(gene == 'ACTN2')
```

```
## # A tibble: 176 × 4
##    Sample_Num gene  weeks log2_expr
##    <chr>      <chr> <chr>     <dbl>
##  1 Sample1    ACTN2 6         0    
##  2 Sample1    ACTN2 24        0    
##  3 Sample2    ACTN2 6         0    
##  4 Sample2    ACTN2 24        0    
##  5 Sample3    ACTN2 6         0.642
##  6 Sample3    ACTN2 24        3.68 
##  7 Sample4    ACTN2 6         0    
##  8 Sample4    ACTN2 24        0    
##  9 Sample5    ACTN2 6         0    
## 10 Sample5    ACTN2 24        6.19 
## # … with 166 more rows
```


We will be using the `ggplot2` package today to make our plots. This is a very
powerful package that creates professional looking plots and is one of the
reasons people like using R so much. All plots made using the `ggplot2` package
start by calling the `ggplot()` function. 


```r
dat_joined_long %>%
    filter(gene == 'ACTN2') %>%
    ggplot()
```

<img src="figures/ggplot-blank-1.png" width="672" />

Now we need to start telling it what we actually
want to draw in this plot. The elements of a plot have a bunch of properties
like an x and y position, a size, a color, etc. These properties are called
**aesthetics**. When creating a data visualization, we  map a variable in our
dataset to an aesthetic in our plot. In ggplot, we can do this by creating an
"aesthetic mapping", which we do with the `aes()` function.

To create our plot, we need to map variables from our data frame to
ggplot aesthetics using the `aes()` function. Since we have already told
`ggplot` that we are using the data in the `dat_joined_long` object, we can
access the columns of the data frame using the object's column names.
Remember, R is case-sensitive, so we have to be careful to match the column
names exactly!


```r
dat_joined_long %>%
    filter(gene == 'ACTN2') %>%
    ggplot() +
    aes(weeks, log2_expr)
```

<img src="figures/ggplot-aes-1.png" width="672" />

Note that we've added this new function call to a second line just to make it
easier to read. To do this we make sure that the `+` is at the end of the first
line otherwise R will assume your command ends when it starts the next row. The
`+` sign indicates not only that we are adding information, but to continue on
to the next line of code.

We still haven't told ggplot how we want it to
draw the data. There are many different plot types (bar charts, scatter plots,
histograms, etc). We tell our plot object what to draw by adding a "geometry"
("geom" for short) to our object. We will talk about many different geometries
today, but for our first plot, let's draw our data using a boxplot.


```r
dat_joined_long %>%
    filter(gene == 'ACTN2') %>%
    ggplot() +
    aes(weeks, log2_expr) +
    geom_boxplot()
```

```
## Warning: Removed 40 rows containing non-finite values (stat_boxplot).
```

<img src="figures/ggplot-boxplot-1.png" width="672" />

Finally, we can make it look nicer by adding labels:


```r
dat_joined_long %>%
    filter(gene == 'ACTN2') %>%
    ggplot() +
    aes(weeks, log2_expr) +
    geom_boxplot() +
    labs(title = 'ACTN2', x = '# of weeks', y = 'log2 gene expression')
```

```
## Warning: Removed 40 rows containing non-finite values (stat_boxplot).
```

<img src="figures/boxplot-actn2-1.png" width="672" />

## Saving plots


```r
boxplot_actn2 <- dat_joined_long %>%
    filter(gene == 'ACTN2') %>%
    ggplot() +
    aes(weeks, log2_expr) +
    geom_boxplot() +
    labs(title = 'ACTN2', x = '# of weeks', y = 'log2 gene expression')
ggsave(filename = 'boxplot_actn2.png', plot = boxplot_actn2)
```


> ### Exercise: make a boxplot
>
> Make a boxplot plot for expression of the gene GATA4 at 6 weeks compared to 24 weeks.
>
> 
> ```r
> # CHALLENGE:
> # Make a boxplot plot for expression of the gene GATA4 at 6 weeks compared to 24 weeks.
> dat_joined_long %>%
>     filter(gene == 'GATA4') %>%
>     ggplot() +
>     aes(weeks, log2_expr) +
>     geom_boxplot() +
>     labs(title = 'GATA4', x = '# of weeks', y = 'log2 gene expression')
> ```
> 
> ```
> ## Warning: Removed 40 rows containing non-finite values (stat_boxplot).
> ```
> 
> <img src="figures/gata4-1.png" width="672" />

## Color palettes

We can map the color of the boxplot to a variable using `aes(color = colname)`.
Let's see what it looks like using the default options:


```r
# R color palettes
# change the colors with scale_color_
dat_joined_long %>%
    filter(gene == 'ACTN2') %>%
    ggplot() +
    aes(weeks, log2_expr, color = weeks) +
    geom_boxplot() +
    labs(title = 'ACTN2', x = '# of weeks', y = 'log2 gene expression')
```

```
## Warning: Removed 40 rows containing non-finite values (stat_boxplot).
```

<img src="figures/color-1.png" width="672" />

That changed the outline, but not the inside. We can instead use fill:


```r
# R color palettes
# change the colors with scale_color_
dat_joined_long %>%
    filter(gene == 'ACTN2') %>%
    ggplot() +
    aes(weeks, log2_expr, fill = weeks) +
    geom_boxplot() +
    labs(title = 'ACTN2', x = '# of weeks', y = 'log2 gene expression')
```

```
## Warning: Removed 40 rows containing non-finite values (stat_boxplot).
```

<img src="figures/fill-1.png" width="672" />

Our plot is looking prettier now that we have some color!
But what if we want to use different colors? We can use `scale_fill_manual` to 
manually set them and specify colors by name:


```r
# R color palettes
# change the colors with scale_color_
dat_joined_long %>%
    filter(gene == 'ACTN2') %>%
    ggplot() +
    aes(weeks, log2_expr, fill = weeks) +
    geom_boxplot() +
    scale_fill_manual(values = c('green', 'blue')) +
    labs(title = 'ACTN2', x = '# of weeks', y = 'log2 gene expression')
```

```
## Warning: Removed 40 rows containing non-finite values (stat_boxplot).
```

<img src="figures/scale-fill-1.png" width="672" />

Or you can look up the **hexadecimal code** of your favorite colors and specify them exactly.
There are a lot of websites that will tell you the hex code of a color.
Here's one: https://www.rapidtables.com/web/color/RGB_Color.html
Let's use "plum" (#DDA0DD) and "light steel blue" (#B0C4DE).


```r
# R color palettes
# change the colors with scale_color_
dat_joined_long %>%
    filter(gene == 'ACTN2') %>%
    ggplot() +
    aes(weeks, log2_expr, fill = weeks) +
    geom_boxplot() +
    scale_fill_manual(values = c('#DDA0DD', '#B0C4DE')) +
    labs(title = 'ACTN2', x = '# of weeks', y = 'log2 gene expression')
```

```
## Warning: Removed 40 rows containing non-finite values (stat_boxplot).
```

<img src="figures/scale-fill-hex-1.png" width="672" />

You can even specify both the fill and the color at the same time:



```r
# R color palettes
# change the colors with scale_color_
dat_joined_long %>%
    filter(gene == 'ACTN2') %>%
    ggplot() +
    aes(weeks, log2_expr, fill = weeks, color = weeks) +
    geom_boxplot() +
    scale_fill_manual(values = c('#DDA0DD', '#B0C4DE')) +
    scale_color_manual(values = c('#B0C4DE', '#DDA0DD'))
```

```
## Warning: Removed 40 rows containing non-finite values (stat_boxplot).
```

<img src="figures/scale-fill-color-1.png" width="672" />

```r
    labs(title = 'ACTN2', x = '# of weeks', y = 'log2 gene expression')
```

```
## $x
## [1] "# of weeks"
## 
## $y
## [1] "log2 gene expression"
## 
## $title
## [1] "ACTN2"
## 
## attr(,"class")
## [1] "labels"
```

> ### Exercise: custom colors
>
> modify your boxplot for GATA4. Make each box a different color or fill (or both!)
>
> Once you've finished, use `ggsave()` to save the file. 
> 
> ```r
> pretty_boxplot_gata4 = dat_joined_long %>%
>     filter(gene == 'GATA4') %>%
>     ggplot() +
>     aes(weeks, log2_expr, fill = weeks, color = weeks) +
>     geom_boxplot() +
>     scale_fill_manual(values = c('#DDA0DD', '#B0C4DE')) +
>     scale_color_manual(values = c('#B0C4DE', '#DDA0DD'))
>     labs(title = 'GATA4', x = '# of weeks', y = 'log2 gene expression')
> ```
> 
> ```
> ## $x
> ## [1] "# of weeks"
> ## 
> ## $y
> ## [1] "log2 gene expression"
> ## 
> ## $title
> ## [1] "GATA4"
> ## 
> ## attr(,"class")
> ## [1] "labels"
> ```
> 
> ```r
> #ggsave(filename = 'boxplot_GATA4.png', plot = pretty_boxplot_gata4)
> ```


## Plot all the genes


```r
# PLOT ALL THE GENES
# facet wrap
dat_joined_long %>%
    ggplot(aes(weeks, log2_expr)) +
    geom_boxplot() +
    facet_wrap('gene')
```

```
## Warning: Removed 720 rows containing non-finite values (stat_boxplot).
```

<img src="figures/boxplot-all-genes-1.png" width="672" />

## Heatmaps


```r
dat_joined_long %>%
    filter(weeks == '6', !is.na(log2_expr)) %>%
    ggplot(aes(gene, Sample_Num, fill = log2_expr)) +
    geom_tile() +
    theme(axis.text.x = element_text(angle = 90))
```

<img src="figures/heatmap-6-weeks-1.png" width="672" />


```r
dat_joined_long %>%
    filter(weeks == '24', !is.na(log2_expr)) %>%
    ggplot(aes(gene, Sample_Num, fill = log2_expr)) +
    geom_tile() +
    theme(axis.text.x = element_text(angle = 90))
```

<img src="figures/heatmap-24-weeks-1.png" width="672" />

<!--
## Gene fun facts


```r
gene_facts <- tibble(gene = c("ACTN2", "COL1A1", "COL1A2", "COL3A1", "COL5A1", 
"COL5A2", "GATA4", "MYH6", "MYH7", "MYL2", "MYL3", "MYL4", "MYL6", 
"NOTCH1", "NOTCH2", "NPPA", "NPPB", "SIRT1"))
```
-->

## Bonus: Why log2-transform


```r
tibble(linear = 0:10,
       x = linear) %>% 
    mutate(log2 = log2(linear),
           log10 = log10(linear)) %>% 
    pivot_longer(c(linear, log2, log10), 
                 names_to = 'scale', 
                 values_to = 'y') %>% 
    ggplot() +
    aes(x, y, color = scale) +
    geom_point() +
    geom_line() +
    theme_bw()
```

<img src="figures/log-trans-1.png" width="672" />

