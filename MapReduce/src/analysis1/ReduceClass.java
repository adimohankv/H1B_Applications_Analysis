//package analysis1;

import java.io.IOException;

import org.apache.hadoop.io.*;
import org.apache.hadoop.mapreduce.Reducer;
//import org.apache.hadoop.mapreduce.Reducer.Context;

public class ReduceClass extends Reducer<Text,IntWritable,Text,Text>{
	int yearbefore = 0;
	String growth = "N.A";
	String output = " ";
	public void reduce(Text key,Iterable<IntWritable> value,Context context) throws IOException, InterruptedException{
		int count = 0;
		double growthper= 0; 
		for (IntWritable val:value){
			count += val.get();
		}
		if(yearbefore!=0){
			growthper = ((double)(count-yearbefore)/yearbefore)*100;
			String.format("%.2f %%",growthper);
		}
		output = String.format("%d", count)+","+growth;
		yearbefore = count;
		
		context.write(key,new Text(output));
	}
}
