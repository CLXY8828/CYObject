package com.rj.bd.managerall.postinfo;

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
		String gstype = request.getParameter("gstype");
		String zwtype = request.getParameter("zwtype");
		String address = request.getParameter("address");
		String education = request.getParameter("education");
		String phone = request.getParameter("phone");
		String experience = request.getParameter("experience");
		String employment_describe = request.getParameter("employment_describe");
		String note = request.getParameter("experience");
		String introduce = request.getParameter("experience");
		String demand = request.getParameter("demand");
		String subtime = Dates.CurrentTime();
		int readyNumb= 0;
		System.out.println(subtime);
		//2.存值
		postinfoservice.addValue(nature_id,gsname,employment_name,salary,phone,
				employment_describe,introduce,note,address,education,experience,zwtype,
				scale,welfare,demand,recrultsNumb,subtime,readyNumb,gstype);
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
