// ORM class for table 'h1b_analysis12'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Thu Apr 27 16:22:53 IST 2017
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class h1b_analysis12 extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private String employee_name;
  public String get_employee_name() {
    return employee_name;
  }
  public void set_employee_name(String employee_name) {
    this.employee_name = employee_name;
  }
  public h1b_analysis12 with_employee_name(String employee_name) {
    this.employee_name = employee_name;
    return this;
  }
  private Integer total_application;
  public Integer get_total_application() {
    return total_application;
  }
  public void set_total_application(Integer total_application) {
    this.total_application = total_application;
  }
  public h1b_analysis12 with_total_application(Integer total_application) {
    this.total_application = total_application;
    return this;
  }
  private String success_rate;
  public String get_success_rate() {
    return success_rate;
  }
  public void set_success_rate(String success_rate) {
    this.success_rate = success_rate;
  }
  public h1b_analysis12 with_success_rate(String success_rate) {
    this.success_rate = success_rate;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof h1b_analysis12)) {
      return false;
    }
    h1b_analysis12 that = (h1b_analysis12) o;
    boolean equal = true;
    equal = equal && (this.employee_name == null ? that.employee_name == null : this.employee_name.equals(that.employee_name));
    equal = equal && (this.total_application == null ? that.total_application == null : this.total_application.equals(that.total_application));
    equal = equal && (this.success_rate == null ? that.success_rate == null : this.success_rate.equals(that.success_rate));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof h1b_analysis12)) {
      return false;
    }
    h1b_analysis12 that = (h1b_analysis12) o;
    boolean equal = true;
    equal = equal && (this.employee_name == null ? that.employee_name == null : this.employee_name.equals(that.employee_name));
    equal = equal && (this.total_application == null ? that.total_application == null : this.total_application.equals(that.total_application));
    equal = equal && (this.success_rate == null ? that.success_rate == null : this.success_rate.equals(that.success_rate));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.employee_name = JdbcWritableBridge.readString(1, __dbResults);
    this.total_application = JdbcWritableBridge.readInteger(2, __dbResults);
    this.success_rate = JdbcWritableBridge.readString(3, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.employee_name = JdbcWritableBridge.readString(1, __dbResults);
    this.total_application = JdbcWritableBridge.readInteger(2, __dbResults);
    this.success_rate = JdbcWritableBridge.readString(3, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(employee_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(total_application, 2 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(success_rate, 3 + __off, 12, __dbStmt);
    return 3;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(employee_name, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(total_application, 2 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(success_rate, 3 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.employee_name = null;
    } else {
    this.employee_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.total_application = null;
    } else {
    this.total_application = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.success_rate = null;
    } else {
    this.success_rate = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.employee_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, employee_name);
    }
    if (null == this.total_application) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.total_application);
    }
    if (null == this.success_rate) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, success_rate);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.employee_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, employee_name);
    }
    if (null == this.total_application) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.total_application);
    }
    if (null == this.success_rate) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, success_rate);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(employee_name==null?"null":employee_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(total_application==null?"null":"" + total_application, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(success_rate==null?"null":success_rate, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(employee_name==null?"null":employee_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(total_application==null?"null":"" + total_application, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(success_rate==null?"null":success_rate, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 9, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.employee_name = null; } else {
      this.employee_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.total_application = null; } else {
      this.total_application = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.success_rate = null; } else {
      this.success_rate = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.employee_name = null; } else {
      this.employee_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.total_application = null; } else {
      this.total_application = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.success_rate = null; } else {
      this.success_rate = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    h1b_analysis12 o = (h1b_analysis12) super.clone();
    return o;
  }

  public void clone0(h1b_analysis12 o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("employee_name", this.employee_name);
    __sqoop$field_map.put("total_application", this.total_application);
    __sqoop$field_map.put("success_rate", this.success_rate);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("employee_name", this.employee_name);
    __sqoop$field_map.put("total_application", this.total_application);
    __sqoop$field_map.put("success_rate", this.success_rate);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("employee_name".equals(__fieldName)) {
      this.employee_name = (String) __fieldVal;
    }
    else    if ("total_application".equals(__fieldName)) {
      this.total_application = (Integer) __fieldVal;
    }
    else    if ("success_rate".equals(__fieldName)) {
      this.success_rate = (String) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
  public boolean setField0(String __fieldName, Object __fieldVal) {
    if ("employee_name".equals(__fieldName)) {
      this.employee_name = (String) __fieldVal;
      return true;
    }
    else    if ("total_application".equals(__fieldName)) {
      this.total_application = (Integer) __fieldVal;
      return true;
    }
    else    if ("success_rate".equals(__fieldName)) {
      this.success_rate = (String) __fieldVal;
      return true;
    }
    else {
      return false;    }
  }
}
