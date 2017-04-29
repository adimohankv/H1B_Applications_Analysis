--insert overwrite directory '/project/h1b/Q4Outputa' row format delimited fields terminated by ','
-- Which top 5 employers file the most petitions each year?


select h1b.employer_name,count(h1b.employer_name) as no_of_applications,h1b.year from h1b where h1b.year = '2011' group by h1b.employer_name,h1b.year order by no_of_applications desc limit 10;

set hive.cli.print.header=false;

select h1b.employer_name,count(h1b.employer_name) as no_of_applications,h1b.year from h1b where h1b.year = '2012' group by h1b.employer_name,h1b.year order by no_of_applications desc limit 10;
select h1b.employer_name,count(h1b.employer_name) as no_of_applications,h1b.year from h1b where h1b.year = '2013' group by h1b.employer_name,h1b.year order by no_of_applications desc limit 10;
select h1b.employer_name,count(h1b.employer_name) as no_of_applications,h1b.year from h1b where h1b.year = '2014' group by h1b.employer_name,h1b.year order by no_of_applications desc limit 10;
select h1b.employer_name,count(h1b.employer_name) as no_of_applications,h1b.year from h1b where h1b.year = '2015' group by h1b.employer_name,h1b.year order by no_of_applications desc limit 10;
select h1b.employer_name,count(h1b.employer_name) as no_of_applications,h1b.year from h1b where h1b.year = '2016' group by h1b.employer_name,h1b.year order by no_of_applications desc limit 10;