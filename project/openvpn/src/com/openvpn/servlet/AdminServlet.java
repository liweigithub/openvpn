package com.openvpn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.StringUtils;
import com.openvpn.common.TransactionManage;
import com.openvpn.dao.ipml.AdminDao;
import com.openvpn.entity.Admin;
import com.openvpn.service.impl.UserInfo;
import com.openvpn.service.impl.UserServiceImpl;

public class AdminServlet extends HttpServlet {
	private AdminDao adminDao = new AdminDao();
	private UserServiceImpl userServiceImpl = new UserServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password =request.getParameter("password"); 

		if (username == null || username.equals("") || password == null
				|| password.equals("")) {
			request.setAttribute("message", "登陆错误!");
			request.getRequestDispatcher("login.jsp")
					.forward(request, response);
			return;
		}
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(MD5Utils.md5(password));

		try {
			Admin example = adminDao.findByExample(admin);
			if (example != null) {
				HttpSession session = request.getSession();
				session.setAttribute("admin", example);
				response.sendRedirect("user_list.html");
			} else {
				request.setAttribute("message", "用户名或者密码错误");
				request.getRequestDispatcher("login.jsp").forward(request,
						response);
			}
		} catch (Exception e1) {
			request.setAttribute("message", "登陆错误!");
			request.getRequestDispatcher("login.jsp")
					.forward(request, response);
			e1.printStackTrace();
		}
	}
	
}
