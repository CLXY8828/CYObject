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

public class CharacterEncodingFilter implements Filter{

	@Override
	public void destroy() {
		System.out.println("编码过滤器销毁");
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)servletRequest;
		HttpServletResponse response=(HttpServletResponse) servletResponse;
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("初始化编码过滤器");
	}

}
