package com.rj.bd.managerall.postwaring.postoverwaring;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @desc   岗位过期预警 M层
 * @author 秋月蓝璃
 *
 */

@SuppressWarnings("serial")
public class PostoverwarnServlet extends  HttpServlet{
	PostoverwarnService postoverservice = new PostoverwarnService();
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
			 System.out.println("1.打印出异常的信息:"+e.getMessage());
			 System.out.println("2.其实异常发送的内存地址："+e.getStackTrace());
		}
	}
/**
 * @desc  查询岗位信息所需内容
 * @param request
 * @param response
 */
	private void query(HttpServletRequest request, HttpServletResponse response) {
		String page1 =request.getParameter("page");
		int page = Integer.parseInt(page1);
		List<Map<String, Object>> list_employment = postoverservice.selectemploymentValue(page);
		List<Map<String, Object>> list_account = postoverservice.selectaccountValue();
		int count = postoverservice.selectEmploymentNum();
		System.out.println(count);
		request.setAttribute("list_employment", list_employment);
		request.setAttribute("list_account", list_account);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/managerjsp/postwaring/postoverdue.jsp").forward(request, response);
	}

}
