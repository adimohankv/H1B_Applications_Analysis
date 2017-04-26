package analysis1;

import java.io.IOException;

import org.apache.hadoop.io.*;
import org.apache.hadoop.mapreduce.Mapper;


class MapClass extends Mapper<LongWritable,Text,Text,IntWritable>{
	public void map(LongWritable key,Text value,Context context) throws IOException, InterruptedException{
		String[] parts = value.toString().split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)");
		String year = parts[7];
		String job = parts[4];
		int count = 1;
		if(job.equals("\"DATA ENGINEER\"")){
			context.write(new Text(year),new IntWritable(count));
		}
	}
}
