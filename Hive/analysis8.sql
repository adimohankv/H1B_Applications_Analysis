--Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.

create table total(total int,year string)
row format delimited 
fields terminated by ',';
insert overwrite table total select count(*) from h1b where h1b.case_status is not NULL;

select a.case_status,count(*) as case_total,a.year,ROUND((count(*)/b.total)*100,2) as perOfCase_status from h1b a left outer join total b on (a.year=b.year) where a.year is not NULL group by a.case_status,b.total,a.year order by a.year;