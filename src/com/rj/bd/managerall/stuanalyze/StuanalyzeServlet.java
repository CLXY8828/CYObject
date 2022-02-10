package com.rj.bd.managerall.stuanalyze;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
public class StuanalyzeServlet extends  HttpServlet{
	StuanalyzeService stuanalyzeservice =new StuanalyzeService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		  {
			  String method=request.getParameter("method");
			    if ("query".equals(method)){
			    	this.query(request,response);
			    }
			    
		} 
		  catch (Exception e) 
		  {
			  System.out.println("1.首先需要打印出异常的信息为:"+e.getMessage());
			  System.out.println("2.其实异常发送的内存地址："+e.getStackTrace());
		   }
	}
	/**
	 * @desc  柱状图饼状图的数据
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		List<Map<String,Object>> list = stuanalyzeservice.selectNianJi();
		stuanalyzeservice.selectStudents();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/managerjsp/stuanalyze.jsp").forward(request, response);
	}

}
