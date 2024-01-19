# Google Data Analytics Professional Certificate Capstone Project: Cyclistic-Case-Study

## Introduction
This project demonstrates the skills learned in the Google Data Analytics Professional Certificate Course. In this project, I work for as a junior data analyst on the marketing analyst team of a fictional bike-share company called ***Cyclistic***, and will use the skill learned to complete the task of answering business questions. With the goal of helping the company make data-driven decisions, the analysis follows the steps of the data analysis process: **Ask, Prepare, Process, Analyze, Share, Act**.

### Scenario
The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members.But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

### About the Company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes,full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Moreno believes that maximizing the number of annual members will be key to future growth. Moreno believes there is a solid opportunity to convert casual riders into members.

Moreno has set a clear goal:Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

## Ask

### Business Task

The business task is to analyze Cyclistic's 2023 trip data to understand how casual riders and members use bikes differ in their use of the company bikes. The analysis will help the marketing team make data-driven decisions on how to launch advertising campaigns to incentivize casual riders to become annual members.

### Stakeholders

**Lily Moreno:** The director of marketing, and my manager. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels.

**Cyclictic marketing and analytics team:** A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy.

**Cyclistic executive team:** The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program.

### Questions

Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digita lmedia to influence casual riders to become members?

## Prepare

The prepare phase included downloading the data needed, consisting of 12 separate .csv files containing monthly Cyclistic trip data for 2023, and storing it in dedicated folder. To ensure that we are free to use the data, I went thorugh the [license](https://www.divvybikes.com/data-license-agreement) provided the data provider Motivate International Inc. The license states that "Bikeshare hereby grants to you a non-exclusive, royalty-free, limited, perpetual license to access, reproduce, analyze, copy, modify, distribute in your product or service and use the Data for any lawful purpose", meaning that we're free to use the data for the purpose of this project.  

## Process
### Data Cleaning
#### Excel

After unzipping all the files, I started my data cleaning by opening the .csv file for the January data in Excel and performed the following steps:

* Checked for and removed duplicates
* Removed any excess whitespace using the **TRIM()** function
* Calculated the ride length by subtracting `started_at` column from the `ended_at` column. The result was formatted to HH:MM:SS
* Created a column called `day_of_week` using the **WEEKDAY()** function. The result was formatted as a number, representing the weekday as 1=Sunday and 7=Saturday
* Removed rides shorter than 1 minute and longer than 24 hours

After performing these steps and taking the time to perform operations due to the large size of the data into consideration, I decided to proceed using SQL for the remaining data cleaning and further analysis.

#### SQL

To continue the data cleaning in SQL using the BigQuery sandbox, I needed to find a workaround for the file size limit of 100 MB, since multiple of the input files exceeded that limit. I ended up creating a bucket on Google Cloud Storage and uploaded the files there, which allowed me to access the files in BigQuery. After creating a table for each of the 12 .csv files, I created a query to merge all the data into a single table, while removing all rows containing null values. This table was then used for analysis.

## Analyze

To allow me to answer the three main questions of the business case, I decided to write queries to extract the following data:

* The total number of trips per rider type
* The total trips made per bike type and rider type
* The average length of rides for each rider type
* The total number of trips per rider type per month, weekday and hour of day
* The most popular start and end stations per rider type

The SQL queries used for cleaning and analyzing the data can be found in this repository.

## Share

After extracting the data to answer the questions of the study, I decided to create a Tableau dashboard for sharing the data visualizations and insights derived from these. The dashboard can be found [here](https://public.tableau.com/app/profile/carl.malina/viz/CyclisticCaseStudy_17054414171620/Dashboard1).

Here is a screenshot of the dashboard:

![Dashboard Screenshot](https://github.com/CarlMalina92/Cyclistic-Case-Study/blob/main/Dashboard-Screenshot.png)

The main insights are summarized below:

**Members**
* The top start end end stations for members are located in close proximity to universities and office building, indicating that members primarily use the bikes for commuting
* The peak activity for member riders occur on weekdays at 8 AM, 12 PM and 5 PM, coinciding with working hours
* The peak in activity is during the warmer part of the year, from April to September, indicating that the weather has an impact on the number of trips made

**Casual Riders**
* The top start and end stations for casual riders are locater at the waterfront, and near popular sights such as the aquarium and planetarium, indicating that casual riders mainly use the bikes for leisure rides
* Peak activity occurs during the weekends, with an increase in activity from 12 PM until the peak at 5 PM
* Peak months are during the warmer part of the year

**Differences between casual riders and members**
* Casual riders use the bike for leisure, while members to a higher extent use the bikes for commuting as indicated by:
  * Top start and end stations for casual riders being located close to the waterfront for casual riders, while close to universities and office buildings fo members
  * Peak hours for casual riders peak in the at 5 PM, while peak hours for members coincide with the working hours
  * Peak days for casual riders occur during the weekend for casual riders, while durng the weekdays for members
  * Average ride length is longer for casual members, indicating more leasurely rides

## Act

Based on the above insights, I would reccomend the following actions:

* Launching an advertising campain at the waterfront locations to reach as many casual riders as possible
* Offer a discount on longer rides and rides during weekends to incentivize casual riders to become members
* Offer a discounted membership for the summer months to incentivize casual riders to become members

Based on the above actions, I believe the marketing team can launch a campaign that results in more of the casual riders signing up for a membership. 
