package com.rj.bd.perfect;

import java.sql.Types;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;

public class PerfectService {
	Dao dao = new DaoImpl();

	/**
	 * @desc 保存基本信息
	 * @param request
	 * @param response
	 */
	public void savejb(String userid, String name, String sex, String qq, String email, String sid, String numbID,
			String phonecode, String address, String gzjy) {
		String sql="insert into students values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int[] types = new int[32];
		Object values = new Object[32];
		
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		
		
		
	}
	
}
