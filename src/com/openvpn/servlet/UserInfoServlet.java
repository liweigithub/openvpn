package com.openvpn.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.openvpn.common.TransactionManage;
import com.openvpn.dao.ipml.UserDao;
import com.openvpn.entity.User;

public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		try {
			User user = userDao.findByName(username);
			request.setAttribute("user", user);
			request.getRequestDispatcher("user_info.jsp").forward(request,
					response);
		} catch (Exception e) {
			response.sendRedirect("user_list.html");
			e.printStackTrace();
		}
	}
}
