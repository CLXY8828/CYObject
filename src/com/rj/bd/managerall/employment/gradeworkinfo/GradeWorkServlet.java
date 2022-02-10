package com.rj.bd.managerall.employment.gradeworkinfo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
@SuppressWarnings("serial")
public class GradeWorkServlet  extends  HttpServlet{
	GradeWorkService gradework = new GradeWorkService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		  {
			String method=request.getParameter("method");
		    if ("queryanalyze".equals(method)) {
		    	this.queryanalyze(request,response);
		    }else if("queryworkinfo".equals(method)){
		    	this.queryworkinfo(request,response);
		    }else if("queryunworkinfo".equals(method)){
		    	this.queryunworkinfo(request,response);
		    }else if("workedit".equals(method)){
		    	this.workedit(request,response);
		    }else if("exportchose".equals(method)){
		    	this.exportchose(request,response);
		    }else if("download".equals(method)){
		    	this.download(request,response);
		    }else if("deletework".equals(method)){
		    	this.deletework(request,response);
		    }
		  } 
		  catch (Exception e) 
		  {
			  System.out.println("1.首先需要打印出异常的信息为:"+e.getMessage());
			  System.out.println("2.其实异常发送的内存地址："+e.getStackTrace());
		   }  
	}
	/**
	 * @desc  就业删除
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	private void deletework(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {
		String id = request.getParameter("id");
		gradework.deleteDepartment_id(id);
		response.sendRedirect(request.getContextPath()+"/gradework/work.do?method=queryworkinfo&page=1");
	}
	/**
	 * @desc  简历预览
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void download(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		String id = request.getParameter("id");
		String path = "D://tools//";
		Map<String,Object> map = gradework.selectFileName(id);
		String filename = (String) map.get("resume_one");
		File file = new File(path+"//"+filename);
        System.out.println(file.isFile());
        FileInputStream fileInputStream = new FileInputStream(file);
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("multipart/form-data");
        IOUtils.write(IOUtils.toByteArray(fileInputStream),response.getOutputStream());
	}
	/**
	 * @desc  选中导出
	 * @param request
	 * @param response
	 */
	private void exportchose(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("exportchose");
	}
	/**
	 * @desc  就业学生编辑
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void workedit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String ssex = request.getParameter("ssex");
		String sid = request.getParameter("sid");
		String IDnumber = request.getParameter("IDnumber");
		String phone = request.getParameter("phone");
		String sqq = request.getParameter("sqq");
		String email = request.getParameter("email");
		String gowork_edit = request.getParameter("gowork_edit");
		String destination_explain = request.getParameter("destination_explain");
		String sutdent_address = request.getParameter("sutdent_address");
		String company_code = request.getParameter("company_code");
		String nature_name = request.getParameter("nature_name");
		String company_name = request.getParameter("company_name");
		String industry_name = request.getParameter("industry_name");
		String companyaddress_name = request.getParameter("companyaddress_name");
		String positiontype_name = request.getParameter("positiontype_name");
		String contact_person = request.getParameter("contact_person");
		String sphone = request.getParameter("sphone");
		String contact_email = request.getParameter("contact_email");
		String company_address = request.getParameter("company_address");
//		gradework.editwork(id,name,ssex,sid,IDnumber,phone,sqq,email,gowork_edit,destination_explain,
//				sutdent_address,company_code,nature_name,company_name,industry_name,companyaddress_name,
//				positiontype_name,contact_person,sphone,contact_email,company_address);
		response.sendRedirect(request.getContextPath()+"/gradework/work.do?method=queryworkinfo&page=1");
	}
	/**
	 * @desc  年纪就业信息柱状图饼状图所需值
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void queryunworkinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/managerjsp/employment/gradeinfo/gradeunworkinfo.jsp").forward(request, response);
	}
	/**
	 * @desc  年纪就业学生详细展示查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private void queryworkinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		String page1 = request.getParameter("page");
		int page = Integer.parseInt(page1);
		String department_id = request.getParameter("department_id");
		List<Map<String, Object>> list_value = gradework.queryworkinfoValue(page,department_id);
		Map<String, Object> map_grade = gradework.selectGradeName(department_id);
		int count =list_value.size();
		System.out.println(count);
		request.setAttribute("list_value", list_value);
		request.setAttribute("map_grade", map_grade);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/managerjsp/employment/gradeinfo/gradeworkinfo.jsp").forward(request, response);
	}
	/**
	 * @desc  年纪未就业学生详细展示页查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void queryanalyze(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/managerjsp/employment/gradeinfo/gradeanalyze.jsp").forward(request, response);
	}
}
