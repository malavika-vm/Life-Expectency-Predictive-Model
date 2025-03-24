#  Life Expectancy Analysis

Welcome to our exploration of the **Life Expectancy dataset**, where we conducted a comprehensive statistical and machine learning analysis to uncover the driving factors behind variations in life expectancy across countries.

---

##  Dataset Overview

The dataset includes global life expectancy figures along with 18 predictor variables, such as:

 • Alcohol-Alcohol, recorded per capita (15+) consumption (in litres of pure alcohol)
 • percentage expenditure-Expenditure on health as a percene of Gross Domestic Product per capita(%)
 • Adult Mortality-Adult Mortality Rates of both sexes (probability of dying between 15 and 60 years per 1000 population)
 • infant deaths-Number of Infant Deaths per 1000 population
 • Life expectancy-Life Expectancy in age
 • Status-Developed or Developing status
 • Year-Year
 • Country-Country
 • Hepatitis B-Hepatitis B (HepB) immunization coverage among 1-year-olds (%)
 • Measles-Measles- number of reported cases per 1000 population
 • BMI-Average Body Mass Index of entire population
 • under-five deaths-Number of under-five deaths per 1000 population
 • Polio-Polio (Pol3) immunization coverage among 1-year-olds (%)
 • Total expenditure-General government expenditure on health as a percene of total government expenditure
 • Diphtheria-Diphtheria tetanus toxoid and pertussis (DTP3) immunization coverage among 1-year-olds
 • HIV/AIDS-Deaths per 1 000 live births HIV/AIDS (0-4 years)
 • GDP-Gross Domestic Product per capita (in USD)
 • Population-Population of the country
 • thinness 1-19 years-Prevalence of thinness among children and adolescents for Age 10 to 19 (%)
 • thinness 5-9 years-Prevalence of thinness among children for Age 5 to 9(%)
 • Income composition of resources-Income composition of resources
 • Schooling- Number of years of Schooling(years)

Our goal was to model and understand the key influences on life expectancy while addressing challenges such as outliers, multicollinearity, and overfitting.

---

##  Methodology

###  Exploratory Data Analysis
- Assessed correlations between variables
- Identified outliers and influential observations  
- Evaluated multicollinearity using correlation matrices and VIF

###  Data Cleaning
- Removed or adjusted major outliers  
  - *Sierra Leone* emerged as a low-end outlier with unique challenges  
  - *France* stood out as a high-life expectancy benchmark
- Eliminated redundant features to reduce multicollinearity

###  Model Development
- Split the data into training and testing sets
- Implemented and compared multiple regression models
- **Ridge Regression** was selected based on RMSE performance

###  Key Predictors Identified
- Income composition of resources  
- Schooling  
- Total expenditure  

Notably, higher alcohol consumption showed a **positive correlation** with life expectancy in some countries—an unexpected and interesting insight.

---

##  Time Series Component

We attempted to incorporate life expectancy from the previous year as a predictor—similar to an AR(1) time series model. This analysis indicated a need for **nonlinear regression**, which we plan to explore in future work.

---

##  Key Findings & Impact

- **Sierra Leone** and **France** were pivotal in revealing country-specific trends and challenges.
- Multicollinearity was addressed, improving model reliability.
- **Ridge regression** led to improved accuracy and generalizability.
- Our insights offer practical recommendations for **policymakers and public health professionals**, grounded in data.

---

##  Repository Structure

📄 data.csv #original data from WHO.
📄 data_cleaning.R  #R code to clean and organise the data.
📄 Fitting_Models.R #R code to detect outliers and fitting various linear models.
📄 README.md # Project summary and structure.
📄 requirements.R # R packages.


---

##  Reproducibility & Version Control

From the beginning of the project, we emphasized **reproducibility**. All code was tracked using **Git**, and we maintained clear documentation and structure to support collaboration and transparency.

---

##  Future Work

- Apply **nonlinear regression models** for temporal predictions  
- Deepen the time series analysis using ARIMA or LSTM  
- Expand to more recent or region-specific datasets

---
