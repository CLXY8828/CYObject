package com.rj.bd.managerall.postwaring.postoverwaring;

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
 * @desc   岗位过期预警 M层
 * @author 秋月蓝璃
 *
 */

@SuppressWarnings("serial")
public class PostoverwarnServlet extends  HttpServlet{
	PostoverwarnService postoverservice = new PostoverwarnService();
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
			 System.out.println("1.打印出异常的信息:"+e.getMessage());
			 System.out.println("2.其实异常发送的内存地址："+e.getStackTrace());
		}
	}
/**
 * 	
 * @param request
 * @param response
 * @throws SQLException 
 * @throws ClassNotFoundException 
 * @throws IOException 
 */
	private void export(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		ExcelUtils.settings(response, "岗位过期信息.xls");
		//1.调用M层获取到数据
		 List<Map<String, Object>> list=postoverservice.selectPostOver();
		
		//2.利用poi实现将获取到的数据写入到excel中
		 //2.1初始化poi的核心类
		 HSSFWorkbook workbook=new HSSFWorkbook();
		 String sheetname="岗位过期信息的sheet";

		 HSSFSheet sheet = workbook.createSheet(sheetname);
		 
		 //2.2调用poi中的相关API把数据写入到excel中
		 HSSFRow row = sheet.createRow(0);//创建第一行，即表头
		 String [] tableTop={"岗位id","岗位名称", "招聘时间", "应招人数","已招人数","公司名称" };
		 //像第一行中添加数据（创建表头）
		 for(int i =0;i<tableTop.length;i++)
		 {
			 row.createCell(i).setCellValue(tableTop[i]);
		 }
		 
		 
		 //从第二行开始向里面写入数据
		 String[] columnName = { "eid","employment_name","subtime","recrultsNumb","readyNumb","gsname"};
		 for(int i =0;i<list.size();i++)
		 {
		    HSSFRow row2 = sheet.createRow(i+1);
			
		    Map<String, Object> map = list.get(i);//从list中取出数据 
			for(int k=0;k<columnName.length;k++)//将获取到的每一个map写入到一个新的row2对象中（一个row2对象即是excel表格中的一行）
			{
				sheet.autoSizeColumn(k, true);//设定表格进行自动适配，但是对中文不是特别友好
				if(k==4||k==3){
					row2.createCell(k).setCellValue((int)map.get(columnName[k]));
				}else{
					row2.createCell(k).setCellValue((String)map.get(columnName[k]));
				}
				
			}
		 }
		 ExcelUtils.setColumnAutoAdapter(sheet, list.size()+1);
		 
		 List<Map<String, Object>> list_stu=postoverservice.selectStu();
		 
		 String sheetname_stu="申请过的学生的信息sheet";

		 HSSFSheet sheet_stu = workbook.createSheet(sheetname_stu);
		 
		 //2.2调用poi中的相关API把数据写入到excel中
		 HSSFRow row_stu = sheet_stu.createRow(0);//创建第一行，即表头
		 String [] tableTop_stu={"岗位id","姓名", "学号", "联系电话"};
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
 * @desc  删除过期岗位
 * @param request
 * @param response
 * @throws IOException 
 * @throws SQLException 
 * @throws ClassNotFoundException 
 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		System.out.println("delete");
		String eid = request.getParameter("eid");
		String page = request.getParameter("page");
		System.out.println(eid);
		postoverservice.deleteValue(eid);
		//3.重定向
		response.sendRedirect(request.getContextPath()+"/waring/over.do?method=query&page="+page);
	}
/**
 * @desc  查询岗位信息所需内容
 * @param request
 * @param response
 * @throws IOException 
 * @throws ServletException 
 * @throws SQLException 
 * @throws ClassNotFoundException 
 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		String page1 =request.getParameter("page");
		int page = Integer.parseInt(page1);
		List<Map<String, Object>> list_account = postoverservice.selectaccountValue();
		List<Map<String, Object>> list_time = postoverservice.selectTime(page);
		int count = postoverservice.selectCount();
		request.setAttribute("list_account", list_account);
		request.setAttribute("list_time", list_time);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/managerjsp/postwaring/postoverdue.jsp").forward(request, response);
	}

}
