package com.rj.bd.logein.nopassword;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Map;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;

/**
 * @desc 忘记密码M层
 * @author mengjinfu
 * @time 2022-1-09
 */
public class NoPasswordService {
	Dao dao = new DaoImpl();

	public Map<String, Object> queryBySnameAndPhone(String sid, String phone) throws ClassNotFoundException, SQLException {
		String sql = "select * from account where sid=? and phone=?";
		return dao.executeQueryForMap(sql, new int[]{Types.VARCHAR,Types.VARCHAR}, new Object[]{sid,phone});
	}

	public void sub(String phone, String sid, String password) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String sql = "update account set password=? where sid=? and phone=?";
		dao.executeUpdate(sql, new int[]{Types.VARCHAR,Types.VARCHAR,Types.VARCHAR}, new Object[]{password,sid,phone});
		
	}


}
