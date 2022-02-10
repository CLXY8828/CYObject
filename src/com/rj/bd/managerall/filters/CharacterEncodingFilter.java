package com.rj.bd.managerall.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CharacterEncodingFilter  implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//1.通过墙砖获取request对象和response对象
		 HttpServletRequest request=(HttpServletRequest) req;
	     HttpServletResponse response=(HttpServletResponse) res;
	     //2.设置编码字符集
		  request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");
		 //3.过滤器放行
		  chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
