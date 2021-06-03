Life_Expectancy_Data <- read.csv("C:/Users/vivek/Desktop/STUDY/Datasets/Life_Expectancy_Data.csv")
 
str(Life_Expectancy_Data)

regression = lm(Life.expectancy ~ Adult.Mortality + infant.deaths + Alcohol + Hepatitis.B + Measles + Polio+ Diphtheria 
                + HIV.AIDS + GDP + Population + Schooling,
                data = Life_Expectancy_Data)

summary(regression)


regression = lm(Life.expectancy ~ Adult.Mortality + infant.deaths + Diphtheria + HIV.AIDS + GDP  + Schooling,
               data = Life_Expectancy_Data)

regression = lm(Life.expectancy ~ Adult.Mortality + infant.deaths + Polio + Diphtheria + HIV.AIDS + Schooling,
                data = Life_Expectancy_Data)

summary(regression)

#regression = lm(Life.expectancy ~ Adult.Mortality + infant.deaths + HIV.AIDS + Schooling,
#                data = Life_Expectancy_Data)


cor(Life_Expectancy_Data$Polio,Life_Expectancy_Data$Life.expectancy, use = "complete.obs")






#prediction
install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(Life_Expectancy_Data$Life.expectancy, SplitRatio = 0.8)
training_set = subset(Life_Expectancy_Data, split == TRUE)
test_set = subset(Life_Expectancy_Data, split == FALSE)

y_pred = predict(regression, newdata = test_set)
