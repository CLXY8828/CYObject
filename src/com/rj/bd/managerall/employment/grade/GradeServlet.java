package com.rj.bd.managerall.employment.grade;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.rj.bd.managerall.utils.ExcelUtils;
/**
 * @desc   就业年纪管理m层
 * @author 秋月蓝璃
 */
@SuppressWarnings("serial")
public class GradeServlet extends  HttpServlet{
	GradeService gradeservice = new GradeService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try 
		  {
			String method=request.getParameter("method");
		    if ("query".equals(method)) {
		    	this.query(request,response);
		    }else if("edit".equals(method)){
		    	this.edit(request,response);
		    }else if("export".equals(method)){
		    	this.export(request,response);
		    }else if("exportstu".equals(method)){
		    	this.exportstu(request,response);
		    }else if("delete".equals(method)){
		    	this.delete(request,response);
		    }else if("add".equals(method)){
		    	this.add(request,response);
		    }else if("turn".equals(method)){
		    	this.turn(request,response);
		    }
		  } 
		  catch (Exception e) 
		  {
			  System.out.println("1.首先需要打印出异常的信息为:"+e.getMessage());
			  System.out.println("2.其实异常发送的内存地址："+e.getStackTrace());
		   }  
	}
	/**
	 * @desc  跳转到详情界面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void turn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String department_id = request.getParameter("department_id");
		request.setAttribute("department_id", department_id);
		request.getRequestDispatcher("/managerjsp/employment/gradeinfo/gradeindex.jsp").forward(request, response);
	}
	/**
	 * @desc  添加数据
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		String page = request.getParameter("page");
		String department_name = request.getParameter("department_name");
		gradeservice.addValue(department_name);
		response.sendRedirect(request.getContextPath()+"/grade/grade.do?method=query&page="+page);
		
	}
	/**
	 * @desc  删除年纪信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String page = request.getParameter("page");
		String department_id = request.getParameter("department_id");
		System.out.println("page+"+page);
		System.out.println("department_id+"+department_id);
		gradeservice.deleteValue(department_id);
		response.sendRedirect(request.getContextPath()+"/grade/grade.do?method=query&page="+page);
	}
	/**
	 * @desc  导出年纪下学生信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void exportstu(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		String department_id = request.getParameter("department_id");
		System.out.println("department_id+"+department_id);
		
		ExcelUtils.settings(response, "年纪学生信息.xls");
		//1.调用M层获取到数据
		List<Map<String, Object>> list_job = gradeservice.selectExportStuValue(department_id);
		
		//2.利用poi实现将获取到的数据写入到excel中
		 //2.1初始化poi的核心类
		 HSSFWorkbook workbook=new HSSFWorkbook();
		 String sheetname="就业学生信息的sheet";

		 HSSFSheet sheet = workbook.createSheet(sheetname);
		 
		 //2.2调用poi中的相关API把数据写入到excel中
		 HSSFRow row = sheet.createRow(0);//创建第一行，即表头
		 String [] tableTop={"学号","姓名", "qq", "身份证号","性别","就业状态" };
		 //像第一行中添加数据（创建表头）
		 for(int i =0;i<tableTop.length;i++)
		 {
			 row.createCell(i).setCellValue(tableTop[i]);
		 }
		 
		 
		 //从第二行开始向里面写入数据
		 String[] columnName = { "sid","name","sqq","IDnumber","ssex",""};
		 for(int i =0;i<list_job.size();i++)
		 {
		    HSSFRow row2 = sheet.createRow(i+1);
			
		    Map<String, Object> map = list_job.get(i);//从list中取出数据 
			for(int k=0;k<columnName.length;k++)//将获取到的每一个map写入到一个新的row2对象中（一个row2对象即是excel表格中的一行）
			{
				sheet.autoSizeColumn(k, true);//设定表格进行自动适配，但是对中文不是特别友好
				if(k==5){
					row2.createCell(k).setCellValue("未就业");
				}else{
					row2.createCell(k).setCellValue((String)map.get(columnName[k]));
				}
				
			}
		 }
		 ExcelUtils.setColumnAutoAdapter(sheet, list_job.size()+1);
		 
		 List<Map<String, Object>> list_nojob = gradeservice.selectExportStuNoValue(department_id);
		 
		 String sheetname_stu="申请岗位的学生的信息sheet";

		 HSSFSheet sheet_stu = workbook.createSheet(sheetname_stu);
		 
		 //2.2调用poi中的相关API把数据写入到excel中
		 HSSFRow row_stu = sheet_stu.createRow(0);//创建第一行，即表头
		 String [] tableTop_stu={"学号","姓名", "qq", "身份证号","性别","就业状态"};
		 //像第一行中添加数据（创建表头）
		 for(int i =0;i<tableTop_stu.length;i++)
		 {
			 row_stu.createCell(i).setCellValue(tableTop_stu[i]);
		 }
		 
		 
		 //从第二行开始向里面写入数据
		 String[] columnName_stu = { "data_sid","data_sname","data_qq","data_IDnumber","data_sex",""};
		 for(int i =0;i<list_nojob.size();i++)
		 {
		    HSSFRow row2_stu = sheet_stu.createRow(i+1);
			
		    Map<String, Object> map_stu = list_nojob.get(i);//从list中取出数据 
			for(int k=0;k<columnName_stu.length;k++)//将获取到的每一个map写入到一个新的row2对象中（一个row2对象即是excel表格中的一行）
			{
				sheet_stu.autoSizeColumn(k, true);//设定表格进行自动适配，但是对中文不是特别友好
				if(k==5){
					row2_stu.createCell(k).setCellValue("未就业");
				}else{
					row2_stu.createCell(k).setCellValue((String)map_stu.get(columnName_stu[k]));
				}
				
			}
		 }
		 ExcelUtils.setColumnAutoAdapter(sheet_stu, list_nojob.size()+1);
		 
		//2.3保存
		 OutputStream outputStream = response.getOutputStream();
		 workbook.write(outputStream);
		 outputStream.close();
	}
	/**
	 * @desc  导出就业信息
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 */
	private void export(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		String department_id = request.getParameter("department_id");
		List<Map<String, Object>> list = gradeservice.selectExportValue(department_id);
		ExcelUtils.settings(response, "年纪就业信息.xls");
		//1.调用M层获取到数据
		
		//2.利用poi实现将获取到的数据写入到excel中
		 //2.1初始化poi的核心类
		 HSSFWorkbook workbook=new HSSFWorkbook();
		 String sheetname="年纪就业信息sheet";
	
		 HSSFSheet sheet = workbook.createSheet(sheetname);
		 
		 //2.2调用poi中的相关API把数据写入到excel中
		 HSSFRow row = sheet.createRow(0);//创建第一行，即表头
		 String [] tableTop={"年纪名称", "总人数", "就业人数","未就业人数","就业率","下创班级" };
		 //像第一行中添加数据（创建表头）
		 for(int i =0;i<tableTop.length;i++)
		 {
			 row.createCell(i).setCellValue(tableTop[i]);
		 }
		 
		 
		 //从第二行开始向里面写入数据
		 String[] columnName = { "department_name","sum","job","no_job","job_lv","class_num"};
		 for(int i =0;i<list.size();i++)
		 {
		    HSSFRow row2 = sheet.createRow(i+1);
			
		    Map<String, Object> map = list.get(i);//从list中取出数据 
			for(int k=0;k<columnName.length;k++)//将获取到的每一个map写入到一个新的row2对象中（一个row2对象即是excel表格中的一行）
			{
				sheet.autoSizeColumn(k, true);//设定表格进行自动适配，但是对中文不是特别友好
				if(k==0){
					row2.createCell(k).setCellValue((String)map.get(columnName[k]));
				}else if(k==4){
					row2.createCell(k).setCellValue((String)map.get(columnName[k]));
				}else{
					row2.createCell(k).setCellValue((int)map.get(columnName[k]));
				}
			}
		 }
		 ExcelUtils.setColumnAutoAdapter(sheet, list.size()+1);
		 //2.3保存
		 OutputStream outputStream = response.getOutputStream();
		 workbook.write(outputStream);
		 outputStream.close();
	}
	/**
	 * @desc  编辑
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		String page = request.getParameter("page");
		String department_id = request.getParameter("department_id");
		String department_name = request.getParameter("department_name");
		System.out.println("department_id+"+department_id);
		System.out.println("page+"+page);
		gradeservice.editName(department_name,department_id);
		response.sendRedirect(request.getContextPath()+"/grade/grade.do?method=query&page="+page);
	}

	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException, InterruptedException {
		String page1 =request.getParameter("page");
		int page = Integer.parseInt(page1);
		List<Map<String, Object>> list_value = gradeservice.selectValue(page);
		int count =list_value.size();
		System.out.println(count);
		request.setAttribute("list_value", list_value);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/managerjsp/employment/gradesetting.jsp").forward(request, response);
	}


}
