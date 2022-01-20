package com.rj.bd.managerall.postwaring.stuwaring;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rj.bd.managerall.utils.Dates;
/**
 * @desc  学生预警M层
 * @author 秋月蓝璃
 */

@SuppressWarnings("serial")
public class StuwaringServlet extends  HttpServlet{
	StuwaringService stuwaringservice = new StuwaringService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try 
		  {
			  String method=request.getParameter("method");
			    if ("query".equals(method)) {
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
 * @desc 查询
 * @param request
 * @param response
 * @throws IOException 
 * @throws ServletException 
 * @throws SQLException 
 * @throws ClassNotFoundException 
 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		        //接取页面显示条数
				String page1 =request.getParameter("page");
				int page = Integer.parseInt(page1);
				List<Map<String, Object>> list = stuwaringservice.selectValue(page);
				int count = stuwaringservice.selectAccountNum();
				String time = Dates.CurrentTime();
				String timearr[] =time.split("-");
				System.out.println(timearr[1]+"-"+timearr[2]);
				request.setAttribute("list", list);
				request.setAttribute("count", count);
				request.setAttribute("page", page);
				request.setAttribute("nian", timearr[0]);
				request.setAttribute("yue", timearr[1]);
				request.setAttribute("ri", timearr[2]);
				request.getRequestDispatcher("/managerjsp/postwaring/stuworkwarn.jsp").forward(request, response);
	}
}
