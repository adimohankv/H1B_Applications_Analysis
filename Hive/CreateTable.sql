CREATE TABLE h1b(s_no int,
		case_status string,
		employer_name string, 
		soc_name string, 
		job_title string, 
		full_time_position string,
		prevailing_wage int,
		year string, 
		worksite string, 
		longitute double, 
		latitute double )
 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
 
WITH SERDEPROPERTIES (
 
"separatorChar" = ",",
 
"quoteChar" = "\""
 
)
tblproperites ('skip.header.line.count'='1') 
STORED AS TEXTFILE;

load data inpath '/project/h1b/h1b_applications.csv' overwrite into table h1b;