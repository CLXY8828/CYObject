package com.rj.bd.managerall.postwaring.postfillwaring;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;
/**
 * @desc   岗位招满 c层
 * @author 秋月蓝璃
 *
 */

public class PostfillwarnService {
	Dao dao =new DaoImpl();
	/**
	 * @desc   查询数据条数
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public int selectEmploymentNum() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForInt(" select count(*) from employment where recrultsNumb = readyNumb ");
	}
	/**
	 * @desc  查询页面数据
	 * @param page
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Map<String, Object>> selectemploymentValue(int page) throws ClassNotFoundException, SQLException {
		int count = selectEmploymentNum();
		int i = (page-1)*10;
		if(i<0){
			i=0;
		}else if(i>count){
			i=(page-2)*10;
		}
		return dao.executeQueryForList(" SELECT * FROM employment WHERE recrultsNumb = readyNumb LIMIT ?,? ",
				new int []{Types.INTEGER,Types.INTEGER}, new Object []{i,(i+10)});
	}
	/**
	 * @desc   查询详情
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Map<String, Object>> selectaccountValue() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList(" SELECT * FROM employmentapply e,account a where e.UUID=a.UUID ");
	}
	/**
	 * @desc  删除岗位
	 * @param eid
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	public void deleteValue(String eid) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		dao.executeUpdate("delete from employmentapply where eid=?", new int []{Types.VARCHAR}, new Object []{eid});
		dao.executeUpdate("delete from employment where eid=?", new int []{Types.VARCHAR}, new Object []{eid});
	}
	/**
	 * @desc  查询要导出的岗位信息
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Map<String, Object>> selectPost() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList(" SELECT * FROM employment WHERE recrultsNumb = readyNumb ");
	}
	public List<Map<String, Object>> selectStu() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList(" SELECT * FROM employmentapply e,account a where e.UUID=a.UUID AND applystate = 1 ");
	}
}
