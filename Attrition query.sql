create database lbproj;

use lbproj

Select * from hr_data


-- Overall attrition happen in my company

select count(*) as total_employees, count(case when attrition = 1 then 1 end) as Attrition_count
from hr_data
             /* Total number of employees are 1470 and count of Attrition is 237. */

===================================================================================================>


--Present of relation between overtime and attrition

Select overtime, count(*) as Total_employees 
from hr_data
where Attrition =1
group by overtime
/* Out of 237 employees 127 employees have done overtime and 110 haven't done the overtime. So we can say that
   overtime is not directly proportional to attrition.*/
   
====================================================================================================>


-- Present of relation between rating and attrition.

Select performancerating , count(*) as Attrition_count
from hr_data
where attrition = 1
group by performancerating
/* There are two ratings 3 & 4. Out of that those employees who got the rating 4 are on the lower side of the 
   attrition. So there is a good correlation between attrition and PerformanceRating. */

=====================================================================================================>


-- Attrition based on the job roles.

Select Department, jobrole,count(*) as Attrition_count
from hr_data
where attrition = 1
group by department, jobrole
order by Attrition_count desc;
/* Employees who have jobrole - Laboratory Technician, Sales executive, research scientist, are on the higher
   side of the attrition.*/


=====================================================================================================>

-- Attrition based on Age.

Select
 Case
   When age <29 then '18-29'
   When age >30 and age <39 then '30-39'
   When age >40 and age <49 then '40-49'
   When age >50 and age <59 then '50-59'
   Else '60 and above'
   End as 'Age_Range' , count(*) as Attrition_count
 from hr_data
 where attrition = 1
 Group by Case
   When age <29 then '18-29'
   When age >30 and age <39 then '30-39'
   When age >40 and age <49 then '40-49'
   When age >50 and age <59 then '50-59'
   Else '60 and above'
   End 
order by Attrition_count desc;
         /* Employees in the age range between 18-29 and 30-39 having more attrition.*/
		 
===================================================================================================>

-- Relation between Salary and Attrition.

Select percentsalaryhike, count(*) as attrition_count
from hr_data
where attrition = 1
group by percentsalaryhike
order by attrition_count desc;
                    /* Less salary hike will be more attrition count and vice-versa.*/

==================================================================================================>

-- Relation between the environment, relationship satisfaction with attrition.

Select Environmentsatisfaction,RelationshipSatisfaction, count(*) as Attrition_count
from hr_data
where attrition = 1 and MonthlyIncome < (select avg(MonthlyIncome) from hr_data)
 group by Environmentsatisfaction,RelationshipSatisfaction
 order by attrition_count desc
/* Based on the analysis the envirnoment satisfaction ,relationship satisfaction when combine with
   (monthly income < avg(monthly income)having no strong correlation with attrition.*/

==================================================================================================>






