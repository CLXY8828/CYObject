package com.rj.bd.managerall.postwaring.postoverwaring;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;
import com.rj.bd.managerall.utils.Dates;

/**
 * @desc   岗位过期预警 C层
 * @author 秋月蓝璃
 *
 */
public class PostoverwarnService {
	Dao dao =new DaoImpl();
	public List<Map<String, Object>> selectTime(int page) throws ClassNotFoundException, SQLException{
		List<Map<String, Object>> list_Time = new ArrayList<Map<String, Object>>();
		
		List<Map<String, Object>> list = selectEmploymentNum(page);
		
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			String Time_old = (String) map.get("subtime");
			
			String Time_new = Dates.CurrentTime();

			String Time_oldarr[] =Time_old.split("-");
			String Time_newarr[] =Time_new.split("-");
			int nian = (Integer.parseInt(Time_newarr[0])-Integer.parseInt(Time_oldarr[0]))*12;
			
			int yue_old =0;
			yue_old+=Time_oldarr[1].charAt(0)*10*30;
			yue_old+=Time_oldarr[1].charAt(1)*30;
			
			int yue_new =0;
			yue_new+=Time_newarr[1].charAt(0)*10*30;
			yue_new+=Time_newarr[1].charAt(1)*30;
			int yue = yue_new-yue_old;
			
			int ri_old =0;
			ri_old+=Time_oldarr[2].charAt(0)*10;
			ri_old+=Time_oldarr[2].charAt(1);
			
			int ri_new =0;
			ri_new+=Time_newarr[2].charAt(0)*10;
			ri_new+=Time_newarr[2].charAt(1);
			int ri = ri_new-ri_old;
			
			int day = nian+yue+ri;
			
			if(day>=3){
				list_Time.add(list.get(i));
			}
		}
		return list_Time;
	}
	/**
	 * @desc   查询employment表
	 * @return  
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Map<String, Object>> selectEmploymentNum(int page) throws ClassNotFoundException, SQLException {
		int i = (page-1)*10;
		if(i<0){
			i=0;
		}
		return dao.executeQueryForList(" select * from employment LIMIT ?,?",new int []{Types.INTEGER,Types.INTEGER}, new Object []{i,(i+10)});
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
	 * @desc  删除过期岗位
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
	 * @desc   查询需要导出的岗位信息
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> selectPostOver() throws ClassNotFoundException, SQLException {
		List<Map<String, Object>> list_Time = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list = dao.executeQueryForList(" select * from employment ");
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			String Time_old = (String) map.get("subtime");
			
			String Time_new = Dates.CurrentTime();

			String Time_oldarr[] =Time_old.split("-");
			String Time_newarr[] =Time_new.split("-");
			int nian = (Integer.parseInt(Time_newarr[0])-Integer.parseInt(Time_oldarr[0]))*12;
			
			int yue_old =0;
			yue_old+=Time_oldarr[1].charAt(0)*10*30;
			yue_old+=Time_oldarr[1].charAt(1)*30;
			
			int yue_new =0;
			yue_new+=Time_newarr[1].charAt(0)*10*30;
			yue_new+=Time_newarr[1].charAt(1)*30;
			int yue = yue_new-yue_old;
			
			int ri_old =0;
			ri_old+=Time_oldarr[2].charAt(0)*10;
			ri_old+=Time_oldarr[2].charAt(1);
			
			int ri_new =0;
			ri_new+=Time_newarr[2].charAt(0)*10;
			ri_new+=Time_newarr[2].charAt(1);
			int ri = ri_new-ri_old;
			
			int day = nian+yue+ri;
			
			if(day>=3){
				list_Time.add(list.get(i));
			}
		}
		return list_Time;
	}
	/**
	 * @desc   查询申请简历得学生信息表信息
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> selectStu() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList(" SELECT * FROM employmentapply e,account a where e.UUID=a.UUID AND applystate = 1 ");
	}
	/**
	 * @desc  查询页面记录数
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public int selectCount() throws ClassNotFoundException, SQLException {
		int count=0;
		List<Map<String, Object>> list = dao.executeQueryForList(" select * from employment ");
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			String Time_old = (String) map.get("subtime");
			String Time_new = Dates.CurrentTime();
			String Time_oldarr[] =Time_old.split("-");
			String Time_newarr[] =Time_new.split("-");
			int nian = (Integer.parseInt(Time_newarr[0])-Integer.parseInt(Time_oldarr[0]))*12;
			int yue_old =0;
			yue_old+=Time_oldarr[1].charAt(0)*10*30;
			yue_old+=Time_oldarr[1].charAt(1)*30;
			int yue_new =0;
			yue_new+=Time_newarr[1].charAt(0)*10*30;
			yue_new+=Time_newarr[1].charAt(1)*30;
			int yue = yue_new-yue_old;
			int ri_old =0;
			ri_old+=Time_oldarr[2].charAt(0)*10;
			ri_old+=Time_oldarr[2].charAt(1);
			int ri_new =0;
			ri_new+=Time_newarr[2].charAt(0)*10;
			ri_new+=Time_newarr[2].charAt(1);
			int ri = ri_new-ri_old;
			
			int day = nian+yue+ri;
			
			if(day>=3){
				count+=1;
			}
		}
		return count;
	}

}
