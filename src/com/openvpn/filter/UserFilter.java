package com.openvpn.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		String url = request.getRequestURI();
		if (url.endsWith("login.jsp")||url.endsWith("admin.html")) {
			chain.doFilter(req, resp);
		}else{
			if (request.getSession().getAttribute("admin") == null) {
				request.getSession().setAttribute("url", url);
				request.setAttribute("message", "请登录");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}else{
				chain.doFilter(req, resp);
			}
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}
}
