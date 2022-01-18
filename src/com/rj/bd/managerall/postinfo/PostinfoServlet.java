package com.rj.bd.managerall.postinfo;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rj.bd.managerall.utils.Dates;

@SuppressWarnings("serial")
public class PostinfoServlet extends  HttpServlet{
	PostinfoService postinfoservice =new PostinfoService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try 
		  {
			  String method=request.getParameter("method");
			    if ("query".equals(method)) {
			    	this.query(request,response);
			    }else if("add".equals(method)){
			    	this.add(request,response);
			    }else if("delete".equals(method)){
			    	this.delete(request,response);
			    }else if("edit".equals(method)){
			    	this.edit(request,response);
			    }
		} 
		  catch (Exception e) 
		  {
			  System.out.println("1.首先需要打印出异常的信息为:"+e.getMessage());
			  System.out.println("2.其实异常发送的内存地址："+e.getStackTrace());
		   }
	}
	/**
	 * @desc  编辑上传
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		//1.接值
		String eid = request.getParameter("eid");
		String employment_name = request.getParameter("employment_name_"+eid);
		String gsname = request.getParameter("gsname_"+eid);
		String salary_upload = request.getParameter("qian_"+eid);
		String salarytimes_upload = request.getParameter("xin_"+eid);
		String salary = salary_upload+"."+salarytimes_upload+"薪";//吧薪资要求和多少薪加起来
		String scale = request.getParameter("scale_"+eid);
		String nature_id = request.getParameter("nature_id_"+eid);
		String recrultsNumb = request.getParameter("recrultsNumb_"+eid);
		String welfare [] = request.getParameterValues("welfare_"+eid);
		String gstype = request.getParameter("gstype_"+eid);
		String zwtype = request.getParameter("zwtype_"+eid);
		String address = request.getParameter("address_"+eid);
		String education = request.getParameter("education_"+eid);
		String phone = request.getParameter("phone_"+eid);
		String experience = request.getParameter("experience_"+eid);
		String employment_describe = request.getParameter("employment_describe_"+eid);
		String note = request.getParameter("note_"+eid);
		String introduce = request.getParameter("introduce_"+eid);
		String demand = request.getParameter("demand_"+eid);
		String subtime = Dates.CurrentTime();
		String readyNumb= request.getParameter("readyNumb_"+eid);
		System.out.println(subtime);
		//2.存值
		postinfoservice.editValue(eid,nature_id,gsname,employment_name,salary,phone,
				employment_describe,introduce,note,address,education,experience,zwtype,
				scale,welfare,demand,recrultsNumb,subtime,readyNumb,gstype);
		//3.重定向
		response.sendRedirect(request.getContextPath()+"/postinfo/postin.do?method=query&page="+1);
	}
	/**
	 * @desc  删除岗位数据
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 * @throws InterruptedException 
	 * @throws ServletException 
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException, ServletException, InterruptedException {
		String eid = request.getParameter("eid");
		System.out.println(eid);
		postinfoservice.deleteValue(eid);
		//3.重定向
		response.sendRedirect(request.getContextPath()+"/postinfo/postin.do?method=query&page="+1);
	}
	/**
	 * @desc  添加岗位请求
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		//1.接值
		String employment_name = request.getParameter("employment_name");
		String gsname = request.getParameter("gsname");
		String salary_upload = request.getParameter("salary_upload");
		String salarytimes_upload = request.getParameter("salarytimes_upload");
		String salary = salary_upload+"."+salarytimes_upload+"薪";//吧薪资要求和多少薪加起来
		String scale = request.getParameter("scale");
		String nature_id = request.getParameter("nature_id");
		String recrultsNumb = request.getParameter("recrultsNumb");
		String welfare [] = request.getParameterValues("welfare");
		String gstype = request.getParameter("gstype");
		String zwtype = request.getParameter("zwtype");
		String address = request.getParameter("address");
		String education = request.getParameter("education");
		String phone = request.getParameter("phone");
		String experience = request.getParameter("experience");
		String employment_describe = request.getParameter("employment_describe");
		String note = request.getParameter("note");
		String introduce = request.getParameter("introduce");
		String demand = request.getParameter("demand");
		String subtime = Dates.CurrentTime();
		int readyNumb= 0;
		//2.存值
		postinfoservice.addValue(nature_id,gsname,employment_name,salary,phone,
				employment_describe,introduce,note,address,education,experience,zwtype,
				scale,welfare,demand,recrultsNumb,subtime,readyNumb,gstype);
		//3.重定向
		response.sendRedirect(request.getContextPath()+"/postinfo/postin.do?method=query&page="+1);
	}
	/**
	 * @desc  查询展示界面
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ServletException
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException, InterruptedException {
		//接取页面显示条数
		String page1 =request.getParameter("page");
		int page = Integer.parseInt(page1);
		List<Map<String, Object>> list = postinfoservice.selectEmploymentAndCompanynature(page);
		int count = postinfoservice.selectEmploymentNum();
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		System.out.println("前");
		request.getRequestDispatcher("/managerjsp/post/postinfo.jsp").forward(request, response);
		System.out.println("后");
	}

}
