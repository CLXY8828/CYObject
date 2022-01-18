package com.rj.bd.index;

import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

}
