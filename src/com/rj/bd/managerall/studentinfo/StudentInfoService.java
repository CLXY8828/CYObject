package com.rj.bd.managerall.studentinfo;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;

public class StudentInfoService {
	Dao dao =new DaoImpl();

	/**
	 * @desc  批量注册的查询
	 * @param page
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> selectImportValue(String queryCondition,String query_select,int page) throws ClassNotFoundException, SQLException {
		String sql="";
		int i = (page-1)*10;
		if(i<0){
			i=0;
		}
		if (query_select==null) {
			query_select="";
		} 
		if (queryCondition==null) {
			queryCondition="";
		}
		if(query_select.equals("")||queryCondition.equals("")){
			return dao.executeQueryForList("select * from import limit ?,? ", new int []{Types.INTEGER,Types.INTEGER}, new Object []{i,(i+10)});
		}else if (query_select.equals("name")) {
			sql="select * from import where data_sname like ? limit ?,?  ";
		}else if (query_select.equals("stu_id")) {
			sql="select * from import where data_sid like ?  limit ?,? ";
		}
		return dao.executeQueryForList(sql,new int []{Types.VARCHAR,Types.INTEGER,Types.INTEGER},new Object[]{"%"+queryCondition+"%",i,(i+10)});
	}

	/**
	 * @desc  批量注册删除
	 * @param student_id
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public void deleteByIds(String student_id) throws ClassNotFoundException, SQLException {

		dao.executeUpdate(" delete from import where data_id='"+student_id+"' ");
	}

	/**
	 * @desc  批量注册修改
	 * @param data_sname
	 * @param data_id2 
	 * @param data_sid 
	 * @param data_registeraddress 
	 * @param data_examid 
	 * @param data_IDnumber 
	 * @param data_qq 
	 * @param data_homephone 
	 * @param data_scrollnum 
	 * @param data_class 
	 * @param data_id2 
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	public void editValue(String data_sname, String data_sex, String data_nation, String data_class,
			String data_scrollnum, String data_homephone, String data_qq, String data_IDnumber, String data_examid,
			String data_registeraddress, String data_sid, String data_id) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {	
		
		String sql="UPDATE IMPORT SET data_sname=? , data_sex=? , data_nation=?, data_class=? ,data_scrollnum=?, data_homephone=? , data_qq=? , data_IDnumber=? ,data_examid=?, data_registeraddress=?, data_sid=?  WHERE data_id=? ";
		
		int [] types=new int [12];
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		types[2]=Types.VARCHAR;
		types[3]=Types.VARCHAR;
		types[4]=Types.VARCHAR;
		types[5]=Types.VARCHAR;
		types[6]=Types.VARCHAR;
		types[7]=Types.VARCHAR;
		types[8]=Types.VARCHAR;
		types[9]=Types.VARCHAR;
		types[10]=Types.VARCHAR;
		types[11]=Types.VARCHAR;
		
		Object []values=new Object[12];
		values[0]=data_sname;
		values[1]=data_sex;
		values[2]=data_nation;
		values[3]=data_class;
		values[4]=data_scrollnum;
		values[5]=data_homephone;
		values[6]=data_qq;
		values[7]=data_IDnumber;
		values[8]=data_examid;
		values[9]=data_registeraddress;
		values[10]=data_sid;
		values[11]=data_id;
		
		dao.executeUpdate(sql, types, values);
	}

	/**
	 * @desc  批量删除的查询
	 * @param page
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> selectdeletValue(String queryCondition,String query_select,int page) throws ClassNotFoundException, SQLException {
		String sql="";
		int i = (page-1)*10;
		if(i<0){
			i=0;
		}
		if (query_select==null) {
			query_select="";
		} 
		if (queryCondition==null) {
			queryCondition="";
		}
		if(query_select.equals("")||queryCondition.equals("")){
			return dao.executeQueryForList("select * from import limit ?,? ", new int []{Types.INTEGER,Types.INTEGER}, new Object []{i,(i+10)});
		}else if (query_select.equals("name")) {
			sql="select * from import where data_sname like ? limit ?,?  ";
		}else if (query_select.equals("stu_id")) {
			sql="select * from import where data_sid like ?  limit ?,? ";
		}
		return dao.executeQueryForList(sql,new int []{Types.VARCHAR,Types.INTEGER,Types.INTEGER},new Object[]{"%"+queryCondition+"%",i,(i+10)});
	}

	/**
	 * @desc  批量删除的删除
	 * @param student_id
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public void dedeleteByIds(String[] delArray) throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {
		
		 for(int i =0;i<delArray.length;i++)
	     {
			 String sql=" delete from import where data_id=? ";
			 dao.executeUpdate(sql, new int []{Types.VARCHAR}, new Object []{delArray[i]});
	     }
	}
	/**
	 * @desc  单挑删除
	 * @param student_id
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public void dedeleteByIds(String student_id) throws ClassNotFoundException, SQLException {
		
		dao.executeUpdate(" delete from import where data_id='"+student_id+"' ");
	}
	/**
	 * @desc  导入数据
	 * @param columnValuesList
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	public void saveImportExcel(List<String> columnValuesList) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		List<Map<String, Object>> list_examinee_ids = dao.executeQueryForList("select * from import where data_sid=?",new int[]{Types.VARCHAR},new Object []{columnValuesList.get(0)});
		if (list_examinee_ids.size()<=0) 
		{
			String  sql="  insert into import values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)  ";
			int [] types=new int[14];
			Object []values=new Object[14];
			types[0]=Types.VARCHAR;
			types[1]=Types.NULL;
			types[2]=Types.VARCHAR;
			types[3]=Types.VARCHAR;
			types[4]=Types.VARCHAR;
			types[5]=Types.VARCHAR;
			types[6]=Types.VARCHAR;
			types[7]=Types.VARCHAR;
			types[8]=Types.VARCHAR;
			types[9]=Types.VARCHAR;
			types[10]=Types.VARCHAR;
			types[11]=Types.VARCHAR;
			types[12]=Types.VARCHAR;
			types[13]=Types.VARCHAR;
			
			values[0]=UUID.randomUUID().toString();;//id
			values[1]="";//class_id
			values[2]=columnValuesList.get(0);//学号
			values[3]=columnValuesList.get(1);//姓名
			values[4]=columnValuesList.get(2);//身份证号
			values[5]=columnValuesList.get(3);//考生号
			values[6]=columnValuesList.get(4);//户籍所在地
			values[7]=columnValuesList.get(5);//性别
			values[8]=columnValuesList.get(6);//班级
			values[9]=columnValuesList.get(7);//家庭联系方式
			values[10]=columnValuesList.get(8);//学籍号
			values[11]=columnValuesList.get(9);//民族
			values[12]=columnValuesList.get(10);//qq
			values[13]=0;
			
			dao.executeUpdate(sql, types, values);
		}
		}

	public void singileAdd(String data_sid, String data_sname, String data_IDnumber, String data_examid,
			String data_registeraddress, String data_sex, String data_class, String data_homephone,
			String data_scrollnum, String data_nation, String data_qq) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String  sql="  insert into import values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)  ";
		int [] types=new int[14];
		Object []values=new Object[14];
		types[0]=Types.VARCHAR;
		types[1]=Types.NULL;
		types[2]=Types.VARCHAR;
		types[3]=Types.VARCHAR;
		types[4]=Types.VARCHAR;
		types[5]=Types.VARCHAR;
		types[6]=Types.VARCHAR;
		types[7]=Types.VARCHAR;
		types[8]=Types.VARCHAR;
		types[9]=Types.VARCHAR;
		types[10]=Types.VARCHAR;
		types[11]=Types.VARCHAR;
		types[12]=Types.VARCHAR;
		types[13]=Types.VARCHAR;
		
		values[0]=UUID.randomUUID().toString();;//id
		values[1]="";//class_id
		values[2]=data_sid;//学号
		values[3]=data_sname;//姓名
		values[4]=data_IDnumber;//身份证号
		values[5]=data_examid;//考生号
		values[6]=data_registeraddress;//户籍所在地
		values[7]=data_sex;//性别
		values[8]=data_class;//班级
		values[9]=data_homephone;//家庭联系方式
		values[10]=data_scrollnum;//学籍号
		values[11]=data_nation;//民族
		values[12]=data_qq;//qq
		values[13]=0;
		dao.executeUpdate(sql, types, values);
	}
	/**
	 * @desc  数据得总数查询
	 * @param queryCondition
	 * @param query_select
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public int selectCount(String queryCondition, String query_select) throws ClassNotFoundException, SQLException {
		String sql="";
		if (query_select==null) {
			query_select="";
		} 
		if (queryCondition==null) {
			queryCondition="";
		}
		if(query_select.equals("")||queryCondition.equals("")){
			return dao.executeQueryForInt("select count(*) from import ");
		}else if (query_select.equals("name")) {
			sql="select count(*) from import where data_sname like ?  ";
		}else if (query_select.equals("stu_id")) {
			sql="select count(*) from import where data_sid like ?  ";
		}
		return dao.executeQueryForInt(sql,new int []{Types.VARCHAR},new Object[]{"%"+queryCondition+"%"});
	}
}
	

