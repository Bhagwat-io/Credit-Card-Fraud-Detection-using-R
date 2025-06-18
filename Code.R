#importing the data set from the respective folder
creditcard <- read.csv("C:\\Users\\Bhagwat\\OneDrive\\Documents\\Fraud_Detection\\creditcard.csv");

#Glance at the structure of the data set
str(creditcard);

#Convert class to a factor variable
creditcard$Class <- factor(creditcard$class , levels = c(0,1))

#Get the Summary of the data
summary(creditcard);

#Count the missing values
sum(is.na(creditcard));

#-------------------------------------------------------------------------------

#get the distribution of fraud and legit transaction in the data set
table(creditcard$Class);

#printing first 6 rows od data set
head(creditcard);

#printing last 6 rows od data set
tail(creditcard);

#get the percentage of fraud and legit transaction in the data set
prop.table(table(creditcard$Class));

#pie chart of credit card transaction
labels <- c("legit","fraud");
labels <- paste(labels,round(100*prop.table(table(creditcard$Class)),2));
labels <- paste0(labels,"%");

pie(table(creditcard$Class),labels,col = c("Blue","red"),
    main = "pie chart of credit card transaction");

#-------------------------------------------------------------------------------

#No model prediction 
predictions <- rep.int(0,nrow(creditcard));
predictions <- factor(predictions,levels = c(0,1))

#install.packages("caret");
library(caret);
confusionMatrix(data = predictions, reference = creditcard$Class);

#-------------------------------------------------------------------------------

library(dplyr);

set.seed(1);
creditcard <- creditcard %>% sample_frac(0.1);

table(creditcard$Class);

library(ggplot2);

ggplot(data = creditcard, aes(x = v1 ,y = v2, col = class))+
  geom_point()+
  theme_bw()+
  scale_color_manual(values = c('dodgerblue2',red))

#-------------------------------------------------------------------------------

#Creating training and Test sets for fraud detection model

#install.packages('caTools')
library(caTools)

set.seed(123)

data_sample = sample.split(creditcard&clas,SplitRatio= 0.80)

train_data = subset(creditcard,data_sample==TRUE)

test_data =  subset(creditcard,data_sample==FALSE)

dim(train_data)
dim(test_data)

#-------------------------------------------------------------------------------

#Random Over-Sampling(ROS)

table(train_data&class)

n_legit <- 22750
new_frac_legit <- 0.50
new_n_total <- n_legit/new_frac_legit # = 22750/0.50

#install.packages('ROSE')
library(ROSE)
oversampling_result <- ovun.sample(class ~ .,
                                   data = train_data,
                                   N = new_n_total,
                                   seed = 2019 )

oversampled_credit <- oversampling_result$data

table(oversampled_credit$class)

ggplot(data = oversampled_credit, aes(x = v1, y = V2 , col = class))+
    geom_point(position = position_jitter(width = 0.2))+
      theme_bw()+
      scale_color_manual(values = c('dodgerblue','red'))

#-------------------------------------------------------------------------------

#random Under-sampling(RUS)

table(train_data$class)

n_fraud <- 35
new_frac_fraud <- 0.50
new_n_total <- n_fraud/new_frac_legit # = 35/0.50

#library (ROSE)
undersampling_result <- ovun.sample(class ~.,
                                    data = train_data,
                                    method = "under",
                                    N = new_n_total,
                                    seed = 2019)

undersampled_credit <- undersampling_result$data

table(undersampled_credit$class)

ggplot(data = undersampled_credit,aes(x = V1, y = V2, col = class))+
  geom_point()+
  theme_bw()+
  scale_color_manual(values = c('dodgerblue','red'))

#-------------------------------------------------------------------------------

#ROS and RUS  

n_new <- nrow(train_data) # = 22785
fraction_fraud_mew <- 0.50

sampling_result <- ovun.sample(class ~ .,
                               data = train_data,
                               method = "both",
                               N = n_new,
                               p = fraction_fraud_new,
                               seed = 2019)

sampled_credit <- sampling_result$data

table(sampled_credit$class)

prop.table(table(sampled_credit$class))

ggplot(data = sampled_credit, aes(x = V1 , y = V2 , col = class))+
  geom_point(Position = position_jitter(width = 0.2))+
  theme_bw()+
  scale_color_manual(values = c('dodgerblue','red'))

#-------------------------------------------------------------------------------

#Using SMOTE to balance the data set

#install.package("smote family)
library(smotefamily)

table(train_data$class)

#set the number of fraud and legit cases, and the desired percentage of legit cases
n0 <- 22750
n1 <- 35
r0 <- 0.6
#calculate the value for the dup_size parameter of SMOTE
ntimes <- ((1 - r0) / r0) * (n0 /n1) - 1

smote_output = SMOTE(x = train_data[ , -c(1, 31)],
                     target = train_data$class,
                     K = 5,
                     dup_size = ntimes)

credit_smoke <- smote_output$data

colnames(credit_smoke)[30] <- "class"

prop.table(table(credit_smote$class))

#class distribution for original dataset
ggplot(train_data, aes(x = V1, y = V2, col = class))+
  geom_point()+
  scale_colour_manual(values = c('dodgerblue','red'))

#class distribution for over-sampled data set using SMOTE
ggplot(credit_smoke, aes (x = V1, y = V2, col = class))+
  geom_point()+
  scale_color_manual(values = c('dodgerblue','red'))

#-------------------------------------------------------------------------------

#install.packages('rpart')
#install.packages('rpart.plot')
library(rpart)
library(rpart.plot)

CART_model <- rpart(class ~ ., credit_smoke)

rpart.plot(CART_model ,extra = 0, type = 5,tweak = 1.2)

#predict fraud model
predicted_val <- predict(CART_model, test_data,type = 'class')

#Build confusion matrix
library(caret)
confusionMatrix(prediction_val ,test_data$class)

#-------------------------------------------------------------------------------

predicted_val <- predict(CART_model,credit_card[,-1],type = 'class')
confusionMatrix(predicted_val , credit_card$class)

#-------------------------------------------------------------------------------
#Decision tree without SMOTE 

CART_model <- rpart(class ~ . ,train_data[,-1])

rpart.plot(CART_model , extra = 0,type = 5, tweak = 1.2)

#predict fraud classes
predicted_val <- predict(CART_model , test_data[,-1],type = 'class')

library(caret)
confusionMatrix(predicted_val,test_data$class)

#-------------------------------------------------------------------------------
predicted_val <- predict(CART_model,creditcard[,-1],type = 'class')
confusionMatrix(predicted_val , creditcard$Class)


