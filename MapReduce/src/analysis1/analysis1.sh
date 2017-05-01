hadoop com.sun.tools.javac.Main *.java
jar cf analysis1.jar *.class
hadoop fs -rm -r -f /project/h1b/analysis1
hadoop jar analysis1.jar Q1 /project/h1b/h1b.csv /project/h1b/analysis1
echo -e "1. Is the number of petitions with Data Engineer job title increasing over time?\n\n"
hadoop fs -cat /project/h1b/analysis1/p*
