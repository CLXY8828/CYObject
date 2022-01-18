package com.rj.bd.managerall.postwaring.stuwaring;

import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;

public class StuwaringService {
	Dao dao =new DaoImpl();

	public List<Map<String, Object>> selectValue(int page) throws ClassNotFoundException, SQLException {
		int count = selectAccountNum();
		int i = (page-1)*10;
		if(i<0){
			i=0;
		}else if(i>count){
			i=(page-2)*10;
		}
		return dao.executeQueryForList(" SELECT * FROM account a,students s,class c,teacherlist t,zteacher "
				+ "z WHERE a.UUID=s.UUID AND s.class_id=c.class_id AND c.class_id=t.class_id AND t.tid=z.tid limit ?,? ",
				new int []{Types.INTEGER,Types.INTEGER}, new Object []{i,(i+10)});
	}
/**
 * @desc 查询未就业人数
 * @return
 * @throws SQLException 
 * @throws ClassNotFoundException 
 */
	public int selectAccountNum() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForInt(" select count(*) from account where employment_status = 0 ");
	}
}
