package com.openvpn.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.openvpn.common.TransactionManage;
import com.openvpn.dao.ipml.UserDao;
import com.openvpn.entity.User;

public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String status = request.getParameter("con_status");
		String url_token = request.getParameter("url_token");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (status.equals("repwd")) {
			try {
				userDao.resetPassword(username, password);
				response.sendRedirect("user_list.html");
				return;
			} catch (Exception e) {
				response.sendRedirect(url_token);
				e.printStackTrace();
				return;
			}
		}
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String note = request.getParameter("note");

		if (status.equals("test")) {
			User u = new User();
			u.setUsername(username);
			u.setPassword(password);
			u.setName(name);
			u.setEmail(email);
			try {
				userDao.registerUser(u);
				request.setAttribute("message", "注册成功");
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
				return;
			} catch (Exception e) {
				request.setAttribute("message", "注册失败");
				request.getRequestDispatcher("register.jsp").forward(request,
						response);
				e.printStackTrace();
				return;
			}
		}

		Long quota_bytes = Long.parseLong(request.getParameter("quota"));
		Integer enabled = Integer.parseInt(request.getParameter("enabled"));
		User user = new User(username, password, enabled, name, email, note,
				quota_bytes);

		// 添加用户
		if (status.equals("add")) {
			try {
				userDao.save(user);
				response.sendRedirect("user_list.html");
			} catch (SQLException e) {
				request.setAttribute("message", "添加失败");
				request.getRequestDispatcher("add_user.jsp").forward(request,
						response);
				e.printStackTrace();
			}

		} else if (status.equals("update")) {
			// 更新用户
			try {
				userDao.update(user);
				response.sendRedirect("user_list.html");
			} catch (Exception e) {
				response.sendRedirect(url_token);
				e.printStackTrace();
			}
		}
	}
}
