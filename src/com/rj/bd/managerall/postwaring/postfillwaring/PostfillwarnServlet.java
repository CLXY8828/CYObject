package com.rj.bd.managerall.postwaring.postfillwaring;

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
 * @desc   岗位招满 M层
 * @author 秋月蓝璃
 *
 */

@SuppressWarnings("serial")
public class PostfillwarnServlet extends  HttpServlet{
	PostfillwarnService postfillservice = new PostfillwarnService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try 
		  {
			  String method=request.getParameter("method");
			    if ("query".equals(method)) {
			    	this.query(request,response);
			    }else if("delete".equals(method)){
			    	this.delete(request,response);
			    }else if("export".equals(method)){
			    	this.export(request,response);
			    }
		} 
		catch (Exception e) 
		{
			 System.out.println("1.首先需要打印出异常的信息为:"+e.getMessage());
			 System.out.println("2.其实异常发送的内存地址："+e.getStackTrace());
		}
	}
	/**
	 * @desc  导出信息
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 */
	private void export(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		ExcelUtils.settings(response, "招满的岗位信息.xls");
		//1.调用M层获取到数据
		 List<Map<String, Object>> list=postfillservice.selectPost();
		
		//2.利用poi实现将获取到的数据写入到excel中
		 //2.1初始化poi的核心类
		 HSSFWorkbook workbook=new HSSFWorkbook();
		 String sheetname="招满的岗位信息的sheet";

		 HSSFSheet sheet = workbook.createSheet(sheetname);
		 
		 //2.2调用poi中的相关API把数据写入到excel中
		 HSSFRow row = sheet.createRow(0);//创建第一行，即表头
		 String [] tableTop={"岗位id","岗位名称", "预招人数", "已招人数","联系电话","公司名称" };
		 //像第一行中添加数据（创建表头）
		 for(int i =0;i<tableTop.length;i++)
		 {
			 row.createCell(i).setCellValue(tableTop[i]);
		 }
		 
		 
		 //从第二行开始向里面写入数据
		 String[] columnName = { "eid","employment_name","recrultsNumb","readyNumb","phone","gsname"};
		 for(int i =0;i<list.size();i++)
		 {
		    HSSFRow row2 = sheet.createRow(i+1);
			
		    Map<String, Object> map = list.get(i);//从list中取出数据 
			for(int k=0;k<columnName.length;k++)//将获取到的每一个map写入到一个新的row2对象中（一个row2对象即是excel表格中的一行）
			{
				sheet.autoSizeColumn(k, true);//设定表格进行自动适配，但是对中文不是特别友好
				if(k==2||k==3){
					row2.createCell(k).setCellValue((int)map.get(columnName[k]));
				}else{
					row2.createCell(k).setCellValue((String)map.get(columnName[k]));
				}
				
			}
		 }
		 ExcelUtils.setColumnAutoAdapter(sheet, list.size()+1);
		 
		 List<Map<String, Object>> list_stu=postfillservice.selectStu();
		 
		 String sheetname_stu="申请岗位的学生的信息sheet";

		 HSSFSheet sheet_stu = workbook.createSheet(sheetname_stu);
		 
		 //2.2调用poi中的相关API把数据写入到excel中
		 HSSFRow row_stu = sheet_stu.createRow(0);//创建第一行，即表头
		 String [] tableTop_stu={"岗位id","姓名", "学号", "联系电话" };
		 //像第一行中添加数据（创建表头）
		 for(int i =0;i<tableTop_stu.length;i++)
		 {
			 row_stu.createCell(i).setCellValue(tableTop_stu[i]);
		 }
		 
		 
		 //从第二行开始向里面写入数据
		 String[] columnName_stu = { "eid","name","sid","phone"};
		 for(int i =0;i<list_stu.size();i++)
		 {
		    HSSFRow row2_stu = sheet_stu.createRow(i+1);
			
		    Map<String, Object> map_stu = list_stu.get(i);//从list中取出数据 
			for(int k=0;k<columnName_stu.length;k++)//将获取到的每一个map写入到一个新的row2对象中（一个row2对象即是excel表格中的一行）
			{
				sheet_stu.autoSizeColumn(k, true);//设定表格进行自动适配，但是对中文不是特别友好
					row2_stu.createCell(k).setCellValue((String)map_stu.get(columnName_stu[k]));
			}
		 }
		 ExcelUtils.setColumnAutoAdapter(sheet_stu, list_stu.size()+1);
		 
		//2.3保存
		 OutputStream outputStream = response.getOutputStream();
		 workbook.write(outputStream);
		 outputStream.close();
	}
	/**
	 * @desc  删除
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		String eid = request.getParameter("eid");
		String page = request.getParameter("page");
		System.out.println(eid);
		postfillservice.deleteValue(eid);
		//3.重定向
		response.sendRedirect(request.getContextPath()+"/waring/fill.do?method=query&page="+1);
	}
	/**
	 * @desc  招满预警查询
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
		List<Map<String, Object>> list_employment = postfillservice.selectemploymentValue(page);
		List<Map<String, Object>> list_account = postfillservice.selectaccountValue();
		int count = postfillservice.selectEmploymentNum();
		System.out.println(count);
		request.setAttribute("list_employment", list_employment);
		request.setAttribute("list_account", list_account);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/managerjsp/postwaring/postfillwarn.jsp").forward(request, response);
	}

}
