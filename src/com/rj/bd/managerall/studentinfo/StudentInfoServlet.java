package com.rj.bd.managerall.studentinfo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.rj.bd.managerall.utils.ExcelUtils;


@SuppressWarnings("serial")

public class StudentInfoServlet extends  HttpServlet{
	StudentInfoService studentinfoservice = new StudentInfoService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		  {
			  String method=request.getParameter("method");
			    if ("queryinfo".equals(method)){
			    	this.queryinfo(request,response);
			    }else if("indelete".equals(method)){
			    	this.indelete(request,response);
				}else if("inedit".equals(method)){
			    	this.inedit(request,response);
				}else if("querydelete".equals(method)){
			    	this.querydelete(request,response);
				}else if("dedelete".equals(method)){
			    	this.dedelete(request,response);
			    }else if("deletecheck".equals(method)){
			    	this.deletecheck(request,response);
			    }else if("importExcel".equals(method)){
			    	this.importExcel(request,response);
			    }else if("xiazaimoban".equals(method)){
			    	this.xiazaimoban(request,response);
				}else if("xiazaimoban".equals(method)){
			    	this.xiazaimoban(request,response);
				}else if("singileadd".equals(method)){
					this.singileadd(request,response);
				}
			    
		} 
		  catch (Exception e) 
		  {
			  System.out.println("1.首先需要打印出异常的信息为:"+e.getMessage());
			  System.out.println("2.其实异常发送的内存地址："+e.getStackTrace());
		   }
	}
	/**
	 * @desc  单条信息导入
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	private void singileadd(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String data_sname =request.getParameter("data_sname");
		String data_sex =request.getParameter("data_sex");
		String data_nation =request.getParameter("data_nation");
		String data_class =request.getParameter("data_class");
		String data_scrollnum =request.getParameter("data_scrollnum");
		String data_homephone =request.getParameter("data_homephone");
		String data_qq =request.getParameter("data_qq");
		String data_IDnumber =request.getParameter("data_IDnumber");
		String data_examid =request.getParameter("data_examid");
		String data_registeraddress =request.getParameter("data_registeraddress");
		String data_sid =request.getParameter("data_sid");
		studentinfoservice.singileAdd(data_sid,data_sname,data_IDnumber,data_examid,data_registeraddress,data_sex
				,data_class,data_homephone,data_scrollnum,data_nation,data_qq);
		//重定向
		response.sendRedirect(request.getContextPath()+"/student/info.do?method=queryinfo&page="+1);
	}
	/**
	 * @desc  导入模板下载
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void xiazaimoban(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ExcelUtils.settings(response, "批量注册导入模板.xls");
		 HSSFWorkbook workbook=new HSSFWorkbook();
		 String sheetname="批量注册导入模板的sheet";
		 HSSFSheet sheet = workbook.createSheet(sheetname);
		 HSSFRow row = sheet.createRow(0);//创建第一行，即表头
		 String [] tableTop={ "学号", "姓名","身份证号","考生号","户籍所在地","性别","班级","家庭联系方式","学籍号","民族","qq"};
		 for(int i =0;i<tableTop.length;i++)
		 {
			 row.createCell(i).setCellValue(tableTop[i]);
		 }
		 OutputStream outputStream = response.getOutputStream();
		 workbook.write(outputStream);
		 outputStream.close();
	}
	/**
	 * @desc  导入excel
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void importExcel(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		String fed=request.getParameter("fed");
		System.out.println("fed:"+fed);
		Workbook  wb = null;//备注：导入的包一定都是ss下的
		Sheet  sheet;
		Row row;
		File file=new File(fed);
		FileInputStream fileInputStream=new FileInputStream(file);
		
		 if (file.isFile() && file.exists()) 
		 {
			String excelName = file.getName();//获取当前文件的名字
			int st = excelName.lastIndexOf("."); //截取后缀开始的前一位
			System.out.println(st); 
			String suffix = (String) excelName.subSequence(st+1, excelName.length());//截取文件的后缀
			System.out.println(suffix);
			if (suffix.equals("xlsx"))
			{
			  System.out.println("走2007的解析......");	
			  wb=new XSSFWorkbook(fileInputStream);
			}
			else if (suffix.equals("xls")) 
			{
			  System.out.println("走2003的解析......");	
	          wb=new HSSFWorkbook(fileInputStream);
			}
		 }
		 sheet=wb.getSheetAt(0);  //获取当前excel工作簿中的第一个sheet
		 //获取当前sheet中有多少个行
		 int totalRowNums = sheet.getPhysicalNumberOfRows();
		 
		 for(int i =1;i<totalRowNums;i++)
		 {
			  row = sheet.getRow(i);//获取每一行
			 int totalCellNums = row.getPhysicalNumberOfCells();//获取每一行中有多少列
			 List<String> columnValuesList=new ArrayList<String>();
			 for(int k =0;k<totalCellNums;k++)
			 {
			 Cell cell = row.getCell(k);//获取每一列对象   
			 String cellValue = ExcelUtils.getFormatValue(cell);
			 columnValuesList.add(k, cellValue);//将每一列上的值都转入到list容器中	 
			 }
			 studentinfoservice.saveImportExcel(columnValuesList);//每整完一行保存一次
		 }
		//重定向
		 	response.sendRedirect(request.getContextPath()+"/student/info.do?method=queryinfo&page="+1);
		 }
	/**
	 * @desc  批量删除
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 */
	private void deletecheck(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		//1.接值
		String[] delArray = request.getParameterValues("delArray");
		for (String everyId : delArray) 
		{
			System.out.println("everyId:"+everyId);
		}
		
		//2.调用service中的方法进行删除
		studentinfoservice.dedeleteByIds(delArray);
		//3.重定向
		response.sendRedirect(request.getContextPath()+"/student/info.do?method=querydelete&page="+1);
	}

	/**
	 * @desc  批量删除的删除
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void dedelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		
		//1.接值
		String student_id=request.getParameter("student_id");
		//2.调用service中的方法进行删除
		studentinfoservice.dedeleteByIds(student_id);
		//3.重定向
		response.sendRedirect(request.getContextPath()+"/student/info.do?method=querydelete&page="+1);
	}


	
	
	
	/**
	 * @desc  批量删除查询
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void querydelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		//接取页面显示条数
		String queryCondition = request.getParameter("queryCondition");
		String query_select=request.getParameter("queryinfo");
		String page1 =request.getParameter("page");
		int page = Integer.parseInt(page1);
		List<Map<String, Object>> list = studentinfoservice.selectdeletValue(queryCondition,query_select,page);
		int count = studentinfoservice.selectCount(queryCondition,query_select);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("queryCondition", queryCondition);
		request.setAttribute("queryinfo", query_select);
		request.getRequestDispatcher("/managerjsp/studentinfo/batchdeletion.jsp").forward(request, response);
		
		
	}
	
	
	/**
	 * @desc  批量注册的编辑
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void inedit(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		//1.接值
		String data_id = request.getParameter("student_id");
		String data_sname = request.getParameter("data_sname");
		String data_sex = request.getParameter("data_sex");
		
		String data_nation = request.getParameter("data_nation");
		String data_class = request.getParameter("data_class");
		String data_scrollnum = request.getParameter("data_scrollnum");
		
		String data_homephone = request.getParameter("data_homephone");
		String data_qq = request.getParameter("data_qq");
		
		String data_IDnumber = request.getParameter("data_IDnumber");
		String data_examid = request.getParameter("data_examid");
		
		String data_registeraddress = request.getParameter("data_registeraddress");
		String data_sid = request.getParameter("data_sid");
		
		//2.存值
		studentinfoservice.editValue(data_sname,data_sex,data_nation,data_class,data_scrollnum,data_homephone,data_qq,data_IDnumber,data_examid,data_registeraddress,data_sid,data_id);
		
		
		//3.重定向
		response.sendRedirect(request.getContextPath()+"/student/info.do?method=queryinfo&page="+1);
	}
	/**
	 * @desc  批量注册的删除
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void indelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		
		//1.接值
		String student_id=request.getParameter("student_id");
		//2.调用service中的方法进行删除
		studentinfoservice.deleteByIds(student_id);
		//3.重定向
		response.sendRedirect(request.getContextPath()+"/student/info.do?method=queryinfo&page="+1);
		
	}

	/**
	 * @desc  批量注册的查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private void queryinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		//接取页面显示条数
		String queryCondition = request.getParameter("queryCondition");
		String query_select=request.getParameter("queryinfo");
		String page1 =request.getParameter("page");
		int page = Integer.parseInt(page1);
		List<Map<String, Object>> list = studentinfoservice.selectImportValue(queryCondition,query_select,page);
		int count = studentinfoservice.selectCount(queryCondition,query_select);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("queryCondition", queryCondition);
		request.setAttribute("queryinfo", query_select);
		request.getRequestDispatcher("/managerjsp/studentinfo/batchregistration.jsp").forward(request, response);
	}

}
