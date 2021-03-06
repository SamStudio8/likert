require(likert)

mylevels <- c('Strongly Disagree', 'Disagree', 'Neither', 'Agree', 'Strongly Agree')

# Create a dummy data frame. Note that "Item 1" has only four levels
items <- data.frame('Item 1'=factor(sample(mylevels[1:4], 100, replace=TRUE)),
					'Item 2'=factor(sample(mylevels[1:5], 100, replace=TRUE)),
					'Item 3'=factor(sample(mylevels[1:5], 100, replace=TRUE)),
					check.names=FALSE)
str(items)

tryCatch({
	# This will throw an error because all the items must have the same number of levels.
	lbad <- likert(items)
}, error=function(e) { 
	print("This is good that an error was thrown!")
	print(e) 
})

sapply(items, class) #Verify that all the columns are indeed factors
sapply(items, function(x) { length(levels(x)) } ) # The number of levels in each factor

# Here we will recode each factor and explicitly set the levels
for(i in seq_along(items)) {
	items[,i] <- factor(items[,i], levels=mylevels)
}
lgood <- likert(items)
lgood
summary(lgood)
plot(lgood)
