#import data into df
library(tidyverse)
df=Life.Expectancy.Data
country_years <- df %>%
  group_by(Country) %>%
  summarise(unique_years = n_distinct(Year))

# Get a list of countries with data for all 16 years
countries_with_16_year <- country_years$Country[country_years$unique_years == 16]
# Filter the original data frame to keep only the rows with countries having all 16 years
df=df%>%filter(Country %in% countries_with_16_year)
#new column
df=df%>%mutate(le1= lead(Life.expectancy, default = NA))
#remove 2000
df=df%>%filter(Year %in% 2001:2015)
#remove rows with NA values
df=na.omit(df)
# Reset index
df <- df %>% rownames_to_column(var = "index") %>% select(-index)
#changing character variables to factor
df$Status=as.factor(df$Status)
df$Country=as.factor((df$Country))
##1:check for outliers in the original data
model=lm(Life.expectancy~.-Country,df)
summary(model)
#2*21/1588=0.02644
#hatvalues
remove=which(hatvalues(model)>0.02644836)
df1=df[-remove,]
model1=lm(Life.expectancy~.-Country,df1)
summary(model1)
#cooks distance
qf(0.1,21,1588-21)
keep=which(cooks.distance(model)<0.629304)
df2=df[keep,]
model2=lm(Life.expectancy~.-Country,df2)
summary(model2)
#dffits
2*sqrt(21/1588)
keep1=which(abs(dffits(model))<0.2299929)
remove3=which(abs(dffits(model))>0.2299929)
df3=df[keep1,]
model3=lm(Life.expectancy~.-Country,df3)
summary(model3)
#dfbetas
2/sqrt(1588)
remove1=which(rowSums(abs(dfbetas(model)) > 0.05018856) > 0)
df4=df[-remove1,]
model4=lm(Life.expectancy~.-Country,df4)
summary(model4)
#covratio
3*21/1588
remove2=which(abs(covratio(model)-1)>0.03967254)
df5=df[-remove2,]
model5=lm(Life.expectancy~.-Country,df5)
summary(model5)
#common influential
common_values <- Reduce(intersect, list(remove,remove1,remove2,remove3))
df6=df[-common_values,]
model6=lm(Life.expectancy~.-Country,df6)
summary(model6)

##2:
#divide the data using 80:20
sample <- sample.int(n = nrow(df), size = floor(.8*nrow(df)), replace = F)
train <- df[sample, ]
test  <- df[-sample, ]

a1=df[remove,]
a2=df[remove1,]


