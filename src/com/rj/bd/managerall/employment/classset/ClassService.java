package com.rj.bd.managerall.employment.classset;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;

public class ClassService {
	Dao dao =new DaoImpl();
	/**
	 * @desc  查询页面数据
	 * @param page
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws InterruptedException 
	 */
	public List<Map<String, Object>> selectValue(int page) throws ClassNotFoundException, SQLException, InterruptedException {
		List<Map<String, Object>> list = selectBanJI(page);
		List<Map<String, Object>> list_value = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			Map<String, Object> value = new HashMap<String, Object>();
			String class_id = (String) map.get("class_id");
			int sum = dao.executeQueryForInt(" select count(*) from import where class_id = '"+class_id+"' ");
			int job = dao.executeQueryForInt(" SELECT COUNT(*) FROM students s,account a WHERE class_id = '"+class_id+"' AND s.UUID=a.UUID AND employment_status = 1 ");
			List<Map<String, Object>> teacher_name = dao.executeQueryForList(" SELECT * FROM zteacher z,teacherlist t WHERE z.tid=t.tid and t.class_id = '"+class_id+"' ");
			Map<String, Object> department_name = dao.executeQueryForMap(" SELECT * FROM class c,school_department d WHERE c.department_id=d.department_id and c.class_id = '"+class_id+"' ");
			DecimalFormat df = new DecimalFormat("0.00"); 
			double job_lv=0;
			if(sum==0){
				job_lv = 0;
			}else{
				job_lv = ((double)job/(double)sum)*100;
			}
			int no_job = sum - job;
			Thread.sleep(100);
			if(teacher_name.size()>0){
				value.put("teacher_name",teacher_name.get(0).get("tname"));//老师名字
				value.put("tid",teacher_name.get(0).get("tid"));//tid
			}else{
				value.put("teacher_name","无");//老师名字
			}
			value.put("class_id",class_id);//班级id
			value.put("class_name",map.get("class_name"));//班级名字
			value.put("sum",sum);//总人数
			value.put("job",job);//就业人数
			value.put("no_job",no_job);//未就业人数
			value.put("job_lv",df.format(job_lv));//就业率;
			value.put("department_name",department_name.get("department_name"));//隶属年纪
			value.put("department_id",department_name.get("department_id"));//隶属年纪
			
			list_value.add(value);
		}
		return list_value;
	}
	/**
	 * @desc  查询班级
	 * @param page
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private List<Map<String, Object>> selectBanJI(int page) throws ClassNotFoundException, SQLException {
		int i = (page-1)*10;
		if(i<0){
			i=0;
		}
		return dao.executeQueryForList(" select * from class  LIMIT ?,?",new int []{Types.INTEGER,Types.INTEGER}, new Object []{i,(i+10)});
	}
	public List<Map<String, Object>> selectXinValue() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList(" select * from school_department ");
	}
	public List<Map<String, Object>> selectTeacherValue() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList(" select * from zteacher ");
	}
	public int selectCountValue() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForInt(" select count(*) from class ");
	}
	public void edit(String class_id, String class_name, String department_id, String tid) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String sql = " update class set class_name= ?,department_id=? where class_id=? ";
		String sql1 = " update teacherlist set tid= ? where class_id=? ";
		dao.executeUpdate(sql,new int []{Types.VARCHAR,Types.VARCHAR,Types.VARCHAR}, new Object []{class_name,department_id,class_id});
		if(tid.equals("无")){
			dao.executeUpdate(sql1,new int []{Types.NULL,Types.VARCHAR}, new Object []{tid,class_id});
		}else{
			List<Map<String,Object>> list = dao.executeQueryForList(" select * from teacherlist where class_id=? ",new int []{Types.VARCHAR}, new Object []{class_id});
			if(list.size()<=0){
				sql1 = " insert into teacherlist values(?,?,?) ";
				dao.executeUpdate(sql1,new int []{Types.VARCHAR,Types.VARCHAR,Types.VARCHAR}, new Object []{UUID.randomUUID().toString(),class_id,tid});
			}else{
				dao.executeUpdate(sql1,new int []{Types.VARCHAR,Types.VARCHAR}, new Object []{tid,class_id});
				}
			
		}
		
	}
	public void saveImportExcel(List<String> columnValuesList,String class_id) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		List<Map<String, Object>> list_examinee_ids = dao.executeQueryForList("select * from import where data_sid=?",new int[]{Types.VARCHAR},new Object []{columnValuesList.get(0)});
		if (list_examinee_ids.size()>0) 
		{
			
			String  sql="  UPDATE IMPORT SET class_id = ? where data_sid=? "; 
			dao.executeUpdate(sql,new int []{Types.VARCHAR,Types.VARCHAR}, new Object []{class_id.trim(),columnValuesList.get(0)});
		}
		List<Map<String, Object>> list_STU = dao.executeQueryForList("select * from students s,account a  where s.UUID=a.UUID AND a.sid = ?"
				,new int[]{Types.VARCHAR},new Object []{columnValuesList.get(0)});
		if (list_STU.size()>0) 
		{
			Map<String,Object> map = dao.executeQueryForMap(" select * from class where class_id = ?",new int[]{Types.VARCHAR},new Object []{columnValuesList.get(0)});
			String  sql="  UPDATE students SET class_id = ? , department_id=? where IDnumber in (select data_IDnumber from import where class_id=? ) ";
			dao.executeUpdate(sql,new int []{Types.VARCHAR,Types.VARCHAR}, new Object []{class_id.trim(),map.get("department_id"),columnValuesList.get(0)});
		}
	}
	/**
	 * @desc  添加班级
	 * @param class_name
	 * @param department_id
	 * @param tid
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	public void add(String class_name, String department_id, String tid) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String class_id = UUID.randomUUID().toString();
		String sql = " insert into class values(?,?,?,?,?,?) ";
		int [] types=new int[6];
		Object []values=new Object[6];
		
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		types[2]=Types.VARCHAR;
		types[3]=Types.NULL;
		types[4]=Types.NULL;
		types[5]=Types.NULL;
		
		values[0]=class_id;
		values[1]=department_id;
		values[2]=class_name;
		dao.executeUpdate(sql, types, values);
		if(!(tid.equals("无"))){
			String sql1 = " insert into teacherlist values(?,?,?) ";
			int [] types1=new int[3];
			Object []values1=new Object[3];
			types1[0]=Types.VARCHAR;
			types1[1]=Types.VARCHAR;
			types1[2]=Types.VARCHAR;
		
			values1[0]=UUID.randomUUID().toString();
			values1[1]=class_id;
			values1[2]=tid;
			dao.executeUpdate(sql1, types1, values1);
		}
	}
	
	public void delete(String class_id) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
//		dao.executeUpdate(" UPDATE IMPORT SET class_id=? where class_id=?  ",new int []{Types.NULL,Types.VARCHAR}, new Object []{"",class_id.trim()});
//		dao.executeUpdate(" UPDATE student SET class_id=? where class_id=?  ",new int []{Types.NULL,Types.VARCHAR}, new Object []{"",class_id.trim()});
	}

}
