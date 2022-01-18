package com.rj.bd.index;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class IndexServlet extends HttpServlet {
	IndexService service = new IndexService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String q = request.getParameter("method");
		
		try {
			if ("loginpage".equals(q)) {
				loginpage(request,response);
			}
			else if ("query".equals(q)) {
				query(request,response);
			}
			else if ("sc".equals(q)) {
				saveSC(request,response);
			}
			else if ("qsc".equals(q)) {
				saveqSC(request,response);
			}
			else if ("mquery".equals(q)){
				mquery(request,response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
		}
		
	}

	
	private void mquery(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		
		String userid = (String) request.getSession().getAttribute("userid");
		String type = request.getParameter("type");
		if ("1".equals(type)) {
			String select = request.getParameter("select");
			String text = request.getParameter("text");
			if ("全文".equals(select)) {
				List<Map<String, Object>> list =service.mqueryByQW(text,userid);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;
			}
			else if ("公司".equals(select)) {
				List<Map<String, Object>> list =service.mqueryByGS(text,userid);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;
			}
		}
		else if ("2".equals(type)) {
			String xxz = request.getParameter("xxz");
			String xl = request.getParameter("xl");
			String jy = request.getParameter("jy");
			String zw = request.getParameter("zw");
			String xz = request.getParameter("xz");
			String gm = request.getParameter("gm");
			
			List<Map<String, Object>> list =service.mqueryBytwo(userid,xxz,xl,jy,zw,xz,gm);
			Map<String, String> tj= new HashMap<String, String>();
			tj.put("xxz", xxz);
			tj.put("xl", xl);
			tj.put("jy", jy);
			tj.put("zw", zw);
			tj.put("xz", xz);
			tj.put("gm", gm);
			request.setAttribute("list", list);
			request.setAttribute("tj", tj);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		
	}


	private void saveqSC(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String userid = request.getParameter("userid");
		String eid = request.getParameter("eid");
		service.saveqSC(userid,eid);
		
	}


	private void saveSC(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String userid = request.getParameter("userid");
		String eid = request.getParameter("eid");
		service.saveSC(userid,eid);
		
	}


	/**
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
			String userid = (String) request.getSession().getAttribute("userid");
			System.out.println(userid);
			List<Map<String, Object>> list=service.query(userid);
			int sc=service.scquery(userid);
			int sq=service.sqquery(userid);
			System.out.println(list);
			request.getSession().setAttribute("sc", sc);
			request.getSession().setAttribute("sq", sq);
			request.setAttribute("list", list);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}


	/**
	 * @desc 跳转登录界面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void loginpage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/logein/login.jsp").forward(request, response);
		
	}
	
}
