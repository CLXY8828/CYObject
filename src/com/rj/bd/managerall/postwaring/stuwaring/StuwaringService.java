package com.rj.bd.managerall.postwaring.stuwaring;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;
/**
 * @desc   学生预警C层
 * @author 秋月蓝璃
 *
 */
public class StuwaringService {
	Dao dao =new DaoImpl();
	/**
	 * @desc  查询未就业学生信息
	 * @param page
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> selectValue(int page) throws ClassNotFoundException, SQLException {
		int count = selectAccountNum();
		int i = (page-1)*10;
		if(i<0){
			i=0;
		}
		return dao.executeQueryForList(" SELECT * FROM account a,students s,class c,teacherlist t,zteacher "
				+ "z WHERE a.UUID=s.UUID AND s.class_id=c.class_id AND c.class_id=t.class_id AND t.tid=z.tid AND a.employment_status = 0 limit ?,? ",
				new int []{Types.INTEGER,Types.INTEGER}, new Object []{i,(i+10)});
	}
/**
 * @desc 查询未就业人数
 * @return
 * @throws SQLException 
 * @throws ClassNotFoundException 
 */
	public int selectAccountNum() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForInt(" SELECT count(*) FROM account a,students s,class c,teacherlist t,zteacher "
				+ "z WHERE a.UUID=s.UUID AND s.class_id=c.class_id AND c.class_id=t.class_id AND t.tid=z.tid AND a.employment_status = 0 ");
	}
/**
 * @desc   查询导出的学生未就业信息
 * @return
 * @throws SQLException 
 * @throws ClassNotFoundException 
 */
	public List<Map<String, Object>> selectStudent() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList(" SELECT * FROM account a,students s,class c,teacherlist t,zteacher "
				+ "z WHERE a.UUID=s.UUID AND s.class_id=c.class_id AND c.class_id=t.class_id AND t.tid=z.tid");
	}
/**
 * @desc  修改联系处理状态	
 * @param sid
 * @throws IOException 
 * @throws SQLException 
 * @throws FileNotFoundException 
 * @throws ClassNotFoundException 
 */
	public void alertState(String sid) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		dao.executeUpdate(" update account set processdate=1 where sid=? ", new int []{Types.VARCHAR}, new Object []{sid});
	}
}
