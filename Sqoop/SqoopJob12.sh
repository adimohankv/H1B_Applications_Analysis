mysql -u root -p'root' -e 'create database if not exists project;use project;drop table if exists h1b_analysis12;create table h1b_analysis12(employee_name varchar(100),total_application int,success_rate varchar(40));
exit;'

sqoop export --connect jdbc:mysql://localhost/project --username root --password 'root' --table h1b_analysis12 --update-mode allowinsert --update-key employee_name --export-dir /project/h1b/output33/* --input-fields-terminated-by '\t' ;

mysql -u root -p'root' -e 'use project;select * from h1b_analysis12;'
