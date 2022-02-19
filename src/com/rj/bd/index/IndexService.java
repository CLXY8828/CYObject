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

/**
 * @author mengjinfu
 *
 */
public class IndexService {
	Dao dao = new DaoImpl();

	/**
	 * @desc 查询全部岗位
	 * @param userid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> query(String userid) throws ClassNotFoundException, SQLException {
		
		if (userid==null) {
			return dao.executeQueryForList("SELECT * FROM employment,(SELECT eid,SUM(CASE WHEN applystate=1 THEN 1 ELSE 0 END) ap,SUM(CASE WHEN Collectionstate=1 THEN 1 ELSE 0 END) co FROM employmentapply GROUP BY eid) a "
					+ "where employment.eid=a.eid");
		}
		
		return dao.executeQueryForList("SELECT * FROM employment,employmentapply"
				+ ",(SELECT eid,SUM(CASE WHEN applystate=1 THEN 1 ELSE 0 END) ap,SUM(CASE WHEN Collectionstate=1 THEN 1 ELSE 0 END) co FROM employmentapply GROUP BY eid) a "
				+ "where employment.eid=employmentapply.eid and employmentapply.eid=a.eid and  employmentapply.UUID=?", new int[]{Types.VARCHAR}, new Object[]{userid});
	}

	/**
	 * @desc 收藏一个岗位
	 * @param userid
	 * @param eid
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	public void saveSC(String userid, String eid) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		String sql = "update employmentapply set Collectionstate=? where UUID=? and eid=?";
		dao.executeUpdate(sql, new int[]{Types.INTEGER,Types.VARCHAR,Types.VARCHAR}, new Object[]{1,userid,eid});
	}
	/**
	 * @desc 收藏数量查询
	 * @param userid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int scquery(String userid) throws ClassNotFoundException, SQLException {
		if (userid==null) {
			return 0;
		}
		String sql = "SELECT COUNT(*) FROM employment,employmentapply where employment.eid=employmentapply.eid and employmentapply.UUID=? and employmentapply.Collectionstate=1";
		return dao.executeQueryForInt(sql, new int[]{Types.VARCHAR},new Object[]{userid});
	}

	/**
	 * @desc 申请数量查询
	 * @param userid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int sqquery(String userid) throws ClassNotFoundException, SQLException {
		if (userid==null) {
			return 0;
		}
		String sql ="SELECT COUNT(*) FROM employment,employmentapply where employment.eid=employmentapply.eid and employmentapply.UUID=? and employmentapply.applystate=1";
		return dao.executeQueryForInt(sql, new int[]{Types.VARCHAR},new Object[]{userid});
	}

	/**
	 * @desc 用户取消收藏
	 * @param userid
	 * @param eid
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	public void saveqSC(String userid, String eid) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String sql = "update employmentapply set Collectionstate=? where UUID=? and eid=?";
		dao.executeUpdate(sql, new int[]{Types.INTEGER,Types.VARCHAR,Types.VARCHAR}, new Object[]{0,userid,eid});
		
	}

	/**
	 * @desc 全文模糊查询
	 * @param text
	 * @param userid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> mqueryByQW(String text, String userid) throws ClassNotFoundException, SQLException {
		if (userid==null) {
			String sql = "SELECT * FROM employment where employment.employment_name LIKE  ?";
			return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, new Object[]{"%"+text+"%"});
		}
		String sql = "SELECT * FROM employment,employmentapply where employment.eid=employmentapply.eid and employmentapply.UUID=? and employment.employment_name LIKE  ?";
		return dao.executeQueryForList(sql, new int[]{Types.VARCHAR ,Types.VARCHAR}, new Object[]{userid,"%"+text+"%"}); 
	}

	/**
	 * @desc 公司模糊查询
	 * @param text
	 * @param userid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> mqueryByGS(String text, String userid) throws ClassNotFoundException, SQLException {
		if (userid==null) {
			String sql = "SELECT * FROM employment where employment.gsname LIKE  ?";
			return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, new Object[]{"%"+text+"%"});
		}
		String sql = "SELECT * FROM employment,employmentapply where employment.eid=employmentapply.eid and employmentapply.UUID=? and employment.gsname LIKE  ?";
		return dao.executeQueryForList(sql, new int[]{Types.VARCHAR ,Types.VARCHAR}, new Object[]{userid,"%"+text+"%"}); 
	}

	/**
	 * @desc 条件模糊查询
	 * @param userid 用户id
	 * @param xxz 薪资要求
	 * @param xl 学历要求
	 * @param jy 工作经验
	 * @param zw 职位类型
	 * @param xz 公司性质
	 * @param gm 公司规模
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
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

	/**
	 * @desc 申请职业
	 * @param userid
	 * @param eid
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	public void saveSQ(String userid, String eid) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String sql = "update employmentapply set applystate=? where UUID=? and eid=?";
		dao.executeUpdate(sql, new int[]{Types.INTEGER,Types.VARCHAR,Types.VARCHAR}, new Object[]{1,userid,eid});
		
	}

	/**
	 * @desc 查询已收藏
	 * @param userid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> queryminesc(String userid) throws ClassNotFoundException, SQLException {
		String sql ="SELECT * FROM employment ,employmentapply where employment.eid=employmentapply.eid AND UUID =? AND employmentapply.Collectionstate=1";
		
		return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, new Object[]{userid});
		
	}

	/**
	 * @desc 查询已申请
	 * @param userid
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> queryminesq(String userid) throws ClassNotFoundException, SQLException {
		String sql ="SELECT * FROM employment ,employmentapply where employment.eid=employmentapply.eid AND UUID =? AND employmentapply.applystate=1";
		return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, new Object[]{userid});
	}

	/**
	 * @desc
	 * @param userid
	 * @param eid
	 * @return 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public Map<String, Object> detailquery(Map userid,String eid) throws ClassNotFoundException, SQLException {
		if (userid!=null) {
			String sql = "select * from employment,employmentapply,companynature where companynature.nature_id=employment.nature_id and employment.eid=employmentapply.eid AND UUID =? and employment.eid=?";
			return dao.executeQueryForMap(sql, new int[]{Types.VARCHAR,Types.VARCHAR}, new Object[]{(String)userid.get("UUID"),eid});
		}
		String sql = "select * from employment where employment.eid=?";
		return dao.executeQueryForMap(sql, new int[]{Types.VARCHAR}, new Object[]{eid});
		
	}

	/**
	 * @return 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @desc 查询毕业去向
	 */
	public List<Map<String, Object>> querybyqx() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from destination");
		
	}

	/**
	 * @return 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @desc 查询单位性质
	 */
	public List<Map<String, Object>> querydwxz() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from companynature");
		
	}

	/**
	 * @desc 查询公司地址
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> querydwdz() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from companyaddress");
		
	}

	/**
	 * @return 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @desc 查询单位行业
	 */
	public List<Map<String, Object>> querydwhy() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from companyindustry");
		
	}

	/**
	 * @return 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @desc 查询职位类别
	 */
	public List<Map<String,Object>> queryzwlb() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from positiontype");
		
	}

	public List<Map<String, Object>> queryjl(String userid) throws ClassNotFoundException, SQLException {
		
		Map<String, Object> map = dao.executeQueryForMap("select * from students where UUID=?", new int[]{Types.VARCHAR},new Object[]{userid});
		return dao.executeQueryForList("select * from resume where id='"+map.get("id")+"'");
	}

	public Map<String, Object> queryjlmap(String id) throws ClassNotFoundException, SQLException {
		
		return dao.executeQueryForMap("select * from resume where resume_id=?",new int[]{Types.VARCHAR},new Object[]{id});
		
	}

	public Map<String, Object> queryeid(String eid) throws ClassNotFoundException, SQLException {
		
		return dao.executeQueryForMap("select * from employment where eid=?", new int[]{Types.VARCHAR},new Object[]{eid});
		
	}

}
