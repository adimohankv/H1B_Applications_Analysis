REGISTER /home/hduser/Downloads/Project/H1B/Pig/piggybank.jar;
DEFINE CSVExcelStorage org.apache.pig.piggybank.storage.CSVExcelStorage();
h1b = load '/project/h1b/h1b.csv' using CSVExcelStorage(',') as (s_no:int,case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray,prevailing_wage:int,year:chararray, worksite:chararray, longitute:double, latitute:double); 

h1b1 = filter h1b by $1 != 'CASE_STATUS';
h1b2 = filter h1b1 by $4 == 'DATA ENGINEER';

h1b_required = foreach h1b2 generate $8,$7;
h1b_2011 = filter h1b_required by $1=='2011';
h1b_2012 = filter h1b_required by $1=='2012';
h1b_2013 = filter h1b_required by $1=='2013';
h1b_2014 = filter h1b_required by $1=='2014';
h1b_2015 = filter h1b_required by $1=='2015';
h1b_2016 = filter h1b_required by $1=='2016';


h1b_group1 = group h1b_2011 by ($0,$1);
h1b_group2 = group h1b_2012 by ($0,$1);
h1b_group3 = group h1b_2013 by ($0,$1);
h1b_group4 = group h1b_2014 by ($0,$1);
h1b_group5 = group h1b_2015 by ($0,$1);
h1b_group6 = group h1b_2016 by ($0,$1);

h1b_count1 =  foreach h1b_group1 generate COUNT(h1b_2011.$0),group;
h1b_count2 =  foreach h1b_group2 generate COUNT(h1b_2012.$0),group;
h1b_count3 =  foreach h1b_group3 generate COUNT(h1b_2013.$0),group;
h1b_count4 =  foreach h1b_group4 generate COUNT(h1b_2014.$0),group;
h1b_count5 =  foreach h1b_group5 generate COUNT(h1b_2015.$0),group;
h1b_count6 =  foreach h1b_group6 generate COUNT(h1b_2016.$0),group;

h1b_order1 = order h1b_count1 by $0 desc;
h1b_order2 = order h1b_count2 by $0 desc;
h1b_order3 = order h1b_count3 by $0 desc;
h1b_order4 = order h1b_count4 by $0 desc;
h1b_order5 = order h1b_count5 by $0 desc;
h1b_order6 = order h1b_count6 by $0 desc;  

h1b_limit1 = limit h1b_order1 1;
h1b_limit2 = limit h1b_order2 1;
h1b_limit3 = limit h1b_order3 1;
h1b_limit4 = limit h1b_order4 1;
h1b_limit5 = limit h1b_order5 1;
h1b_limit6 = limit h1b_order6 1;

h1b_union = UNION h1b_limit1,h1b_limit2,h1b_limit3,h1b_limit4,h1b_limit5,h1b_limit6;

store h1b_union into '/project/h1b/analysis3' using PigStorage(','); 

