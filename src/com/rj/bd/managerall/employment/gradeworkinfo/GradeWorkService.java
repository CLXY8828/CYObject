package com.rj.bd.managerall.employment.gradeworkinfo;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;

public class GradeWorkService {
	Dao dao =new DaoImpl();
	/**
	 * @desc  查询就业学生信息
	 * @param page
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Map<String, Object>> queryworkinfoValue(int page,String department_id) throws ClassNotFoundException, SQLException {
		int i = (page-1)*10;
		if(i<0){
			i=0;
		}
		return dao.executeQueryForList(" SELECT * FROM account a,students s,companymessage c,companyindustry i,companyaddress ad,positiontype p,companynature an,destination d "
				+ "WHERE a.UUID=s.UUID AND s.company_id=c.company_id AND s.industry_id=i.industry_id "
				+ "AND s.companyaddress_id=ad.companyaddress_id AND s.positiontype_id=p.positiontype_id "
				+ "AND s.nature_id=an.nature_id AND s.destination_id=d.destination_id AND a.employment_status=1 AND s.department_id='"+department_id+"' LIMIT ?,?",new int []{Types.INTEGER,Types.INTEGER}, new Object []{i,(i+10)});
	}
	/**
	 * @desc  查询年纪名称
	 * @param department_id
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Map<String, Object> selectGradeName(String department_id) throws ClassNotFoundException, SQLException {
		return dao.executeQueryForMap(" select * from school_department where department_id=? ",new int []{Types.VARCHAR}, new Object []{department_id});
	}
	/**
	 * @desc  就业人员编辑
	 */
	public void editwork(String id, String name, String ssex, String sid, String iDnumber, String phone, String sqq,
			String email, String gowork_edit, String destination_explain, String sutdent_address, String company_code,
			String nature_name, String company_name, String industry_name, String companyaddress_name,
			String positiontype_name, String contact_person, String sphone, String contact_email,
			String company_address) {
			String sql1="update students set admin_name = ?,admin_UUID = ?,admin_password = ? where id = ?";
				
			int[] types = new int[4];
			types[0]=Types.VARCHAR;
			types[1]=Types.VARCHAR;
			types[2]=Types.VARCHAR;
			types[3]=Types.VARCHAR;
			
			Object[] values=new Object[4];
			values[0]=name;
	}
	/**
	 * @desc  查询文件名字
	 * @param id
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Map<String, Object> selectFileName(String id) throws ClassNotFoundException, SQLException {
		return dao.executeQueryForMap(" select * from resume where id=? ",new int []{Types.VARCHAR}, new Object []{id});
	}
	/**
	 * @desc  删除
	 * @param id
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public void deleteDepartment_id(String id) throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {
		dao.executeUpdate(" update students set department_id = ?,class_id=? where id = ? ",new int []{Types.NULL,Types.NULL,Types.VARCHAR}, new Object []{"","",id});
	}

}
