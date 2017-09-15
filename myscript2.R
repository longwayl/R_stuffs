#changes for git
rm(list  = ls())
a <-4
print(a)
a
12

a <- 14
#Everythin in R is a vector. No idea of single numbmers. No 'naked' data in R.

#Making a vector:
b <- c(4,5,6,4,5,4,2,3,4,5,5,4,3,2,1,3,4,5,5,7,5,4,3,2,2,3,4,5,6,4,3,4,5,6,4,3,2,10)
print(b)
#Vectors can only store one type of data. 

x <- c(4.7, 3.5)
print(x)

#This vector has 'numerics' in it. Equivalent to python float. R does have int.
#Can convert between integer and numeric with: as.numeric(x) and as.integer(x)

x_as_int <- as.integer(x)
print(x_as_int)

# moving somethign to an integer is truncating again not rounding.
# Numbers in R are by default in numeric. 
# Sometimes R auto-converts your int and numerics when it is expecting them

#R has character vector:

names <- c("Bob", "Joe", "Kim")
# 1 char vector, 3 elements
name <- "Shawn"
print(names)
print(name)

#Vectors can't mix types.R will automatically change your data type without warning
x <- c(4.7,"Joe", 3.5)
print(x)

# vectors can't nest!
y <- c(1,c(3,4),7) #will not work. will get rid of the internal one

#Lists can store dif. types of data and things. 

###Logical vectors
tests <- c(TRUE,FALSE,TRUE) # can also use c(T,F,T)

##Lenths of vector

y <- c(1,3,4,7)
len_y <- length(y)
print(y[3]) # R starts counting at !!!!

y <- c(10, 20,30 ,40)
z <- y[3]
print(z)
print(length(z))
z <- y[c(3,2)] # this is called indexing
print(z)
print(length(z))

# R vectaors are mutable

y[3] <- 300

y[c(3,2)] <- c(300,200)


#More vectors:

# Does element by element orperations!!!

y <-c(10,20,30,40)
x <- c(-10,-10,-10,-10)
z <- x*y  
  
  #Shorter vectors get recylcled.

z <- y * 4 #40, 80 #112


#Logical vectors!!!!)

x <- c(10,20,30,40)
y <- c( 5, 25, 15, 400)

z <- x < y # F,T, F, F 
#Can use logical vectors as indices

x_some <- x[z] # or x[c(F,T,F,T)]
print(x_some)

# Can do opposise of this with the !


ages <- c(37, 24, 18, 41, 22)
mean_age <- mean(ages)
selector <- ages > mean_age
print(selector)

grt_mean_ages <- ages[selector]


#In are will mostly like see it all wrapped in one;

gt_mean_agse <- ages[ages>mean(ages)]

#Lots of bulit in functions:

samp <- rnorm(100, mean = 20, sd = 3)
print(samp)


#Given a vector like this, how many numbers > 25
#What is the 83rd percentile of the numbers (if took, numbers sorted them and got the 83rd #, return it)
#create a zero centered version, subtract from all the numbers the mean of all the numbers

#Getting number greater than 25
# Figure out logical vectors better!! Don't understand why this works....
samp_grt_25 <- samp > 25
num_samp_grt_25 <- length(samp[samp_grt_25])

#getting 83 and 95 percentile
print(quantile(samp, c(0.83, 0.95)))

# help(quantile)  same as ?quantile


##### NA values = way to represent unknown data

ages <- c(10, 20, NA, 7)
names <- c("Jim", "Kim", "Bob", "Joe")
mean_age <- mean(ages) # going to be NA

## Anything done with an NA will return an NA
## Ways to get rid of NAs

na_ages <- is.na(ages) ## FFTF
non_na_ages <- ages[!na_ages] ## all the ones that are not true should be kept
non_na_names <- names[!na_ages]
print(mean(non_na_ages))

## Another way of doing this:
print(mean(ages, na.rm =T))

###I can sort the names vector acording to the data in the ages vector:

ages_order <- order(ages)
print(ages_order)
  # get a vector of numbers back showing the order of them. Can use it as an indexing vector!
ages_sorted <- ages[ages_order]
names_sorted <- names[ages_order]

## Lots of ways to count
y <- c(F,T,T,F)
sum(y)
#Trues cout as 1 here and F count as 0)

#Ways to index (Jor selectively replace) vectors
# by numeric vector
#ages_subset <- ages[c(3,2)]
#2) by logical vector 
# ages_subset <- ages[c(T,F,T,F)]
#3) by character vector
# ages_subset <- ages[c("Joe", "Bob)]
  # Joe Bob

ages <- c(10, 20, NA, 7)
names(ages) <- c("Joe", "Kim", "Bob", "Jim")
print(names)
print(ages)

