package com.rj.bd.logein.nopassword;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.ClientProtocolException;
import org.checkerframework.checker.units.qual.m;

import com.rj.bd.logein.CodeUtrl;
import com.rj.bd.messageutrl.SmsCodeException;
import com.sun.org.apache.bcel.internal.classfile.Code;

@SuppressWarnings("serial")
public class NoPasswordServlet extends HttpServlet {

	NoPasswordService service = new NoPasswordService();
	
	CodeUtrl utrl = new CodeUtrl();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String q = request.getParameter("method");
			if ("yz".equals(q)) {
				
					queryForyz(request,response);
				
			}
			else if ("codeyz".equals(q)) {
				codeyz(request,response);
			}
			else if ("phonecode".equals(q)) {
				phonecode(request,response);
			}
			else if ("sub".equals(q)) {
				sub(request,response);
			}
		} catch (ClassNotFoundException | SQLException | SmsCodeException e) {
			System.out.println(e.getMessage());
		}
		
		
	}

	private void sub(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException, ServletException {
		String phone = request.getParameter("phone");
		String sid = request.getParameter("sid");
		String password = request.getParameter("password");
		service.sub(phone,sid,password);
		request.getRequestDispatcher("/logein/login.jsp").forward(request, response);
		
	}

	/**
	 * @desc 发送手机验证码
	 * @param request
	 * @param response
	 * @throws ClientProtocolException
	 * @throws IOException
	 * @throws SmsCodeException
	 */
	private void phonecode(HttpServletRequest request, HttpServletResponse response) throws ClientProtocolException, IOException, SmsCodeException {
		String phonecode=request.getParameter("phone");
		utrl.createPhoneCode(phonecode);
		PrintWriter out = response.getWriter();
		String data="yes";
		out.write(data);
		out.flush();
		out.close();
		
	}

	/**
	 * @desc ajax验证码正确性验证
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void codeyz(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String code = request.getParameter("code");
		String phone = request.getParameter("phone");
		PrintWriter out = response.getWriter();
		boolean test = utrl.testPhoneCode(phone, code);
		String data;
		if (test) {
			data="yes1";
		}
		else {
			data="nocode";
		}
		out.write(data);
		out.flush();
		out.close();
	}

	/**
	 * @desc 查询学号和手机号，用户来匹配验证
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 */
	private void queryForyz(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		String sid = request.getParameter("gname");
		String phone = request.getParameter("phone");
		Map<String, Object> map=service.queryBySnameAndPhone(sid,phone);
		System.out.println(map);
		PrintWriter out = response.getWriter();
		String data;
		if (map==null) {
			data="no";
		}
		else {
			data="yes";
		}
		out.write(data);
		out.flush();
		out.close();
		
	}
	
	
	
}
