#!/bin/bash 
show_menu()
{
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**********************H1B APPLICATIONS***********************${NORMAL}"
    echo -e "${MENU}${NUMBER} 1) ${MENU} Is the number of petitions with Data Engineer job title increasing over time?${NORMAL}"
    echo -e "${MENU}${NUMBER} 2) ${MENU} Find top 5 job titles who are having highest growth in applications. ${NORMAL}"
    echo -e "${MENU}${NUMBER} 3) ${MENU} Which part of the US has the most Data Engineer jobs for each year? ${NORMAL}"
    echo -e "${MENU}${NUMBER} 4) ${MENU} find top 5 locations in the US who have got certified visa for each year.${NORMAL}"
    echo -e "${MENU}${NUMBER} 5) ${MENU} Which industry has the most number of Data Scientist positions?${NORMAL}"
    echo -e "${MENU}${NUMBER} 6) ${MENU} Which top 5 employers file the most petitions each year? ${NORMAL}"
    echo -e "${MENU}${NUMBER} 7) ${MENU} Find the most popular top 10 job positions for H1B visa applications for each year?${NORMAL}"
    echo -e "${MENU}${NUMBER} 8) ${MENU} Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.${NORMAL}"
    echo -e "${MENU}${NUMBER} 9) ${MENU} Create a bar graph to depict the number of applications for each year${NORMAL}"
    echo -e "${MENU}${NUMBER} 10) ${MENU}Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order${NORMAL}"
    echo -e "${MENU}${NUMBER} 11) ${MENU} Which are employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?${NORMAL}"
    echo -e "${MENU}${NUMBER} 12) ${MENU} Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000? ${NORMAL}"
    echo -e "${MENU}${NUMBER} 13) ${MENU}Export result for option no 12 to MySQL database.${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() 
{
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE="$1"  #modified to post the correct option selected
    echo -e "${COLOR}${MESSAGE}${RESET}"
}
clear
show_menu
while [ opt != '' ]
do
	if [[ $opt = "" ]]; then 
            exit;
    	else
    	start-dfs.sh
    	start-yarn.sh
    	Pig/start-jobhistory.sh
    	sleep 6
    	location=$(locate h1b_kaggle.csv) # finds the file 
    	hadoop fs -mkdir -p /project/h1b # create dir
    	hadoop fs -copyFromLocat $location /project/h1b/h1b.csv #copy to hdfs 
    	hadoop fs -cp /project/h1b/h1b.csv /project/h1b/h1b_applications.csv # for hive 
    	hive -f Hive/CreateTable.sql
        case $opt in
		1) clear;
			option_picked "1 Is the number of petitions with Data Engineer job title increasing over time?";
			(cd MapReduce/src/analysis1/analysis1.sh)
			show_menu;
		;;
		2) clear;
			option_picked "2 Find top 5 job titles who are having highest growth in applications. ";
			hadoop fs -rm -r /project/h1b/analysis2
			pig Pig/analysis2.pig
			hadoop fs -cat /project/h1b/analysis2/*
			show_menu;
		;;  
		3) clear;
			option_picked "3 Which part of the US has the most Data Engineer jobs for each year?";      
			hadoop fs -rm -r /project/h1b/analysis3
			pig Pig/analysis3.pig
			hadoop fs -cat /project/h1b/analysis3/*
			show_menu;
		;;
		4) clear;
			option_picked "4 find top 5 locations in the US who have got certified visa for each year.";
			hadoop fs -rm -r /project/h1b/analysis4
			pig Pig/analysis4.pig
			hadoop fs -cat /project/h1b/analysis4/*
			show_menu;
		;;  
		5) clear;
			option_picked "5) Which industry has the most number of Data Scientist positions?";
			(cd MapReduce/src/analysis5.sh)
			show_menu;
		;;
		6) clear;
			option_picked "6)Which top 5 employers file the most petitions each year?";
			hive -f Hive/analysis6.sql > analysis6.csv
			cat analysis6.csv
			rm analysis6.csv
			show_menu;
		;;
		7) clear;
			option_picked "7) Find the most popular top 10 job positions for H1B visa applications for each year?";
			echo -e "Do you wish to see 1. The entire result \n2. Year wise result\n"
			read 'choose option 1 or 2 ' choice
			while [$choice != '1'] || [$choice != '2']
			do
				echo -e "Do you wish to see 1. The entire result \n2. Year wise result\n"
				read 'choose option 1 or 2 ' choice
			done
			if [$choice == '1']
			then 
				hive -f Hive/analysis7.sql > analysis7.csv
				cat analysis7.csv
				rm analysis7.csv
			else
				echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
				read var
				echo "Find the most popular top 10 job positions for H1B visa applications for each year?";
		    		hive -e "select job_title,year,count(case_status ) as temp from h1b_applications where year= $var group by job_title,year  order by temp desc limit 10; "
			fi
			show_menu;
		;;
		8) clear;
			option_picked "8) Find the percentage and the count of each case status on total applications for each year.";
			Hive/analysis8.sql > analysis8.csv
			cat analysis8.csv 
			rm analysis8.csv
			show_menu;
		;;
		9) clear;
			option_picked "9) The number of applications for each year";
			hive -e "select year,count(*) as applications  from h1b_applications group by  year;"
			show_menu;
		;;
		10) clear;
			option_picked "10) Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order";
			hadoop fs -rm -r /project/h1b/analysis10
			Pig/analysis10.pig
			hadoop fs -cat /project/h1b/analysis10/* | less
			show_menu;
		;;
		11) clear;
			option_picked "11) Which are   employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?"
			(cd MapReduce/src/analysis11/analysis11.sh)
			show_menu;
		;;
		12) clear;
			option_picked "12) Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000?"
			(cd MapReduce/src/analysis12/analysis12.sh)
			show_menu;
		;;
		13) clear;
			option_picked "11) Export result for question no 10 to MySql database."
			echo "Please enter your MySql database details"
			read -p 'username: ' user
			read -sp 'password: ' password
			echo
			mysql -u $user -p"$password" -e 'create database if not exists project;use project;drop table if exists h1b_analysis12;create table h1b_analysis12(employee_name varchar(100),total_application int,success_rate varchar(40));
			exit;'
			sqoop export --connect jdbc:mysql://localhost/project --username $user --password "$password" --table h1b_analysis12 --update-mode allowinsert --update-key employee_name --export-dir /project/h1b/analysis12/* --input-fields-terminated-by '\t' ;
			mysql -u $user -p"$password" -e 'use project;select * from h1b_analysis12;'
			show_menu;
		;;
		\n) exit;   
		;;
		*) clear;
		option_picked "Pick an option from the menu";
		show_menu;
		;;
        esac
fi
done
