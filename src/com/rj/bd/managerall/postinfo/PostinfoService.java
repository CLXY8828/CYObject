package com.rj.bd.managerall.postinfo;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
	public List<Map<String, Object>> selectEmploymentAndCompanynature(int page) throws ClassNotFoundException, SQLException {
		int count = selectEmploymentNum();
		int i = (page-1)*10;
		if(i<0){
			i=0;
		}else if(i>count){
			i=(page-2)*10;
		}
		return dao.executeQueryForList(" select * from employment e,companynature c where e.nature_id=c.nature_id limit ?,? ", new int []{Types.INTEGER,Types.INTEGER}, new Object []{i,(i+10)});
	}
	/**
	 * @desc  上传岗位的值添加
	 * @param nature_id
	 * @param gsname
	 * @param employment_name
	 * @param salary
	 * @param phone
	 * @param employment_describe
	 * @param introduce
	 * @param note
	 * @param address
	 * @param education
	 * @param experience
	 * @param zwtype
	 * @param scale
	 * @param welfare
	 * @param demand
	 * @param recrultsNumb
	 * @param subtime
	 * @param readyNumb
	 * @param gstype
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	public void addValue(String nature_id, String gsname, String employment_name, String salary, String phone,
			String employment_describe, String introduce, String note, String address, String education,
			String experience, String zwtype, String scale, String [] welfare1, String demand, String recrultsNumb,
			String subtime, int readyNumb, String gstype) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String welfare= "";
		for (int i = 0; i < welfare1.length; i++) {
			welfare+=welfare1[i]+"#";
		}
		
		if(demand.equals("")){
			demand="无";
		}
		if(employment_describe.equals("")){
			employment_describe="无";
		}
		if(introduce.equals("")){
			introduce="无";
		}
		if(note.equals("")){
			note="无";
		}
		String eid = UUID.randomUUID().toString();
		
		String sql = " insert into employment values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		
		int[] types = new int[20];
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		types[2]=Types.VARCHAR;
		types[3]=Types.VARCHAR;
		types[4]=Types.VARCHAR;
		types[5]=Types.VARCHAR;
		types[6]=Types.VARCHAR;
		types[7]=Types.VARCHAR;
		types[8]=Types.VARCHAR;
		types[9]=Types.VARCHAR;
		types[10]=Types.VARCHAR;
		types[11]=Types.VARCHAR;
		types[12]=Types.VARCHAR;
		types[13]=Types.VARCHAR;
		types[14]=Types.VARCHAR;
		types[15]=Types.VARCHAR;
		types[16]=Types.INTEGER;
		types[17]=Types.VARCHAR;
		types[18]=Types.INTEGER;
		types[19]=Types.VARCHAR;
		
		Object []values=new Object[20];
		values[0]=eid;
		values[1]=nature_id;
		values[2]=gsname;
		values[3]=employment_name;
		values[4]=salary;
		values[5]=phone;
		values[6]=employment_describe;
		values[7]=introduce;
		values[8]=note;
		values[9]=address;
		values[10]=education;
		values[11]=experience;
		values[12]=zwtype;
		values[13]=scale;
		values[14]=welfare;
		values[15]=demand;
		values[16]=Integer.parseInt(recrultsNumb);
		values[17]=subtime;
		values[18]=readyNumb;
		values[19]=gstype;
		
		dao.executeUpdate(sql, types, values);
		
		List<Map<String,Object>> list1 = dao.executeQueryForList(" select UUID from account ");
		for (int i = 0; i < list1.size(); i++) {
			Map<String,Object> map  = list1.get(i);
			String UUID = (String) map.get("UUID");
			dao.executeUpdate(" insert into employmentapply values('"+eid+"','"+UUID+"',0,0,'"+""+"','"+""+"','"+""+"') ");
		}
	}
	/**
	 * @desc  删除数据
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
	 * @desc  编辑数据
	 * @param eid
	 * @param nature_id
	 * @param gsname
	 * @param employment_name
	 * @param salary
	 * @param phone
	 * @param employment_describe
	 * @param introduce
	 * @param note
	 * @param address
	 * @param education
	 * @param experience
	 * @param zwtype
	 * @param scale
	 * @param welfare
	 * @param demand
	 * @param recrultsNumb
	 * @param subtime
	 * @param readyNumb
	 * @param gstype
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	public void editValue(String eid, String nature_id, String gsname, String employment_name, String salary,
			String phone, String employment_describe, String introduce, String note, String address, String education,
			String experience, String zwtype, String scale, String [] welfare1, String demand, String recrultsNumb,
			String subtime, String readyNumb, String gstype) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String welfare = "";
		for (int i = 0; i < welfare1.length; i++) {
				welfare+=welfare1[i]+"#";
		}
		String sql = "  update employment set nature_id=?,gsname=?,employment_name=?,salary=?,phone=?"
				+ ",employment_describe=?,introduce=?,note=?,address=?,education=?,experience=?,zwtype=?,scale=?"
				+ ",welfare=?,demand=?,recrultsNumb=?,subtime=?,readyNumb=?,gstype=? "
				+ "where eid=?  ";
		
		int[] types = new int[20];
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		types[2]=Types.VARCHAR;
		types[3]=Types.VARCHAR;
		types[4]=Types.VARCHAR;
		types[5]=Types.VARCHAR;
		types[6]=Types.VARCHAR;
		types[7]=Types.VARCHAR;
		types[8]=Types.VARCHAR;
		types[9]=Types.VARCHAR;
		types[10]=Types.VARCHAR;
		types[11]=Types.VARCHAR;
		types[12]=Types.VARCHAR;
		types[13]=Types.VARCHAR;
		types[14]=Types.VARCHAR;
		types[15]=Types.INTEGER;
		types[16]=Types.VARCHAR;
		types[17]=Types.INTEGER;
		types[18]=Types.VARCHAR;
		types[19]=Types.VARCHAR;
		
		Object []values=new Object[20];
		values[0]=nature_id;
		values[1]=gsname;
		values[2]=employment_name;
		values[3]=salary;
		values[4]=phone;
		values[5]=employment_describe;
		values[6]=introduce;
		values[7]=note;
		values[8]=address;
		values[9]=education;
		values[10]=experience;
		values[11]=zwtype;
		values[12]=scale;
		values[13]=welfare;
		values[14]=demand;
		values[15]=Integer.parseInt(recrultsNumb);
		values[16]=subtime;
		values[17]=Integer.parseInt(readyNumb);
		values[18]=gstype;
		values[19]=eid;
		dao.executeUpdate(sql, types, values);
	}
	/**
	 * @desc   查询页面页数
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int selectEmploymentNum() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForInt(" select count(*) from employment ");
	}
}
