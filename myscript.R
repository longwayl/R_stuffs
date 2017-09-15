#Writing functions in R??
rm(list  = ls())
print(head(iris))

coeff_of_var <- function(x, remove_nas = FALSE){ #... represents any params
  sdx <- sd(x, na.rm = remove_nas)
  mx <- mean(x, na.rm = remove_nas)
  covx <- sdx/mx
  return(covx) # These are all local variables
}

## if no return in function, last var assigned as the return
## or if you just 'say' a var name it is returned
diff_of_cov <- function(x,y,remove_nas = F){
  covx <- coeff_of_var(x, remove_nas)
  covy <- coeff_of_var(y, remove_nas)
  return(covx-covy)
}

#sdx <- "Hi"
samp2<- rnorm(100, mean=20,sd =3)
samp1 <- rnorm(100, mean=20, sd = 3)
samp3 <- rnorm(100, mean=20, sd =5)
#samp1[1] <- NA
answ1 <- coeff_of_var(samp1, remove_nas = TRUE)
print(answ1)
#print(sdx)
answ2<-diff_of_cov(samp1, samp2, TRUE)
print(answ2)

#When calling for functions specify things by location first then name

samples <- list(samp1=samp1, samp2=samp2, samp3=samp3)
covs = list(samp1 = coeff_of_var(samples$samp1),
            samp2 = coeff_of_var(samples$samp2),
            samp3 = coeff_of_var(samples$samp3))

str(covs)
#print(coeff_of_var) #prints out the function code

#lapply(<list>, <function to apply to each element of the list>)

covs <- lapply(samples, coeff_of_var)
print(covs)
str(covs)


# You can run things parrallel on R

library(parallel)
cl <- makeCluster(4) #this specifies the nums of cpu to use

covs <- parLapply(samples, coeff_of_var)
str(covs)

### repeated computation:
## So much work to repeatedly add something onto a vector or list since 
## R has to copy the existing elements everytime. To get around that, use lapply 
## or create a large vector to begin with, and then replace the values instead of appending
covs<-c()
for(el in 1:100000){
  cov <- coeff_of_var(el)
  #print(cov)
  covs <- c(covs, el) # basically concatenates things
  print(el)
  }

print(covs)


plot(rnorm(100), rnorm(100, mean= 5))
#########


#compute coef of var for all numeric columns in iris dataframe

coeff_of_cols <- function(df){
  calc <- lapply(df, coeff_of_var)
  return(calc)
}

iris2 <- iris
iris2$Species <- NULL #deletes a column
answer <- coeff_of_cols(iris2)
print(answer)


# R also has matrices, like a df, but all data has to be the same type 
# arrays like a matrix but 3 or 4 or 5 dimensions
# factors

######

#Shawn like write.table and read.table
write.table(iris, file= "iris.txt", quote = FALSE, 
            sep = "\t", row.names = FALSE, col.name = TRUE)

iris2 <- read.table("iris.txt", header = T, sep = '\t', 
                    stringsAsFactors=FALSE)
print(head(iris2))



########3
#Good packages to have:
#  dplyr : repeat function calls over groups in a df
# tidyr: make a df well organized (handy for dplyr)
#ggplot2: super plots
