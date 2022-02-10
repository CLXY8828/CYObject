package com.rj.bd.managerall.management;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;
/**
 * @desc   权限管理C层
 * @author 28619
 *
 */
public class ManageService {

	Dao dao =new DaoImpl();

	public List<Map<String, Object>> query(String queryinfo, String queryCondition,int page) throws ClassNotFoundException, SQLException {
		System.out.println("queryqueryqueryquery+"+page);
		String sql = null;
		int i = (page-1)*10;
		if(i<0){
			i=0;
		}
		if(queryinfo==null){
			queryinfo="";
		}
		if(queryCondition==null){
			queryCondition="";
		}
		if(queryinfo.equals("")||queryCondition.equals("")){
			return dao.executeQueryForList("select * from admin where admin_have != 0 limit ?,? ", new int []{Types.INTEGER,Types.INTEGER},new Object[]{i,(i+10)});
		}else if (queryinfo.equals("name")) {
			sql="select * from admin where admin_name like ? and admin_have != 0 limit ?,? ";
		}else if (queryinfo.equals("author")) {
			if (queryCondition.contains("就业")) {
				queryCondition="1";
			}else if (queryCondition.contains("专业")) {
				queryCondition="2";
			}
			sql="select * from admin where admin_have = ? and admin_have != 0 limit ?,? ";
			return dao.executeQueryForList(sql, new int []{Types.VARCHAR,Types.INTEGER,Types.INTEGER},new Object[]{queryCondition,i,(i+10)});
		}
		
		return dao.executeQueryForList(sql,new int []{Types.VARCHAR,Types.INTEGER,Types.INTEGER},new Object[]{"%"+queryCondition+"%",i,(i+10)});
	}
		
	public void add(String name, String account,String password , String auth) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		System.out.println("传值");
		String admin_id=UUID.randomUUID().toString();
		String id=UUID.randomUUID().toString();
		String tid=UUID.randomUUID().toString();
		String sql1="insert into admin values('"+admin_id+"','"+name+"','"+account+"','"+password+"','"+auth+"','"+""+"')";
		String sql2="insert into admin_teacher values('"+id+"','"+tid+"','"+admin_id+"')";
		String sql3="insert into zteacher values('"+tid+"','"+name+"')";
		
		dao.executeUpdate(sql1);
		dao.executeUpdate(sql3);
		dao.executeUpdate(sql2);
	}

	public void editauth(String editid, String teacherset, String classchose) throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {
		
		String sql="update admin set admin_have = ? where admin_id = ?";
		String sql2="update teacherlist set class_id = ? where tid = (select tid from admin_teacher where admin_id = ?)";
		
//		if(teacherset.equals("1")){
		dao.executeUpdate(sql,new int[]{Types.VARCHAR,Types.VARCHAR},new Object[]{teacherset,editid});
//		}
//		else if (teacherset.equals("2")) {
//			int[] types = new int[2];
//			types[0]=Types.VARCHAR;
//			types[1]=Types.VARCHAR;
//			
//			Object[] values=new Object[2];
//			values[0]=teacherset;
//			values[1]=classchose;
//			dao.executeUpdate(sql2, types,values);
//		}
	}

	public void edit(String editid, String name, String account, String password, String email) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		String sql="update admin set admin_name = ? , admin_UUID = ? , admin_password = ? where admin_id = ?";
		
		int[] types = new int[4];
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		types[2]=Types.VARCHAR;
		types[3]=Types.VARCHAR;
		
		Object[] values=new Object[4];
		values[0]=name;
		values[1]=account;
		values[2]=password;
		values[3]=editid;
		
		dao.executeUpdate(sql, types, values);
	}

	public void delete(String deleteid) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		String sql="delete from admin_teacher where admin_id = ? ";
		String sql3="delete from admin where admin_id = ? ";
		
		int[] types = new int[1];
		types[0]=Types.VARCHAR;
		
		Object[] values=new Object[1];
		values[0]=deleteid;
		Map<String,Object> map = dao.executeQueryForMap(" select tid from admin_teacher where admin_id = ? ", types, values);
		String sql2="delete from teacherlist where tid = '"+map.get("tid")+"'";
		String sql4="delete from zteacher where tid = '"+map.get("tid")+"'";
		List<Map<String,Object>> list = dao.executeQueryForList("select * from teacherlist where tid ='"+map.get("tid")+"'");
		dao.executeUpdate(sql, types, values);
		System.out.println(1);
		if(list.size()>=0){
			dao.executeUpdate(sql2);
			System.out.println(2);
		}
		dao.executeUpdate(sql3, types, values);
		System.out.println(3);
		dao.executeUpdate(sql4);
		System.out.println(4);
		
	}

	public int selectCount(String queryCondition, String queryinfo) throws ClassNotFoundException, SQLException {
		String sql = null;
		if(queryinfo==null){
			queryinfo="";
		}
		if(queryCondition==null){
			queryCondition="";
		}
		if(queryinfo.equals("")||queryCondition.equals("")){
			return dao.executeQueryForInt(" select count(*) from admin where admin_have != 0 ");
		}else if (queryinfo.equals("name")) {
			sql=" select count(*) from admin where admin_name like ? and admin_have != 0  ";
		}else if (queryinfo.equals("author")) {
			if (queryCondition.contains("就业")) {
				queryCondition="1";
			}else if (queryCondition.contains("专业")) {
				queryCondition="2";
			}
			sql="select count(*) from admin where admin_have = ? and admin_have != 0  ";
			return dao.executeQueryForInt(sql, new int []{Types.VARCHAR},new Object[]{queryCondition});
		}
		
		return dao.executeQueryForInt(sql,new int []{Types.VARCHAR},new Object[]{"%"+queryCondition+"%"});
	}
	
	public List<Map<String, Object>> queryclass() throws ClassNotFoundException, SQLException {
		
		return dao.executeQueryForList("select * from class");
	}
}
