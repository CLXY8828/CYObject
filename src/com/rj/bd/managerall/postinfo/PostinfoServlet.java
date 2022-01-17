package com.rj.bd.managerall.postinfo;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class PostinfoServlet extends  HttpServlet{
	PostinfoService postinfoservice =new PostinfoService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try 
		  {
			  String method=request.getParameter("method");
			    if ("query".equals(method)) 
			    {
			    	this.query(request,response);
			    }else if("add".equals(method)){
			    	this.add(request,response);
			    }
		} 
		  catch (Exception e) 
		  {
			  System.out.println("1.首先需要打印出异常的信息为:"+e.getMessage());
			  System.out.println("2.其实异常发送的内存地址："+e.getStackTrace());
		   }
	}
	/**
	 * @desc  添加岗位请求
	 * @param request
	 * @param response
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) {
		//接值
		String employment_name = request.getParameter("employment_name");
		String gsname = request.getParameter("gsname");
		String salary_upload = request.getParameter("salary_upload");
		String salarytimes_upload = request.getParameter("salarytimes_upload");
		String salary = salary_upload+"."+salary_upload;//吧薪资要求和多少薪加起来
		String scale = request.getParameter("scale");
		String nature_id = request.getParameter("nature_id");
		String recrultsNumb = request.getParameter("recrultsNumb");
		String welfare = request.getParameter("welfare");
		String type = request.getParameter("type");
		String address = request.getParameter("address");
		String education = request.getParameter("education");
		String phone = request.getParameter("phone");
		String experience = request.getParameter("experience");
		String descr = request.getParameter("descr");
		String note = request.getParameter("experience");
		String introduce = request.getParameter("experience");
		System.out.println(employment_name+"-"+gsname+"-"+salary);
		//2.存值
		postinfoservice.addValue(nature_id,employment_name,salary,phone,
				descr,introduce,note,address,education,experience,type,
				scale,welfare,demand,recrultsNumb,subtime,readyNumb,gsname);
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
		System.out.println(111111);
		List<Map<String, Object>> list = postinfoservice.selectEmploymentAndCompanynature();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/managerjsp/post/postinfo.jsp").forward(request, response);
	}

}