agejoe <- ages[2] # vector of legnth one. 

### Using lists! ## Can go to a new line of code if you end a line on a comma or +

# Single squary brackets of a list pull out a list, single squary brackets
# of a vector pull out a vector

melanie <- list(2, c(24, 21),
                c("Rayne", "Dane"),
                c("AA", "BA", "MS", "PhD"),
                list(nationality = "Cuban", experience = c("life", "awesome")))
                
print(melanie)
                
melanie_part2 <- melanie[2] ## List(c(24,21))

kids_ages <- melanie[[2]] # list c(24,21)

print(melanie[[2]][2]) # pulling out the second index of the subvector

# any piece of data in R can have attributes or metadata
# Can add it with function attr

attr(melanie, " CurrentWorkShop") <- "Software carpentry"

print(melanie)

# Names was an attr too

print(attr(ages,"names"))
print(names(ages))

# assigning names to the list

names(melanie)<- c("numkids", "ageskids", "nameskids", "degrees", "spouse")

# Can add the names right while creating "malanie" by saying "....(numkids = 2, ageskids = c(24,21),)"...etc

print(names(melanie))

print(melanie)
  # can now access elements of the list by their names with $, means don't have to deal with the double
  #bracket stuffs

kids_ages <- melanie$ageskids 
print(kids_ages)
# kids_ages <- melanie[["ageskids]]

#can get the structure as well

str(melanie)

##Not sure hwy not working
sp_exp <- melanie$spouse$experience
print(sp_exp)

#### 

samp1 <- rnorm(100, mean = 20, sd =3)
samp2 <- rnorm(100, mean = 10, sd = 3)
tres <- t.test(samp1, samp2)

print(tres)
str(tres)
print(tres$p.value)


firstnames <-c("Joe", "Kim", "Bob", "Jim")
ages <- c(10, 20, NA, 7)

somelist <- list(firstnames = firstnames, ages = ages)

print(somelist)
#somelist is pretty much a dataframe now, might as well make them that now
# dateframe is a list of vectors!!
people <- data.frame(firstnames, ages, stringsAsFactors = FALSE)
#Can make new elements of lists or data frames witht he $ symbol:
# if you only put in a shorter element will recycle values to match the lenght of the data.frame
people$dietarypreferance <- c("Vega", NA, NA, "Authoritarian")
people$species <- "Human"
#do the strings a factors thing so it doesn't auto convert things to factors
print(people)

print(people[[2]])

##Data.frame a named list of vectors
  #plus ensures that vectors have the same length
  #essentially makes it a table

##Data frames allow us to work with rows and columns!
# if have a vector and use [] will get a subvector
# if have a list and use [] get a sublist
# if have a data.frame and use [] will get a df back

#df['rowselector', 'column selector']
  # if numerical selecting by row or column number
  # if it's logical: by "True" "False
  # if char: by name
  # Empty means "all"

print(people[c(T,F,T,F), c("ages", "firstnames")])

#or

print(people[c(T,F,T,F), c(3,2)])


## can name the columns too

colnames(people)<- c("First", "Age", "Diet", "Species")
rownames(people) <- c("p1", "p2", "p3", "p4")
print(people)
#Rownames are a character vector as are the column names
# columns are vectors themselves of all the same length

print(people[c("p3", "p2"), c(3,2)])
print(people$Age)

#getting a subdata frame where the age isn't NA
non_na_people <- people[ !is.na(people$Age), ]
print(non_na_people)

#wante to sort people by age column

people_sort_by_age <- people[order(people$Age),]
print(people_sort_by_age)

### WOrking with dataset of us arrests

USArrests$State <- rownames(USArrests)


## 1) How many states have a murder rate > rape rate?
                                    # > 1/2 rape rate
murder_gt_rape <- USArrests$murder > USArrests$Rape

##FIXprint(murder_gt_rape)
## 2) WHich state has the highest murder rate?

## 3) Which state has the hightest combined crime rate?

## 4) Split the data into high_murder and low_murder data frames (>, <= median murder rate)
  # then run t.test on resulting assult vectors. 

# Answer 4
murder_median <-median(USArrests$Murder)
#print(murder_mean)
high_murder<- USArrests$Murder > murder_median
#print(high_murder)
low_murder <-USArrests$Murder <= murder_median
exp_lowAssult <- USArrests$Assault[low_murder]
#exp_lowAssultState<-USArrests$State[low_murder]
#print(exp_lowAssultState)
exp_highAssult<-USArrests$Assult[high_murder]
#print(exp_highAssultState)
#print(exp_lowAssult)
#exp_highAssult <- USArrests$Assault[high_murder]
tres<- t.test(high_murder$Assult, low_murder$Assult)
#str(tres)
print(tres)
