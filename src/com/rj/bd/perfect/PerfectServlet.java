package com.rj.bd.perfect;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;



@SuppressWarnings("serial")
public class PerfectServlet extends HttpServlet {
	PerfectService service = new PerfectService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String q = request.getParameter("method");
		try {
			if ("formjb".equals(q)) {
				formjb(request,response);
			}
			else if ("formgs".equals(q)) {
				formgs(request,response);
			}
			else if ("perfactlist".equals(q)) {
				perfactlist(request,response);
			}
			else if ("perfectsavepage".equals(q)) {
				perfectsavepage(request,response);
			}
			else if ("saveall".equals(q)) {
				saveall(request,response);
			}
			else if ("everygsname".equals(q)) {
				everygsname(request,response);
			}
		} catch (ClassNotFoundException | SQLException | InterruptedException e) {
			e.printStackTrace();
		}
		
	
	}

	private void everygsname(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		
		String gsname = request.getParameter("gsname");
		List<Map<String, Object>> gsnamelist = service.mqueryBygsname(gsname);
		ObjectMapper  om=new ObjectMapper();
		String result = om.writeValueAsString(gsnamelist);
		PrintWriter print = response.getWriter();
		print.write(result);
		print.flush();
		print.close();
		
		
	}

	/**
	 * @desc 修改信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws InterruptedException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 * @throws ServletException 
	 */
	private void saveall(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, InterruptedException, SQLException, IOException, ServletException {
		String qq = request.getParameter("qq");
		String student_jy = request.getParameter("gzjy");//工作经验
		String email = request.getParameter("email");
		String processdate = request.getParameter("sfjy");//是否就业
		String destination_id = request.getParameter("byqx");//毕业去向
		String gname = request.getParameter("gsname");
		String nature_id = request.getParameter("dwxz");//单位性质
		String companyaddress_id = request.getParameter("dwdz");//单位地址
		String industry_id = request.getParameter("dwhy");//单位行业
		String positiontype_id = request.getParameter("zwlb");//职位类别
		String contact_person = request.getParameter("contact_person");//单位联系人
		String cell_phone = request.getParameter("cell_phone");//联系人电话
		String sphone = request.getParameter("sphone");//联系人手机
		String contact_email = request.getParameter("contact_email");//联系人邮箱
		String company_address = request.getParameter("company_address");//单位地址
		String sutdent_address = request.getParameter("sutdent_address");//现居地址
		String schooljz = request.getParameter("school-jz");//奖状
		String schoolsh = request.getParameter("school-sh");//三好学生
		String schoolbw = request.getParameter("school-bw");//班委
		String schoolhd = request.getParameter("school-hd");//活动
		String hobby = request.getParameter("hobby");//喜好
		String Insufficient = request.getParameter("Insufficient");//不足
		String evaluate = request.getParameter("evaluate");//评价
		String advantage = request.getParameter("advantage");//优势
		String honor = request.getParameter("honor");//荣誉
		String Feeling = request.getParameter("Feeling");//感受
		Map user = (Map)request.getSession().getAttribute("user");
		service.saveall(qq,student_jy,email,processdate,destination_id,gname,nature_id,companyaddress_id,industry_id,positiontype_id,contact_person,cell_phone,sphone,contact_email
				,company_address,sutdent_address,schooljz,schoolsh,schoolbw,schoolhd,hobby,Insufficient,evaluate,advantage,honor,Feeling,(String)user.get("UUID"));
		user=service.executeaccountForSid(user.get("UUID")+"");
		request.getSession().setAttribute("user", user);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	/**
	 * @desc 跳转修改信息页
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void perfectsavepage(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		List<Map<String, Object>> byqx = service.querybyqx();
		List<Map<String, Object>> dwxz = service.querydwxz();
		List<Map<String, Object>> dwdz = service.querydwdz();
		List<Map<String, Object>> dwhy = service.querydwhy();
		List<Map<String, Object>> zwlb = service.queryzwlb();
		request.setAttribute("byqx", byqx);
		request.setAttribute("dwxz", dwxz);
		request.setAttribute("dwdz", dwdz);
		request.setAttribute("dwhy", dwhy);
		request.setAttribute("zwlb", zwlb);
		Map user = (Map)request.getSession().getAttribute("user");
		Map<String, Object> map = service.querylist((String)user.get("UUID"));
		request.setAttribute("map", map);
		request.getRequestDispatcher("/perfect/perfectsave.jsp").forward(request, response);
	}

	/**
	 * @desc 完善后的信息查询
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void perfactlist(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		Map user = (Map)request.getSession().getAttribute("user");
		Map<String, Object> map = service.querylist((String)user.get("UUID"));
		request.setAttribute("map", map);
		request.getRequestDispatcher("/perfect/perfectlist.jsp").forward(request, response);
	}

	/**
	 * @desc 公司信息
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws InterruptedException 
	 * @throws com.rj.bd.object.PcException 
	 * @throws PcException 
	 */
	private void formgs(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException, InterruptedException{
		String destination_id = request.getParameter("destination_id");
		System.out.println(destination_id);
		String gsname = request.getParameter("gsname");
		System.out.println(gsname);
		String nature_id = request.getParameter("nature_id");
		System.out.println(nature_id);
		String companyaddress_id = request.getParameter("companyaddress_id");
		System.out.println(companyaddress_id);
		String industry_id = request.getParameter("industry_id");
		String cell_phone = request.getParameter("cell_phone");
		String sphone = request.getParameter("sphone");
		String contact_email = request.getParameter("contact_email");
		String company_address = request.getParameter("company_address");
		String positiontype_id = request.getParameter("positiontype_id");
		String contact_person = request.getParameter("contact_person");
		Map user = (Map)request.getSession().getAttribute("user");
		Map<String, Object> ws = service.queryws(user);
		System.out.println(ws);
		if (ws==null) {
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
		service.savegs((String)user.get("UUID"),(String)user.get("sid"),destination_id,gsname,nature_id,companyaddress_id,industry_id,cell_phone,sphone,contact_email,company_address,positiontype_id,contact_person);
		user=service.executeaccountForSid(user.get("UUID")+"");
		request.getSession().setAttribute("user", user);
	}

	/**
	 * @desc 基本信息
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	private void formjb(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
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
		Map<String, Object> yz = service.queryimp(NumbID,name);
		Map<String, Object> ws = service.queryws(sid);
		if (yz==null||ws!=null) {
			PrintWriter print = response.getWriter();
			print.write("no");
			print.flush();
			print.close();
			return;
		}
		System.out.println(222);
		service.savejb((String)user.get("UUID"),name,sex,qq,email,sid,NumbID,phonecode,address,gzjy,(String)yz.get("data_examid"),(String)yz.get("data_id"));
		ws=service.queryws(user);
		request.getSession().setAttribute("ws",ws);
		if (sfjy.equals("1")) {
			PrintWriter print = response.getWriter();
			print.write("yes");
			print.flush();
			print.close();
		}
		
	}
	

}
