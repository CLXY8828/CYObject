package com.rj.bd.perfect;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class PerfectServlet extends HttpServlet {
	PerfectService service = new PerfectService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String q = request.getParameter("method");
		if ("formjb".equals(q)) {
			formjb(request,response);
		}
		
	
	}

	private void formjb(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String qq = request.getParameter("qq");
		String email = request.getParameter("email");
		String sid = request.getParameter("sid");
		String sfjy = request.getParameter("sfjy");
		String NumbID = request.getParameter("NumbID");
		String phonecode = request.getParameter("phonecode");
		String address = request.getParameter("address");
		String gzjy = request.getParameter("gzjy");
		Map user = (Map)request.getSession().getAttribute("user");
		service.savejb((String)user.get("UUID"),name,sex,qq,email,sid,NumbID,phonecode,address,gzjy);
		
	}
	

}
