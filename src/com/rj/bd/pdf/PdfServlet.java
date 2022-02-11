package com.rj.bd.pdf;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

@SuppressWarnings("serial")
public class PdfServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String manager_imgpath=request.getParameter("method");
		String path="D:/tools/";
		File file=new File(path+manager_imgpath);
		System.out.println(manager_imgpath);
		FileInputStream fileInputStream=new FileInputStream(file);
		response.setHeader("Access-Control-Allow-Origin", "*");//设置该图片允许跨域访问
		IOUtils.copy(fileInputStream, response.getOutputStream());
	}

	
	
}
