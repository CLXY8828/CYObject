package com.rj.bd.logein;

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
 * @desc 登录页面M层
 * @author mengjinfu
 * @time 2021-12-20 
 */
public class LogeinService {
	Dao dao = new DaoImpl();

	/**
	 * @desc 通过sid查询数据库中的账号
	 * @param sid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Map<String, Object> executeaccountForSid(String sid) throws ClassNotFoundException, SQLException {
		String sql = "select * from account where sid=?";
		return dao.executeQueryForMap(sql, new int[]{Types.VARCHAR}, new Object[]{sid});
	}

	/**
	 * @desc 通过手机号查询数据库中的账号
	 * @param phonenumber
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Map<String, Object> queryByPhone(String phonenumber) throws ClassNotFoundException, SQLException {
		String sql ="select * from account where phone=?";
		
		return dao.executeQueryForMap(sql, new int[]{Types.VARCHAR}, new Object[]{phonenumber});
	}

	
	/**
	 * @desc 创建一个新的用户（手机号注册）
	 * @param phonenumber
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	public void newUserByPhone(String phonenumber) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		List<Map<String, Object>> elist = dao.executeQueryForList("select * from employment");
		UUID userid = UUID.randomUUID();
		String sql="insert into account values(?,?,?,?,?,?,?,?,?)";
		int[] types = new int[9];
		types[0]=Types.VARCHAR;
		types[1]=Types.INTEGER;
		types[2]=Types.NULL;
		types[3]=Types.NULL;
		types[4]=Types.VARCHAR;
		types[5]=Types.INTEGER;
		types[6]=Types.NULL;
		types[7]=Types.INTEGER;
		types[8]=Types.NULL;
		
		Object[] values = new Object[9];
		
		values[0]=userid;
		values[1]=1;
		values[2]="null";
		values[3]="null";
		values[4]=phonenumber;
		values[5]=0;
		values[6]="null";
		values[7]=0;
		values[8]="null";
		
		dao.executeUpdate(sql, types, values);
		for ( Map<String, Object> map : elist) {
			dao.executeUpdate("insert into employmentapply values('"+map.get("eid")+"','"+userid+"',"+Integer.valueOf(0)+","+Integer.valueOf(0)+",'','','')");
		}
		
	}

	public Map<String, Object> queryAdmin(String sid, String password) throws ClassNotFoundException, SQLException {
		return dao.executeQueryForMap("select * from admin where admin_UUID=? and admin_password=?", new int[]{Types.VARCHAR,Types.VARCHAR},new Object[]{sid,password});
	}

	/**
	 * @desc 查询用户是否完善信息
	 * @param sid
	 * @return 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Map<String, Object>> executewsForUUID(String UUID) throws ClassNotFoundException, SQLException {
		
		String sql = "select * from students where UUID=?";
		return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, new Object[]{UUID});
		
	}
	
}
