hadoop com.sun.tools.javac.Main *.java
jar cf analysis11.jar *.class
hadoop fs -rm -r -f /project/h1b/analysis11
hadoop jar analysis11.jar Q11 /project/h1b/h1b.csv /project/h1b/analysis11
hadoop fs -cat /project/h1b/analysis11/p* | less
