package com.rj.bd.security;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Map;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;

public class SecurityService {
	
	Dao dao = new DaoImpl();

	/**
	 * @desc 修改密码
	 * @param userid
	 * @param newpassword
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	public void savepassword(String userid, String newpassword) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		String sql = "update account set password=? where UUID=?";
		dao.executeUpdate(sql, new int[]{Types.VARCHAR,Types.VARCHAR},new Object[]{newpassword,userid});
	}

	public Map<String, Object> testPassword(String password, String UUID) throws ClassNotFoundException, SQLException {
		String sql= "select * from account where UUID=? and password=?";
		
		return dao.executeQueryForMap(sql, new int[]{Types.VARCHAR,Types.VARCHAR}, new Object[]{UUID,password});
		
	}

	public void savephone(String phone, String UUID) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String sql = "update account set phone=? where UUID=?";
		dao.executeUpdate(sql, new int[]{Types.VARCHAR,Types.VARCHAR},new Object[]{phone,UUID});
	}

	public Map<String, Object> isphone(String phone) throws ClassNotFoundException, SQLException {
		String sql ="SELECT * FROM account WHERE phone =?";
		
		return dao.executeQueryForMap(sql, new int[]{Types.VARCHAR}, new Object[]{phone});
		
	}
	
	
}
