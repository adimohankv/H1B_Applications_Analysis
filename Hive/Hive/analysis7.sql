-- Find the most popular top 10 job positions for H1B visa applications for each year?

select h1b.job_title,count(h1b.job_title) as no_of_applications,h1b.year from h1b where h1b.year='2011' group by h1b.job_title order by no_of_applications desc limit 10;

set hive.cli.print.header=false;

select h1b.job_title,count(h1b.job_title) as no_of_applications,h1b.year from h1b where h1b.year='2012' group by h1b.job_title order by no_of_applications desc limit 10;
select h1b.job_title,count(h1b.job_title) as no_of_applications,h1b.year from h1b where h1b.year='2013' group by h1b.job_title order by no_of_applications desc limit 10;
select h1b.job_title,count(h1b.job_title) as no_of_applications,h1b.year from h1b where h1b.year='2014' group by h1b.job_title order by no_of_applications desc limit 10;
select h1b.job_title,count(h1b.job_title) as no_of_applications,h1b.year from h1b where h1b.year='2015' group by h1b.job_title order by no_of_applications desc limit 10;
select h1b.job_title,count(h1b.job_title) as no_of_applications,h1b.year from h1b where h1b.year='2016' group by h1b.job_title order by no_of_applications desc limit 10;

