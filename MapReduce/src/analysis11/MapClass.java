//package analysis11;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
//import org.apache.hadoop.mapreduce.Mapper.Context;

public class MapClass extends Mapper<LongWritable,Text,Text,Text>{
	public void map(LongWritable key,Text value,Context context) throws IOException, InterruptedException{
		String[] parts = value.toString().split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)");
		String status = parts[1];
		String employer = parts[2];
		context.write(new Text(employer), new Text(status));
	}
}
