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
			  System.out.println("1.???????????????????????????????????????:"+e.getMessage());
			  System.out.println("2.????????????????????????????????????"+e.getStackTrace());
		   }
	}
	/**
	 * @desc  ??????????????????
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
		//?????????
		response.sendRedirect(request.getContextPath()+"/student/info.do?method=queryinfo&page="+1);
	}
	/**
	 * @desc  ??????????????????
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void xiazaimoban(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ExcelUtils.settings(response, "????????????????????????.xls");
		 HSSFWorkbook workbook=new HSSFWorkbook();
		 String sheetname="???????????????????????????sheet";
		 HSSFSheet sheet = workbook.createSheet(sheetname);
		 HSSFRow row = sheet.createRow(0);//???????????????????????????
		 String [] tableTop={ "??????", "??????","????????????","?????????","???????????????","??????","??????","??????????????????","?????????","??????","qq"};
		 for(int i =0;i<tableTop.length;i++)
		 {
			 row.createCell(i).setCellValue(tableTop[i]);
		 }
		 OutputStream outputStream = response.getOutputStream();
		 workbook.write(outputStream);
		 outputStream.close();
	}
	/**
	 * @desc  ??????excel
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void importExcel(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		String fed=request.getParameter("fed");
		System.out.println("fed:"+fed);
		Workbook  wb = null;//?????????????????????????????????ss??????
		Sheet  sheet;
		Row row;
		File file=new File(fed);
		FileInputStream fileInputStream=new FileInputStream(file);
		
		 if (file.isFile() && file.exists()) 
		 {
			String excelName = file.getName();//???????????????????????????
			int st = excelName.lastIndexOf("."); //??????????????????????????????
			System.out.println(st); 
			String suffix = (String) excelName.subSequence(st+1, excelName.length());//?????????????????????
			System.out.println(suffix);
			if (suffix.equals("xlsx"))
			{
			  System.out.println("???2007?????????......");	
			  wb=new XSSFWorkbook(fileInputStream);
			}
			else if (suffix.equals("xls")) 
			{
			  System.out.println("???2003?????????......");	
	          wb=new HSSFWorkbook(fileInputStream);
			}
		 }
		 sheet=wb.getSheetAt(0);  //????????????excel????????????????????????sheet
		 //????????????sheet??????????????????
		 int totalRowNums = sheet.getPhysicalNumberOfRows();
		 
		 for(int i =1;i<totalRowNums;i++)
		 {
			  row = sheet.getRow(i);//???????????????
			 int totalCellNums = row.getPhysicalNumberOfCells();//??????????????????????????????
			 List<String> columnValuesList=new ArrayList<String>();
			 for(int k =0;k<totalCellNums;k++)
			 {
			 Cell cell = row.getCell(k);//?????????????????????   
			 String cellValue = ExcelUtils.getFormatValue(cell);
			 columnValuesList.add(k, cellValue);//?????????????????????????????????list?????????	 
			 }
			 studentinfoservice.saveImportExcel(columnValuesList);//???????????????????????????
		 }
		//?????????
		 	response.sendRedirect(request.getContextPath()+"/student/info.do?method=queryinfo&page="+1);
		 }
	/**
	 * @desc  ????????????
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 */
	private void deletecheck(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		//1.??????
		String[] delArray = request.getParameterValues("delArray");
		for (String everyId : delArray) 
		{
			System.out.println("everyId:"+everyId);
		}
		
		//2.??????service????????????????????????
		studentinfoservice.dedeleteByIds(delArray);
		//3.?????????
		response.sendRedirect(request.getContextPath()+"/student/info.do?method=querydelete&page="+1);
	}

	/**
	 * @desc  ?????????????????????
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void dedelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		
		//1.??????
		String student_id=request.getParameter("student_id");
		//2.??????service????????????????????????
		studentinfoservice.dedeleteByIds(student_id);
		//3.?????????
		response.sendRedirect(request.getContextPath()+"/student/info.do?method=querydelete&page="+1);
	}


	
	
	
	/**
	 * @desc  ??????????????????
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void querydelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		//????????????????????????
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
	 * @desc  ?????????????????????
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void inedit(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		//1.??????
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
		
		//2.??????
		studentinfoservice.editValue(data_sname,data_sex,data_nation,data_class,data_scrollnum,data_homephone,data_qq,data_IDnumber,data_examid,data_registeraddress,data_sid,data_id);
		
		
		//3.?????????
		response.sendRedirect(request.getContextPath()+"/student/info.do?method=queryinfo&page="+1);
	}
	/**
	 * @desc  ?????????????????????
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void indelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		
		//1.??????
		String student_id=request.getParameter("student_id");
		//2.??????service????????????????????????
		studentinfoservice.deleteByIds(student_id);
		//3.?????????
		response.sendRedirect(request.getContextPath()+"/student/info.do?method=queryinfo&page="+1);
		
	}

	/**
	 * @desc  ?????????????????????
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private void queryinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		//????????????????????????
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
