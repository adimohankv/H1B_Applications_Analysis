//package analysis5;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
//import org.apache.hadoop.mapreduce.Mapper.Context;

public class MapClass extends Mapper<LongWritable,Text,Text,IntWritable>{
	public void map(LongWritable key,Text value,Context context) throws IOException, InterruptedException{
		String[] parts = value.toString().split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)");
		String industry = parts[3];
		String job = parts[4];
		int count = 1;
		if(job.equals("\"DATA SCIENTIST\"")){
			context.write(new Text(industry),new IntWritable(count));
		}
	}
}