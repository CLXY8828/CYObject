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
			return dao.executeQueryForList("SELECT * FROM employment");
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
			String sql = "SELECT * FROM employment where employment.employment_name LIKE  ?";
			return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, new Object[]{"%"+text+"%"});
		}
		String sql = "SELECT * FROM employment,employmentapply where employment.eid=employmentapply.eid and employmentapply.UUID=? and employment.employment_name LIKE  ?";
		return dao.executeQueryForList(sql, new int[]{Types.VARCHAR ,Types.VARCHAR}, new Object[]{userid,"%"+text+"%"}); 
	}

	public List<Map<String, Object>> mqueryByGS(String text, String userid) throws ClassNotFoundException, SQLException {
		if (userid==null) {
			String sql = "SELECT * FROM employment where employment.gsname LIKE  ?";
			return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, new Object[]{"%"+text+"%"});
		}
		String sql = "SELECT * FROM employment,employmentapply where employment.eid=employmentapply.eid and employmentapply.UUID=? and employment.gsname LIKE  ?";
		return dao.executeQueryForList(sql, new int[]{Types.VARCHAR ,Types.VARCHAR}, new Object[]{userid,"%"+text+"%"}); 
	}

	public List<Map<String, Object>> mqueryBytwo(String userid,String xxz, String xl, String jy, String zw, String xz, String gm) throws ClassNotFoundException, SQLException {
		if (xxz.equals("薪资要求")) {
			xxz="";
		}
		if (xl.equals("学历要求")) {
			xl="";
		}
		if (jy.equals("工作经验")) {
			jy="";
		}
		if (zw.equals("职位类型")) {
			zw="";
		}
		if (xz.equals("公司性质")) {
			xz="";
		}
		if (gm.equals("公司规模")) {
			gm="";
		}
		if (userid==null) {
			String sql = "SELECT * FROM employment WHERE employment.salary LIKE ? and employment.education LIKE ? and employment.experience LIKE ? and employment.zwtype LIKE ? and employment.gstype LIKE ? and employment.scale LIKE ?";
			int[] types=new int[6];
			types[0]=Types.VARCHAR;
			types[1]=Types.VARCHAR;
			types[2]=Types.VARCHAR;
			types[3]=Types.VARCHAR;
			types[4]=Types.VARCHAR;
			types[5]=Types.VARCHAR;
			
			Object[] values = new Object[6];
			values[0]="%"+xxz+"%";
			values[1]="%"+xl+"%";
			values[2]="%"+jy+"%";
			values[3]="%"+zw+"%";
			values[4]="%"+xz+"%";
			values[5]="%"+gm+"%";
			return dao.executeQueryForList(sql, types, values);
		}
		String sql = "SELECT * FROM employment ,employmentapply where employment.eid=employmentapply.eid and employmentapply.UUID=? and employment.salary LIKE ? and employment.education LIKE ? and employment.experience LIKE ? and employment.zwtype LIKE ? and employment.gstype LIKE ? and employment.scale LIKE ?";
		int[] types=new int[7];
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		types[2]=Types.VARCHAR;
		types[3]=Types.VARCHAR;
		types[4]=Types.VARCHAR;
		types[5]=Types.VARCHAR;
		types[6]=Types.VARCHAR;
		
		Object[] values = new Object[7];
		values[0]=userid;
		values[1]="%"+xxz+"%";
		values[2]="%"+xl+"%";
		values[3]="%"+jy+"%";
		values[4]="%"+zw+"%";
		values[5]="%"+xz+"%";
		values[6]="%"+gm+"%";
		return dao.executeQueryForList(sql, types, values);
	}

}
