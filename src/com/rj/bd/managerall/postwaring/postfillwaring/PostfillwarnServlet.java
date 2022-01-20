package com.rj.bd.managerall.postwaring.postfillwaring;

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
 * @desc   岗位招满 M层
 * @author 秋月蓝璃
 *
 */
@SuppressWarnings("serial")
public class PostfillwarnServlet extends  HttpServlet{
	PostfillwarnService postfillservice = new PostfillwarnService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try 
		  {
			  String method=request.getParameter("method");
			    if ("query".equals(method)) {
			    	this.query(request,response);
			    }else if("delete".equals(method)){
			    	this.delete(request,response);
			    }
		} 
		catch (Exception e) 
		{
			 System.out.println("1.首先需要打印出异常的信息为:"+e.getMessage());
			 System.out.println("2.其实异常发送的内存地址："+e.getStackTrace());
		}
	}
	/**
	 * @desc  删除
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		String eid = request.getParameter("eid");
		String page = request.getParameter("page");
		System.out.println(eid);
		postfillservice.deleteValue(eid);
		//3.重定向
		response.sendRedirect(request.getContextPath()+"/waring/fill.do?method=query&page="+1);
	}
	/**
	 * @desc  招满预警查询
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
		List<Map<String, Object>> list_employment = postfillservice.selectemploymentValue(page);
		List<Map<String, Object>> list_account = postfillservice.selectaccountValue();
		int count = postfillservice.selectEmploymentNum();
		System.out.println(count);
		request.setAttribute("list_employment", list_employment);
		request.setAttribute("list_account", list_account);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/managerjsp/postwaring/postfillwarn.jsp").forward(request, response);
	}

}
