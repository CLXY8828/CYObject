package com.rj.bd.managerall.employment.classset;

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
public class ClassServlet extends  HttpServlet{
	ClassService classservice = new ClassService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		  {
			String method=request.getParameter("method");
		    if ("query".equals(method)) {
		    	this.query(request,response);
		    }else if("edit".equals(method)){
		    	this.edit(request,response);
		    }else if("download".equals(method)){
		    	this.download(request,response);
		    }else if("importExcel".equals(method)){
		    	this.importExcel(request,response);
		    }else if("add".equals(method)){
		    	this.add(request,response);
		    }else if("deleteclass".equals(method)){
		    	this.deleteclass(request,response);
		    }
		  } 
		  catch (Exception e) 
		  {
			  System.out.println("1.首先需要打印出异常的信息为:"+e.getMessage());
			  System.out.println("2.其实异常发送的内存地址："+e.getStackTrace());
		   }  
	}
	/**
	 * @desc  删除班级
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void deleteclass(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		String class_id = request.getParameter("class_id");
//		classservice.delete(class_id);
		response.sendRedirect(request.getContextPath()+"/classs/set.do?method=query&page="+1);
	}
	/**
	 * @desc  添加班级
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String class_name = request.getParameter("class_name");
		String department_id = request.getParameter("department_id");
		String tid = request.getParameter("tid");
		classservice.add(class_name,department_id,tid);
		response.sendRedirect(request.getContextPath()+"/classs/set.do?method=query&page="+1);
	}
	/**
	 * @desc  班级信息导入
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void importExcel(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		String fed=request.getParameter("fed");
		String class_id=request.getParameter("class_id");
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
			 classservice.saveImportExcel(columnValuesList,class_id);//每整完一行保存一次
		 }
		//重定向
		 response.sendRedirect(request.getContextPath()+"/classs/set.do?method=query&page="+1);
	}
	/**
	 * @desc  下载模板
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ExcelUtils.settings(response, "班级信息导入得模板.xls");
		 HSSFWorkbook workbook=new HSSFWorkbook();
		 String sheetname="班级信息导入模板的sheet";
		 HSSFSheet sheet = workbook.createSheet(sheetname);
		 HSSFRow row = sheet.createRow(0);//创建第一行，即表头
		 String [] tableTop={ "学号", "姓名","身份证号","考生号"};
		 for(int i =0;i<tableTop.length;i++)
		 {
			 row.createCell(i).setCellValue(tableTop[i]);
		 }
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
		String class_id = request.getParameter("class_id");
		String class_name = request.getParameter("class_name");
		String department_id = request.getParameter("department_id");
		String tid = request.getParameter("tid");
		classservice.edit(class_id,class_name,department_id,tid);
		response.sendRedirect(request.getContextPath()+"/classs/set.do?method=query&page="+page);
	}
	/**
	 * @desc  查询
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws InterruptedException 
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException, InterruptedException {
		String page1 =request.getParameter("page");
		int page = Integer.parseInt(page1);
		List<Map<String, Object>> list_value = classservice.selectValue(page);
		List<Map<String, Object>> school_department = classservice.selectXinValue();
		List<Map<String, Object>> zteacher = classservice.selectTeacherValue();
		int count =classservice.selectCountValue();
		System.out.println(count);
		request.setAttribute("list_value", list_value);
		request.setAttribute("school_department", school_department);
		request.setAttribute("zteacher", zteacher);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/managerjsp/employment/classsetting.jsp").forward(request, response);
	}
	

}
