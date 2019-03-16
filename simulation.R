# Simulation: If the gender pay gap changes in the excluded reference category, will it
# impact estimates of the pay gap in other industries?

library(dplyr)

# Turn off scientific notation. 
options(scipen=999)

# Import data. 
# df1: Industry A has 5% gender pay gap 
# df2: Industry A has 10% gender pay gap
df1 <- read.csv("/Users/andrew/Desktop/data.csv")
df2 <- read.csv("/Users/andrew/Desktop/data_alt.csv")

# Verify that only difference between samples is a different pay gap within Industry A. 
summarise(group_by(df1, industry, gender), mean.pay = mean(pay))
summarise(group_by(df2, industry, gender), mean.pay = mean(pay))

# Factorize male dummies
df1$male <- factor(df1$gender)
df2$male <- factor(df2$gender)

# Creat log pay.
df1$y <- log(df1$pay)
df2$y <- log(df2$pay)

# Estimate pay gap. 
fit1 <- lm(y ~ male + industry + male*industry, data = df1)
fit2 <- lm(y ~ male + industry + male*industry, data = df2)

# Summarize results
summary(fit1)
summary(fit2)

# Calculate Industry A pay gap between samples. 
A_fit1 = coef(summary(fit1))["male1","Estimate"] 
A_fit2 = coef(summary(fit2))["male1","Estimate"] 

# Compare industry B and C pay gaps, to see what changed when pay gap falls in A.
B_fit1 = coef(summary(fit1))["male1","Estimate"] + coef(summary(fit1))["male1:industryB","Estimate"]
C_fit1 = coef(summary(fit1))["male1","Estimate"] + coef(summary(fit1))["male1:industryC","Estimate"]

B_fit2 = coef(summary(fit2))["male1","Estimate"] + coef(summary(fit2))["male1:industryB","Estimate"]
C_fit2 = coef(summary(fit2))["male1","Estimate"] + coef(summary(fit2))["male1:industryC","Estimate"]

# Did estimated gender pay gap change in Industry A?
print(A_fit1)
print(A_fit2) 

# Did estimated gender pay gap change in Industry B?
print(B_fit1)
print(B_fit2) 

# Did estimated gender pay gap change in Industry C?
print(C_fit1)
print(C_fit2) 

# END
