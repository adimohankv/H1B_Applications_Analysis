REGISTER /home/hduser/Downloads/Project/H1B/piggybank.jar;
DEFINE CSVExcelStorage org.apache.pig.piggybank.storage.CSVExcelStorage();
h1b = load '/project/h1b/h1b.csv' using CSVExcelStorage(',') as (s_no:int,case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray,prevailing_wage:int,year:chararray, worksite:chararray, longitute:double, latitute:double); 

h1b1 = filter h1b by $1 != 'CASE_STATUS';
h1b2 = filter h1b1 by $1 == 'CERTIFIED';

-- for fulltime
h1b3 = filter h1b2 by $5 == 'Y';
h1b_required = foreach h1b2 generate $8,$7,$6;
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

h1b_count1 =  foreach h1b_group1 generate ROUND_TO(AVG(h1b_2011.$2),2),group;
h1b_count2 =  foreach h1b_group2 generate ROUND_TO(AVG(h1b_2012.$2),2),group;
h1b_count3 =  foreach h1b_group3 generate ROUND_TO(AVG(h1b_2013.$2),2),group;
h1b_count4 =  foreach h1b_group4 generate ROUND_TO(AVG(h1b_2014.$2),2),group;
h1b_count5 =  foreach h1b_group5 generate ROUND_TO(AVG(h1b_2015.$2),2),group;
h1b_count6 =  foreach h1b_group6 generate ROUND_TO(AVG(h1b_2016.$2),2),group;

/*h1b_order1 = order h1b_count1 by $0 desc;
h1b_order2 = order h1b_count2 by $0 desc;
h1b_order3 = order h1b_count3 by $0 desc;
h1b_order4 = order h1b_count4 by $0 desc;
h1b_order5 = order h1b_count5 by $0 desc;
h1b_order6 = order h1b_count6 by $0 desc;  

h1b_limit1 = limit h1b_order1 5;
h1b_limit2 = limit h1b_order2 5;
h1b_limit3 = limit h1b_order3 5;
h1b_limit4 = limit h1b_order4 5;
h1b_limit5 = limit h1b_order5 5;
h1b_limit6 = count h1b_order6 5;
*/
h1b_union_y = UNION h1b_count1,h1b_count2,h1b_count3,h1b_count4,h1b_count5,h1b_count6;
h1b_order_y = order h1b_union_y by $0 desc;

-- for parttime

h1b3 = filter h1b2 by $5 == 'N';
h1b_required = foreach h1b2 generate $8,$7,$6;
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

h1b_count1 =  foreach h1b_group1 generate ROUND_TO(AVG(h1b_2011.$2),2),group;
h1b_count2 =  foreach h1b_group2 generate ROUND_TO(AVG(h1b_2012.$2),2),group;
h1b_count3 =  foreach h1b_group3 generate ROUND_TO(AVG(h1b_2013.$2),2),group;
h1b_count4 =  foreach h1b_group4 generate ROUND_TO(AVG(h1b_2014.$2),2),group;
h1b_count5 =  foreach h1b_group5 generate ROUND_TO(AVG(h1b_2015.$2),2),group;
h1b_count6 =  foreach h1b_group6 generate ROUND_TO(AVG(h1b_2016.$2),2),group;


h1b_union_n = UNION h1b_count1,h1b_count2,h1b_count3,h1b_count4,h1b_count5,h1b_count6;
h1b_order_n = order h1b_union_n by $0 desc;

---union of those

h1b_union = union h1b_union_y,h1b_union_n;

dump h1b_union;

