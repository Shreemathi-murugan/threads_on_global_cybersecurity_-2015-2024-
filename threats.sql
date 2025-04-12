create table threats(Country varchar(30),
Year int,
Attack_Type varchar(50),
Target_Industry	varchar(40),
Financial_Loss_in_Million_ float,
Number_of_Affected_Users int,
Attack_Source varchar(50),
Security_Vulnerability_Type varchar(50),
Defense_Mechanism_Used varchar(40),
Incident_Resolution_Time_in_Hours int
)

select * from threats

--Total Attacks per Year
select year,count(*) as Total_Attacks
from threats group by Year order by Year;

--Top 5 Countries by Financial Loss
select country, sum(Financial_Loss_in_Million_) as Total_loss
from threats group by country
order by Total_loss desc
limit 5;

--Most Common Attack types

select attack_type, count(*) as Common_Attacks
from threats group by attack_type 
order by Common_Attacks desc;

--Industry-wise Attack Impact

select target_industry, count(*) as affected_industry,
sum(Financial_Loss_in_Million_) as losses_of_industry
from threats
group by target_industry
order by losses_of_industry desc;

--Defense Effectiveness(Average Resolution time)

select Defense_Mechanism_Used, count(*) as defense_used,
avg(Incident_Resolution_Time_in_Hours) as resolution_time
from threats
group by Defense_Mechanism_Used
order by resolution_time;

--Loss per user
 
SELECT Country, Year,
       SUM(Financial_Loss_in_Million_) / SUM(Number_of_Affected_Users) AS Loss_Per_User
FROM Threats
WHERE Number_of_Affected_Users > 0
GROUP BY Country, Year
ORDER BY Loss_Per_User DESC;


drop table threats