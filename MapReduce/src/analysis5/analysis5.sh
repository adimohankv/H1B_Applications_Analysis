hadoop com.sun.tools.javac.Main *.java
jar cf analysis5.jar *.class
hadoop fs -rm -r -f /project/h1b/analysis5
hadoop jar analysis5.jar Q5 /project/h1b/h1b.csv /project/h1b/analysis5
hadoop fs -cat /project/h1b/analysis5/p*
