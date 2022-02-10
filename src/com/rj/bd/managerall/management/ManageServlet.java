package com.rj.bd.managerall.management;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rj.bd.dao.Dao;
/**
 * @desc   权限管理M层
 * @author ChenJ
 */
@SuppressWarnings("serial")
public class ManageServlet extends HttpServlet{
	
	ManageService service=new ManageService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String method=request.getParameter("method");
			if ("query".equals(method)) {
		    	this.query(request,response);
		    }else if("add".equals(method)){
		    	this.add(request,response);
		    }else if("delete".equals(method)){
		    	this.delete(request,response);
		    }else if("edit".equals(method)){
		    	this.edit(request,response);
		    }else if("editauth".equals(method)){
		    	this.editauth(request,response);
		    }
		} 
		catch (Exception e){
		
		}
		
	}
	/**
	 * @desc  改权限
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private void editauth(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		
		String editid=request.getParameter("editauthid");
		String teacherset=request.getParameter("teacherset_edit_"+editid);
		String classchose=request.getParameter("classchose_edit_"+editid);
		
		service.editauth(editid,teacherset,classchose);
		response.sendRedirect(request.getContextPath()+"/management/authority.do?method=query&page=1");
	}

	/**
	 * @desc  改
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		
		String editid=request.getParameter("editid");
		String name=request.getParameter("teacher_name_edit_"+editid);
		String account=request.getParameter("teacher_account_edit_"+editid);
		String password=request.getParameter("teacher_password_edit_"+editid);
		String email=request.getParameter("teacher_email_edit_"+editid);
		
		service.edit(editid,name,account,password,email);
		
		response.sendRedirect(request.getContextPath()+"/management/authority.do?method=query&page=1");
	}

	/**
	 * @desc  删
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		
		String deleteid=request.getParameter("deleteid");
		service.delete(deleteid);
		response.sendRedirect(request.getContextPath()+"/management/authority.do?method=query&page=1");
		
	}

	/**
	 * @desc  增
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		System.out.println("触发");
		String name=request.getParameter("name");
		String account=request.getParameter("account");
		String auth=request.getParameter("auth");
		String password=request.getParameter("new_password");
		service.add(name,account,password,auth);
		response.sendRedirect(request.getContextPath()+"/management/authority.do?method=query&page=1");
	}


	/**
	 * @desc  查
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		String page1 =request.getParameter("page");
		int page = Integer.parseInt(page1);
		String queryinfo=request.getParameter("queryinfo");
		String queryCondition=request.getParameter("queryCondition");
		request.setAttribute("queryinfo",queryinfo);
		request.setAttribute("queryCondition", queryCondition);
		List<Map<String, Object>> list=service.query(queryinfo,queryCondition,page);
		int count = service.selectCount(queryCondition,queryinfo);
		request.setAttribute("list_query", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		List<Map<String, Object>> classlist=service.queryclass();
		request.setAttribute("list_class", classlist);
		request.getRequestDispatcher("/managerjsp/management/authority.jsp").forward(request, response);
	}
	
	
	
}
