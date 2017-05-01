hadoop com.sun.tools.javac.Main *.java
jar cf analysis12.jar *.class
hadoop fs -rm -r -f /project/h1b/analysis12
hadoop jar analysis12.jar Q12 /project/h1b/h1b.csv /project/h1b/analysis12
hadoop fs -cat /project/h1b/analysis12/p* | less
