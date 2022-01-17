package com.rj.bd.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.tools.jar.resources.jar;

public class Sessionfiters implements Filter {

	@Override
	public void destroy() {
		System.out.println("登录过滤器销毁");
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)servletRequest;
		HttpServletResponse response = (HttpServletResponse)servletResponse;
		String path = request.getServletPath();
		System.out.println(path);
		if (("/user/logein.do".equals(path))||("/logein/login.jsp".equals(path))){
			//特权页，放行
			System.out.println("特权页");
			chain.doFilter(request, response);
			return;
		}
		HttpSession session = request.getSession();
		if ((session.getAttribute("user"))==null) {
			 System.out.println("session为null,则用户没有登录,拒绝访问");
			request.setAttribute("err", "发生登录异常");
			request.setAttribute("errindex", 0);
			request.getRequestDispatcher("/logein/login.jsp").forward(request, response);
			return;
		}
		else {
			//放行
			System.out.println(111);
			chain.doFilter(request, response);
		}
		
		
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		System.out.println("登录过滤器初始化");
	}

}
