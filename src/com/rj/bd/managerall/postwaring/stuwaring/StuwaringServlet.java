package com.rj.bd.managerall.postwaring.stuwaring;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
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

/**
 * @desc  学生预警M层
 * @author 秋月蓝璃
 */

import com.rj.bd.managerall.utils.Dates;
import com.rj.bd.managerall.utils.ExcelUtils;
@SuppressWarnings("serial")
public class StuwaringServlet extends  HttpServlet{
	StuwaringService stuwaringservice = new StuwaringService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try 
		  {
			  String method=request.getParameter("method");
			    if ("query".equals(method)) {
			    	this.query(request,response);
			    }else if("export".equals(method)){
			    	this.export(request,response);
			    }else if("sendemail".equals(method)){
			    	this.sendemail(request,response);
			    }
		} 
		  catch (Exception e) 
		  {
			  System.out.println("1.首先需要打印出异常的信息为:"+e.getMessage());
			  System.out.println("2.其实异常发送的内存地址："+e.getStackTrace());
		   }
	}
	private void sendemail(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String sid = request.getParameter("sid");
		System.out.println(sid);
		stuwaringservice.alertState(sid);
	}
/**
 * @desc  导出未就业学生信息
 * @param request
 * @param response
 * @throws SQLException 
 * @throws ClassNotFoundException 
 * @throws IOException 
 */
	private void export(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		ExcelUtils.settings(response, "未就业学生信息.xls");
		//1.调用M层获取到数据
		 List<Map<String, Object>> list=stuwaringservice.selectStudent();
		
		//2.利用poi实现将获取到的数据写入到excel中
		 //2.1初始化poi的核心类
		 HSSFWorkbook workbook=new HSSFWorkbook();
		 String sheetname="未就业学生信息的sheet";
	
		 HSSFSheet sheet = workbook.createSheet(sheetname);
		 
		 //2.2调用poi中的相关API把数据写入到excel中
		 HSSFRow row = sheet.createRow(0);//创建第一行，即表头
		 String [] tableTop={"姓名", "学号", "学生选择未就业日期","联系电话","专业老师" };
		 //像第一行中添加数据（创建表头）
		 for(int i =0;i<tableTop.length;i++)
		 {
			 row.createCell(i).setCellValue(tableTop[i]);
		 }
		 
		 
		 //从第二行开始向里面写入数据
		 String[] columnName = { "name","sid","time","phone","tname"};
		 for(int i =0;i<list.size();i++)
		 {
		    HSSFRow row2 = sheet.createRow(i+1);
			
		    Map<String, Object> map = list.get(i);//从list中取出数据 
			for(int k=0;k<columnName.length;k++)//将获取到的每一个map写入到一个新的row2对象中（一个row2对象即是excel表格中的一行）
			{
				sheet.autoSizeColumn(k, true);//设定表格进行自动适配，但是对中文不是特别友好
				row2.createCell(k).setCellValue((String)map.get(columnName[k]));
			}
		 }
		 ExcelUtils.setColumnAutoAdapter(sheet, list.size()+1);
		 //2.3保存
		 OutputStream outputStream = response.getOutputStream();
		 workbook.write(outputStream);
		 outputStream.close();
		 
	}
/**
 * @desc  学生预警查询
 * @param request
 * @param response
 * @throws IOException 
 * @throws ServletException 
 * @throws SQLException 
 * @throws ClassNotFoundException 
 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		        //接取页面显示条数
				String page1 =request.getParameter("page");
				int page = Integer.parseInt(page1);
				List<Map<String, Object>> list = stuwaringservice.selectValue(page);
				int count = stuwaringservice.selectAccountNum();
				String time = Dates.CurrentTime();
				String timearr[] =time.split("-");
				System.out.println(timearr[1]+"-"+timearr[2]);
				request.setAttribute("list", list);
				request.setAttribute("count", count);
				request.setAttribute("page", page);
				request.setAttribute("nian", timearr[0]);
				request.setAttribute("yue", timearr[1]);
				request.setAttribute("ri", timearr[2]);
				request.getRequestDispatcher("/managerjsp/postwaring/stuworkwarn.jsp").forward(request, response);
	}
}
