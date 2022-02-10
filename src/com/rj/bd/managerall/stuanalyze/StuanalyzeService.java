package com.rj.bd.managerall.stuanalyze;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rj.bd.dao.Dao;
import com.rj.bd.dao.DaoImpl;

public class StuanalyzeService {
	Dao dao =new DaoImpl();

	public List<Map<String,Object>> selectNianJi() throws ClassNotFoundException, SQLException {
		List<Map<String,Object>> list = dao.executeQueryForList(" select * from school_department ");
		List<Map<String,Object>> list_value = new ArrayList<Map<String,Object>>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> value = new HashMap<String, Object>();
			Map<String,Object> map = list.get(i);
			int sum =  dao.executeQueryForInt(" select count(*) from students where department_id='"+map.get("department_id")+"'  ");
			int job =  dao.executeQueryForInt(" select count(*) from students s,account a where s.department_id='"+map.get("department_id")+"' and s.UUID=a.UUID and a.employment_status=1  ");
			DecimalFormat df = new DecimalFormat("0.00"); 
			double job_lv=0;
			if(sum==0){
				job_lv = 0;
			}else{
				job_lv = ((double)job/(double)sum)*100;
			}
			value.put("department_name", map.get("department_id"));
			value.put("sum", sum);
			value.put("job", job);
			value.put("job_lv", df.format(job_lv));
			list_value.add(value);
		}
		return list_value;
	}

	public void selectStudents() {
		
	}

}
