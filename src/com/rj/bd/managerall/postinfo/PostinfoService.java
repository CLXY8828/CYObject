package com.rj.bd.managerall.postinfo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;

public class PostinfoService {
	Dao dao =new DaoImpl();
	/**
	 * @desc   查询Employment表和从companynature表
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> selectEmploymentAndCompanynature() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList(" select * from employment e,companynature c where e.nature_id=c.nature_id ");
	}
	public void addValue(String nature_id, String gsname, String employment_name, String salary, String phone,
			String employment_describe, String introduce, String note, String address, String education,
			String experience, String zwtype, String scale, String welfare, String demand, String recrultsNumb,
			String subtime, int readyNumb, String gstype) {
		String sql = " insert into employment values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		
	}
}
