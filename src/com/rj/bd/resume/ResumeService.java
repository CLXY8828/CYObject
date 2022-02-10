package com.rj.bd.resume;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Map;
import java.util.UUID;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;
import com.rj.bd.managerall.utils.Dates;

public class ResumeService {
	
	Dao dao = new DaoImpl();

	public void uppdf(String virtualPath, String userid) throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {
		Map<String, Object> map = dao.executeQueryForMap("select * from students where UUID=?",new int[]{Types.VARCHAR},new Object[]{userid});
		String sql = "insert into resume values(?,?,?,?,?,?,?)";
		int[] types = new int[7];
		Object[] values = new Object[7];
		types[0]=Types.INTEGER;
		types[1]=Types.INTEGER;
		types[2]=Types.VARCHAR;
		types[3]=Types.VARCHAR;
		types[4]=Types.NULL;
		types[5]=Types.NULL;
		types[6]=Types.NULL;
		
		values[0]=0;
		values[1]=(Integer)map.get("id");
		values[2]=virtualPath;
		values[3]=Dates.CurrentYMDTime();
		values[4]="";
		values[6]="";
		dao.executeUpdate(sql,types, values);
		
	}
	
	
}
