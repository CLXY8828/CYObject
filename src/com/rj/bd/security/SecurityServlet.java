package com.rj.bd.security;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.ClientProtocolException;

import com.rj.bd.messageutrl.SmsCodeException;
import com.rj.bd.utrl.CodeUtrl;
import com.rj.bd.utrl.EmailUtils;

@SuppressWarnings("serial")
public class SecurityServlet extends HttpServlet {
	SecurityService service = new SecurityService();
	CodeUtrl utrl = new CodeUtrl();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String q = request.getParameter("method");
		try {
			if ("changepasswordpage".equals(q)) {
				changepasswordpage(request,response);
			}
			else if ("changepasswordphonepage".equals(q)) {
				changepasswordphonepage(request,response);
			}
			else if ("changepasswordphone".equals(q)) {
				changepasswordphone(request,response);
			}
			else if ("formphone".equals(q)) {
				formphone(request,response);
			}
			else if ("changepassword".equals(q)) {
				changepassword(request,response);
			}
			else if ("savepassword".equals(q)) {
				savepassword(request,response);
			}
			else if ("formpass".equals(q)) {
				formpass(request,response);
			}
			else if ("changepasswordpasspage".equals(q)) {
				changepasswordpasspage(request,response);
			}
			else if ("changephonepage".equals(q)) {
				changephonepage(request,response);
			}
			else if ("changephoneOK".equals(q)) {
				changephoneOK(request,response);
			}
			else if ("changephone".equals(q)) {
				changephone(request,response);
			}
			else if ("phoneok".equals(q)) {
				phoneok(request,response);
			}
			else if ("changephoneemail".equals(q)) {
				changephoneemail(request,response);
			}
			else if ("changephoneemailok".equals(q)) {
				changephoneemailok(request,response);
			}
			else if ("changephoneemailpage".equals(q)) {
				changephoneemailpage(request,response);
			}
		} catch (SmsCodeException | ClassNotFoundException | SQLException | MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * @desc 跳转邮箱验证修改手机页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void changephoneemailpage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/security/changephoneemail.jsp").forward(request, response);
		
	}

	/**
	 * @desc 验证邮箱验证码
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void changephoneemailok(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		boolean yz = EmailUtils.TestCode(email, code);
		if (!yz) {
			PrintWriter print = response.getWriter();
			print.write("no");
			print.flush();
			print.close();
		}
		else {
			PrintWriter print = response.getWriter();
			print.write("yes");
			print.flush();
			print.close();
		}
	}

	/**
	 * @desc 发送邮件验证码
	 * @param request
	 * @param response
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	 */
	private void changephoneemail(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, MessagingException {
		String email = request.getParameter("email");
		EmailUtils.createMimeMessage(email, CodeUtrl.createCode());
	}

	/**
	 * @desc 验证手机号是否重复
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 */
	private void phoneok(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		String phone = request.getParameter("phone");
		Map<String, Object> phones = service.isphone(phone);
		System.out.println(phones);
		if (phones==null) {
			PrintWriter print = response.getWriter();
			print.write("yes");
			print.flush();
			print.close();
		}
		else {
			PrintWriter print = response.getWriter();
			print.write("no");
			print.flush();
			print.close();
		}
	}

	/**
	 * @desc 跳转修改手机号页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void changephone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/security/changephone.jsp").forward(request, response);
		
	}

	/**
	 * @desc 修改手机号跳转验证页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void changephoneOK(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/security/changephoneOK.jsp").forward(request, response);
		
	}
	/**
	 * @desc 跳转修改手机号选择页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void changephonepage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/security/changephonepage.jsp").forward(request, response);
		
	}
	/**
	 * @desc 验证密码
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	private void formpass(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		String password = request.getParameter("password");
		Map user = (Map)request.getSession().getAttribute("user");
		Map<String, Object> map = service.testPassword(password,(String)user.get("UUID"));
		System.out.println(map);
		if (map==null) {
			PrintWriter print = response.getWriter();
			print.write("no");
			print.flush();
			print.close();
			return;
		}
		PrintWriter print = response.getWriter();
		print.write("yes");
		print.flush();
		print.close();
	}
	/**
	 * @desc 原密码验证页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void changepasswordpasspage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/security/changepasswordpasspage.jsp").forward(request, response);
	}
	/**
	 * @desc 修改密码
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	private void savepassword(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		System.out.println(11111);
		Map user = (Map)request.getSession().getAttribute("user");
		String newpassword = request.getParameter("newpassword");
		service.savepassword((String)user.get("UUID"),newpassword);
		
	}
	/**
	 * @desc 进入修改密码页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void changepassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/security/changepassword.jsp").forward(request,response);
		
	}
	/**
	 * @desc 验证验证码
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void formphone(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		String code = request.getParameter("code");
		boolean yz = utrl.testPhoneCode((String)((Map)request.getSession().getAttribute("user")).get("phone"), code);
		if (!yz) {
			PrintWriter print = response.getWriter();
			print.write("no");
			print.flush();
			print.close();
		}
		else {
			PrintWriter print = response.getWriter();
			print.write("yes");
			print.flush();
			print.close();
			String phone = request.getParameter("phone");
			if (phone!=null) {
				service.savephone(phone,(String)((Map)request.getSession().getAttribute("user")).get("UUID"));
			}
		}
		
	}
	/**
	 * @desc 跳转手机验证页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void changepasswordphonepage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/security/changepasswordphone.jsp").forward(request, response);
		
	}
	/**
	 * @desc 发送验证码
	 * @param request
	 * @param response
	 * @throws ClientProtocolException
	 * @throws IOException
	 * @throws SmsCodeException
	 */
	private void changepasswordphone(HttpServletRequest request, HttpServletResponse response) throws ClientProtocolException, IOException, SmsCodeException {
		String phonecode = request.getParameter("userphone");//获取用户输入的验证码
		System.out.println(phonecode);
		utrl.createPhoneCode(phonecode);//发送验证码
		
	}
	/**
	 * @desc 跳转修改密码页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void changepasswordpage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/security/changepasswordpage.jsp").forward(request, response);
		
	}
	
	
	
}
