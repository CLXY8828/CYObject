package com.rj.bd.resume;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

@SuppressWarnings("serial")
public class ResumeServlet extends HttpServlet {
	ResumeService service = new ResumeService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String q = request.getParameter("method");
		try {
			if ("up".equals(q)) {
				up(request,response);
			}
			else if ("page".equals(q)) {
				page(request,response);
			}
		} catch (FileUploadException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	private void page(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/resume/resumeUP.jsp").forward(request, response);
	}
	
	private void up(HttpServletRequest request, HttpServletResponse response) throws FileUploadException, IOException, ClassNotFoundException, SQLException {
		//0.设定类型和编码
		  response.setContentType("text/html;charset=utf-8");
		  String fileSaveName=null; //最终保存的文件的名字
		//1.保存在服务器硬盘的路径
		  String path="D:/tools/";
		  System.out.println("--->"+path);
		  
		//2.创建服务器硬盘保存的路径
		 File file=new File(path);
		 if(!file.exists())
		 {
			 file.mkdir();
		 }
		
		 //3.利用commons-fileupload.jar实现上传
		 //初始化其核心类
		 DiskFileItemFactory factory=new DiskFileItemFactory();
		 
		 //4.加载解析器
		 ServletFileUpload upload=new ServletFileUpload(factory);
		 
		 //5.设置解析器的相关参数
		 upload.setHeaderEncoding("utf-8");
		 //upload.setSizeMax(1024*1024);
		
		 //6.解析request对象
		 List<FileItem> formFileItemList = upload.parseRequest(request);
		 //7.上传
		 if (formFileItemList.size()>0 && formFileItemList!=null) 
		 {
		   for (FileItem everyFileItem : formFileItemList) 
		   {
			  if (!everyFileItem.isFormField()) 
			  {
				String fileName = everyFileItem.getName();
				System.out.println("当前上传的文件的名字:"+fileName);  
				String prefix = fileName.substring(fileName.lastIndexOf(".")+1);
				System.out.println("本次上传的文件的后缀为:"+prefix);
				fileSaveName=UUID.randomUUID().toString()+"."+prefix;
				
				//上传
				FileUtils.copyInputStreamToFile(everyFileItem.getInputStream(), new File(path+"/"+fileSaveName));
				
			 }
		  }	
	   	}
		 
		//8.保存添加页面的数据
		 String virtualPath=fileSaveName;
		 Map user = (Map)request.getSession().getAttribute("user");
		 service.uppdf(virtualPath,(String)user.get("UUID"));
		 response.sendRedirect(request.getContextPath()+"/users/index.do?method=query");
	}

	
	
}
