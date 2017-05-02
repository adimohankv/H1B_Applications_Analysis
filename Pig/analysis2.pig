REGISTER piggybank.jar;
DEFINE CSVExcelStorage org.apache.pig.piggybank.storage.CSVExcelStorage();
h1b = load '/project/h1b/h1b.csv' using CSVExcelStorage(',') as (s_no:int,case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray,prevailing_wage:int,year:chararray, worksite:chararray, longitute:double, latitute:double); 

h1b1 = filter h1b by $1 != 'CASE_STATUS'; 
h1b_required = foreach h1b1 generate $4,$7;
h1b_2011 = filter h1b_required by $1=='2011';
h1b_2012 = filter h1b_required by $1=='2012';
h1b_2013 = filter h1b_required by $1=='2013';
h1b_2014 = filter h1b_required by $1=='2014';
h1b_2015 = filter h1b_required by $1=='2015';
h1b_2016 = filter h1b_required by $1=='2016';


h1b_group1 = group h1b_2011 by $0;
h1b_group2 = group h1b_2012 by $0;
h1b_group3 = group h1b_2013 by $0;
h1b_group4 = group h1b_2014 by $0;
h1b_group5 = group h1b_2015 by $0;
h1b_group6 = group h1b_2016 by $0;

h1b_count1 =  foreach h1b_group1 generate COUNT(h1b_2011.$0),group;
h1b_count2 =  foreach h1b_group2 generate COUNT(h1b_2012.$0),group;
h1b_count3 =  foreach h1b_group3 generate COUNT(h1b_2013.$0),group;
h1b_count4 =  foreach h1b_group4 generate COUNT(h1b_2014.$0),group;
h1b_count5 =  foreach h1b_group5 generate COUNT(h1b_2015.$0),group;
h1b_count6 =  foreach h1b_group6 generate COUNT(h1b_2016.$0),group;

h1b_join = join h1b_count1 by $1,h1b_count2 by $1,h1b_count3 by $1,h1b_count4 by $1,h1b_count5 by $1,h1b_count6 by $1;

h1b_count = foreach h1b_join generate $1,ROUND_TO((((float)($2-$0))*100/$0),2),ROUND_TO((((float)($4-$2))*100/$2),2),ROUND_TO((((float)($6-$4))*100/$4),2),ROUND_TO((((float)($8-$6))*100/$6),2),ROUND_TO((((float)($10-$8))*100/$8),2);
h1b_avg = foreach h1b_count generate $0,($1+$2+$3+$4+$5)/5; 
h1b_order = order h1b_avg by $1 desc;
h1b_top5 = limit h1b_order 5;


store h1b_top5 into '/project/h1b/analysis2' using PigStorage(','); 
