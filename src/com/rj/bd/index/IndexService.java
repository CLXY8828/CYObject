package com.rj.bd.index;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.asm.Type;
import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;

public class IndexService {
	Dao dao = new DaoImpl();

	public List<Map<String, Object>> query(String userid) throws ClassNotFoundException, SQLException {
		
		if (userid==null) {
			return dao.executeQueryForList("SELECT * FROM employment,employmentapply where employment.eid=employmentapply.eid");
		}
		
		return dao.executeQueryForList("SELECT * FROM employment,employmentapply where employment.eid=employmentapply.eid and employmentapply.UUID=?", new int[]{Types.VARCHAR}, new Object[]{userid});
	}

	public void saveSC(String userid, String eid) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		String sql = "update employmentapply set Collectionstate=? where UUID=? and eid=?";
		dao.executeUpdate(sql, new int[]{Types.INTEGER,Types.VARCHAR,Types.VARCHAR}, new Object[]{1,userid,eid});
	}

	public int scquery(String userid) throws ClassNotFoundException, SQLException {
		if (userid==null) {
			return 0;
		}
		String sql = "SELECT COUNT(*) FROM employment,employmentapply where employment.eid=employmentapply.eid and employmentapply.UUID=? and employmentapply.Collectionstate=1";
		return dao.executeQueryForInt(sql, new int[]{Types.VARCHAR},new Object[]{userid});
	}

	public int sqquery(String userid) throws ClassNotFoundException, SQLException {
		if (userid==null) {
			return 0;
		}
		String sql ="SELECT COUNT(*) FROM employment,employmentapply where employment.eid=employmentapply.eid and employmentapply.UUID=? and employmentapply.applystate=1";
		return dao.executeQueryForInt(sql, new int[]{Types.VARCHAR},new Object[]{userid});
	}

	public void saveqSC(String userid, String eid) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String sql = "update employmentapply set Collectionstate=? where UUID=? and eid=?";
		dao.executeUpdate(sql, new int[]{Types.INTEGER,Types.VARCHAR,Types.VARCHAR}, new Object[]{0,userid,eid});
		
	}

	public List<Map<String, Object>> mqueryByQW(String text, String userid) throws ClassNotFoundException, SQLException {
		if (userid==null) {
			String sql = "SELECT * FROM employment,employmentapply where employment.eid=employmentapply.eid  and employment.employment_name LIKE  ?";
			return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, new Object[]{"%"+text+"%"});
		}
		String sql = "SELECT * FROM employment,employmentapply where employment.eid=employmentapply.eid and employmentapply.UUID=? and employment.employment_name LIKE  ?";
		return dao.executeQueryForList(sql, new int[]{Types.VARCHAR ,Types.VARCHAR}, new Object[]{userid,"%"+text+"%"}); 
	}

	public List<Map<String, Object>> mqueryByGS(String text, String userid) throws ClassNotFoundException, SQLException {
		if (userid==null) {
			String sql = "SELECT * FROM employment,employmentapply where employment.eid=employmentapply.eid  and employment.gsname LIKE  ?";
			return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, new Object[]{"%"+text+"%"});
		}
		String sql = "SELECT * FROM employment,employmentapply where employment.eid=employmentapply.eid and employmentapply.UUID=? and employment.gsname LIKE  ?";
		return dao.executeQueryForList(sql, new int[]{Types.VARCHAR ,Types.VARCHAR}, new Object[]{userid,"%"+text+"%"}); 
	}

}
