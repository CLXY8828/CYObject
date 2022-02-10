package com.rj.bd.managerall.employment.grade;

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

/**
 * @desc   就业年纪管理c层
 * @author 秋月蓝璃
 */

public class GradeService {
	Dao dao =new DaoImpl();

	public List<Map<String, Object>> selectValue(int page) throws ClassNotFoundException, SQLException, InterruptedException {
		List<Map<String, Object>> list = selectNianJi(page);
		List<Map<String, Object>> list_value = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			Map<String, Object> value = new HashMap<String, Object>();
			String department_id = (String) map.get("department_id");
			int sum = dao.executeQueryForInt(" select count(*) from import where class_id in (select class_id from class where department_id = '"+department_id+"') ");
			int job = dao.executeQueryForInt(" SELECT COUNT(*) FROM students s,account a WHERE department_id = '"+department_id+"' AND s.UUID=a.UUID AND employment_status = 1 ");
			int class_num = dao.executeQueryForInt(" select count(*) from class where department_id = '"+department_id+"' ");
			DecimalFormat df = new DecimalFormat("0.00"); 
			double job_lv=0;
			if(sum==0){
				job_lv = 0;
			}else{
				job_lv = ((double)job/(double)sum)*100;
			}
			int no_job = sum - job;
			Thread.sleep(100);
			value.put("department_id",department_id);
			value.put("department_name",map.get("department_name"));
			value.put("sum",sum);
			value.put("job",job);
			value.put("no_job",no_job);
			value.put("job_lv",df.format(job_lv));
			value.put("class_num",class_num);
			list_value.add(value);
		}
		return list_value;
	}
	/**
	 * @desc  查询年纪
	 * @param page
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> selectNianJi(int page) throws ClassNotFoundException, SQLException {
		int i = (page-1)*10;
		if(i<0){
			i=0;
		}
		return dao.executeQueryForList(" select * from school_department  LIMIT ?,?",new int []{Types.INTEGER,Types.INTEGER}, new Object []{i,(i+10)});
	}
	/**
	 * @desc  编辑
	 * @param department_name
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public void editName(String department_name, String department_id) throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {
		String sql = " update school_department set department_name= ? where department_id=? ";
		int[] types = new int[2];
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		
		Object []values=new Object[2];
		values[0]=department_name;
		values[1]=department_id;
		
		dao.executeUpdate(sql,types, values);
	}
	/**
	 * @desc  添加数据
	 * @param department_name
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	public void addValue(String department_name) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String sql = " insert into school_department values(?,?,?,?,?) ";
		int[] types = new int[5];
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		types[2]=Types.NULL;
		types[3]=Types.NULL;
		types[4]=Types.NULL;
		
		Object []values=new Object[2];
		values[0]=UUID.randomUUID().toString();
		values[1]=department_name;
		
		dao.executeUpdate(sql,types, values);
	}
	/**
	 * @desc  导出就业信息
	 * @param department_id
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Map<String, Object>> selectExportValue(String department_id) throws ClassNotFoundException, SQLException {
			List<Map<String, Object>> list_value = new ArrayList<Map<String, Object>>();
			Map<String, Object> value = new HashMap<String, Object>();
			Map<String, Object> map_name = dao.executeQueryForMap(" select * from school_department where department_id=? ",new int []{Types.VARCHAR}, new Object []{department_id});
			int sum = dao.executeQueryForInt(" select count(*) from import where class_id in (select class_id from class where department_id = '"+department_id+"') ");
			int job = dao.executeQueryForInt(" SELECT COUNT(*) FROM students s,account a WHERE department_id = '"+department_id+"' AND s.UUID=a.UUID AND employment_status = 1 ");
			int class_num = dao.executeQueryForInt(" select count(*) from class where department_id = '"+department_id+"' ");
			DecimalFormat df = new DecimalFormat("0.00"); 
			double job_lv=0;
			if(sum==0){
				job_lv = 0;
			}else{
				job_lv = ((double)job/(double)sum)*100;
			}
			int no_job = sum - job;
			value.put("department_name",map_name.get("department_name"));
			value.put("sum",sum);
			value.put("job",job);
			value.put("no_job",no_job);
			value.put("job_lv",df.format(job_lv));
			value.put("class_num",class_num);
			list_value.add(value);
		return list_value;
	}
	/**
	 * @desc  删除年纪信息
	 * @param department_id
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	public void deleteValue(String department_id) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		dao.executeUpdate(" update import set class_id=? where class_id in (select class_id from class where department_id = ?) ", new int []{Types.NULL,Types.VARCHAR}, new Object []{"",department_id});
		dao.executeUpdate(" delete from teacherlist where class_id in (select class_id from class where department_id = ?) ", new int []{Types.VARCHAR}, new Object []{department_id});
		dao.executeUpdate(" delete from class where department_id=? ", new int []{Types.VARCHAR}, new Object []{department_id});
		dao.executeUpdate(" delete from school_department where department_id=? ", new int []{Types.VARCHAR}, new Object []{department_id});
	}
	/**
	 * @desc  导出年纪下所有就业学生信息
	 * @param department_id
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Map<String, Object>> selectExportStuValue(String department_id) throws ClassNotFoundException, SQLException {
		List<Map<String, Object>> list_job = dao.executeQueryForList(" SELECT * FROM students s,account a WHERE department_id = '"+department_id+"' AND s.UUID=a.UUID AND employment_status = 1 ");
		return list_job;
	}
	/**
	 * @desc  导出年纪下所有未就业学生信息
	 * @param department_id
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Map<String, Object>> selectExportStuNoValue(String department_id) throws ClassNotFoundException, SQLException {
		List<Map<String, Object>> list_nojob = dao.executeQueryForList(" SELECT * FROM IMPORT WHERE class_id IN (SELECT class_id FROM class WHERE department_id = '"+department_id+"') AND data_sid NOT IN (SELECT sid FROM students s,account a WHERE department_id = '"+department_id+"' AND s.UUID=a.UUID AND employment_status = 1)");
		return list_nojob;
	}

}
