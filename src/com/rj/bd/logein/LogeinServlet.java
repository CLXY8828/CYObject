package com.rj.bd.logein;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.apache.jasper.tagplugins.jstl.core.Out;

import com.rj.bd.messageutrl.SmsCodeException;

@SuppressWarnings("serial")
public class LogeinServlet extends HttpServlet {
	
	LogeinService service = new LogeinService();
	CodeUtrl utrl = new CodeUtrl();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String q = request.getParameter("method");
			if ("loge".equals(q)) {
				
					logein(request,response);
				
			}
			else if ("logep".equals(q)) {
				logeinp(request,response);
			}
			else if ("logephone".equals(q)) {
				logephone(request,response);
			}
			else if ("nopassword".equals(q)) {
				nopassword(request,response);
			}
			else if ("out".equals(q)) {
				out(request,response);
			}
		} catch (ClassNotFoundException | SQLException | SmsCodeException e) {
			System.out.println(e.getMessage());
		}
		
	
	}

	private void out(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
	}

	/**
	 * @desc 忘记密码界面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void nopassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/logein/nopassword.jsp").forward(request, response);
	}

	/**
	 * @desc 手机验证码
	 * @param request
	 * @param response
	 * @throws ClientProtocolException
	 * @throws IOException
	 * @throws SmsCodeException
	 * @throws ServletException
	 */
	private void logephone(HttpServletRequest request, HttpServletResponse response) throws ClientProtocolException, IOException, SmsCodeException, ServletException {
		String phonecode = request.getParameter("name");//获取用户输入的验证码
//		System.out.println(phonecode);
//		utrl.createPhoneCode(phonecode);//发送验证码
	}

	/**
	 * @desc 手机号登录验证
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws ServletException
	 */
	private void logeinp(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, FileNotFoundException, IOException, ServletException {
		//获取用户输入数据
		String phonenumber = request.getParameter("phonenumber");
		String codes=request.getParameter("code");
		boolean test = utrl.testPhoneCode(phonenumber, codes);
		//符合条件创建用户
		if (test) {
			System.out.println(1);
			Map<String, Object> map=service.queryByPhone(phonenumber);
			if (map==null||map.size()<=0) {//创建新用户
				System.out.println(1);
				service.newUserByPhone(phonenumber);
				map=service.queryByPhone(phonenumber);
				request.getSession().setAttribute("user", map);
				request.getSession().setAttribute("userid", map.get("UUID"));
				response.sendRedirect(request.getContextPath()+"/users/index.do?method=query");
				return;
			}
			else {//已注册的用户登录
				request.getSession().setAttribute("user", map);
				request.getSession().setAttribute("userid", map.get("UUID"));
				response.sendRedirect(request.getContextPath()+"/users/index.do?method=query");
			}
		}
		else {//验证码错误
			request.setAttribute("err", "验证码错误！");
			request.setAttribute("errindex", 0);
			request.getRequestDispatcher("/logein/login.jsp").forward(request, response);
		}
	}

	/**
	 * @desc 学号登录
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ServletException
	 * @throws IOException
	 */
	private void logein(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		//获取用户输入
		String sid = request.getParameter("sid");
		String password = request.getParameter("password");
		//数据库查询
		Map<String, Object> map=service.executeaccountForSid(sid);
		//数据库存在的用户
		if (map!=null) {
			if (map.get("password").equals(password)) {
					request.getSession().setAttribute("user", map);
					request.getSession().setAttribute("userid", map.get("UUID"));
					response.sendRedirect(request.getContextPath()+"/users/index.do?method=query");
			}
			else {//登录失败
				request.setAttribute("err", "学号与密码不匹配！");
				request.setAttribute("errindex", 1);
				request.setAttribute("sid", sid);
				request.getRequestDispatcher("/logein/login.jsp").forward(request, response);
			}
		}
		else {//登录失败
			Map<String, Object> mapadm=service.queryAdmin(sid,password);
			if (mapadm!=null) {//管理员登录
				
				request.getSession().setAttribute("user", mapadm);
				request.getRequestDispatcher("/managerjsp/index.jsp").forward(request, response);
			}
			else {
				request.setAttribute("err", "该账号尚未注册,请使用手机号登录！");
				request.setAttribute("errindex", 1);
				request.getRequestDispatcher("/logein/login.jsp").forward(request, response);
			}
		}
		
		
	}
	
	
	
	
}
