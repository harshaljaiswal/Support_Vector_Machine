# Support Vector Machine (SVM)

# Importing the dataset
dataset = read.csv('creditcard.csv')

# Encoding the target feature as factor
dataset$Class = factor(dataset$Class, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Class, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting SVM to the Training set
# install.packages('e1071')
library(e1071)
classifier = svm(formula = Class ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-31])

# Making the Confusion Matrix
cm = table(test_set[, 31], y_pred)

#       0     1
# 0 71058    21
# 1    25    98
