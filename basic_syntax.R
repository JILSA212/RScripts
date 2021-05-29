# Basic functions of R
x = 5
log2(x)
log10(x)
exp(x)
log2(x)
log10(x)

x = 10
cos(x)
sin(x)
tan(x)
acos(x)
asin(x)
atan(x)

x = -9
abs(x)
sqrt(x*-1)

x <- 3
print(x)

#Listing the objects
a = 6
ls()
rm(a)
ls()

age <- 21
name <- "myname"
is_idiot <- TRUE


#Type of variable
class(age)
class(name)
class(is_idiot)

is.numeric(age)
is.numeric(name)
is.character(name)
is.logical(is_idiot)


#Arrays
fav_numbers = c(2, 4, 8, 12, 52)
fav_numbers

fav_names = c("abc", "def", "xyz", "stu")
fav_names

fav_logic = c(TRUE, FALSE, FALSE, TRUE)
fav_logic

names(fav_numbers) = fav_names
fav_numbers

length(fav_numbers)

is.na(fav_numbers)
is.na(names(fav_numbers))

#Subset of array
fav_names[2]
fav_numbers[c(2,4)]
fav_numbers[1:3]
fav_numbers["abc"]
fav_names[-2] #Excludes the element
fav_names[-c(2,4)]
fav_names[-(1:3)]
fav_names[fav_logic == TRUE]
fav_names[fav_numbers >= 10]
fav_numbers[!is.na(names(fav_numbers))]
new_numbers = fav_numbers * 2 #Operation will be performed element-wise


min(fav_numbers)
max(fav_numbers)
range(fav_numbers)
sum(fav_numbers)
prod(fav_numbers)
mean(fav_numbers)
sd(fav_numbers)
var(fav_numbers)
sort(fav_numbers)


# Matrix
col1 <- c(1,2,3,4,5)
col2 <- c(2,3,4,5,6)
col3 <- c(4,5,6,7,8)
mat1 <- cbind(col1, col2, col3)
mat2 <- rbind(col1, col2, col3)
rownames(mat1) <- c("row1", "row2", "row3", "row4", "row5")
t(mat1) #Transpose
mat3 <- matrix(data= c(1,2,3,4,5,6), nrow = 2, byrow = TRUE, dimnames = list(c("row1", "row2"), c("col1", "col2", "col3"))) #ncol is also available
ncol(mat1)
nrow(mat1)
dim(mat1)
mat1[2,]
mat1[2:4,]
mat1[,3]
mat1["row1", "col2"]
rowSums(mat1)
colSums(mat1)

# apply(X, MARGIN (1 = row, 2 = col), FUNCTION)
apply(mat1, 1, mean)

# Categories or groups in data
groups <- factor(c(1,2,2,1))
groups
levels(groups)
levels(groups) <- c("first", "second")

is.factor(groups)
is.factor(fav_numbers)
as.factor(fav_logic)

new_group = factor(c(3,4,3,4))

summary(groups)
level <- levels(groups)
mean_groups = tapply(as.numeric(groups), new_group, mean)
mean_groups

table(groups)
table(groups, new_group)

# Data frames
friends_data <- data.frame(names=fav_names, age=fav_numbers[1:4], is_married=fav_logic)
friends_data

is.data.frame(friends_data)
class(friends_data)
t(friends_data)
friends_data$names # Used to access column
friends_data[,"names"] # Equvivalent of previous statement

subset(friends_data, age>10)

# Attach the data frame so columns can be accessed by names only
attach(friends_data)
friends_data[names=="abc",]
detach(friends_data)

friends_data$groups = groups # Add new column
cbind(friends_data, groups=groups) # Alternate way

# Lists
list1 = list(i1 = "item1", i2 = 24, i3 = c(67, "hello"))
list1
names(list1)
length(list1)
list1$i1
list1[["i1"]]
list1[[1]]
list1[[3]][1]

list1$i4 <- "item4"
new_list = c(list1, list1)
new_list[[4]]

myFun <- function(x) {
  if(is.numeric(x)) {
    return(x^2)
  }
  else if(is.character(x)) {
    return(toupper(x))
  }
  else {
    return(x)
  }
}

myFun(1:5)
myFun(c("a","b","c","g","hello","y"))
myFun(TRUE)


# Loops
for(x in 1:10) {
  print(x)
}

dice = c("1", "2", "3", "4", "5", "6")
for(x in dice) {
  if(x=="3") { next }
  print(x)
}

i = 5
while(i>0) {
  print(i^3)
  i=i-1
}