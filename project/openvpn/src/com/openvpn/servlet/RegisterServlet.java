package com.openvpn.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.openvpn.dao.ipml.UserDao;
import com.openvpn.entity.User;

public class RegisterServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("11111");

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(111);
		// request.setCharacterEncoding("UTF-8");
		// String username = request.getParameter("username");
		// String password = request.getParameter("password");
		// String name = request.getParameter("name");
		// String email = request.getParameter("email");
		// User user = new User(username, password, null, name, email, null,
		// null);
		// try {
		// userDao.registerUser(user);
		// request.setAttribute("message", "注册成功");
		// request.getRequestDispatcher("index.jsp")
		// .forward(request, response);
		// } catch (Exception e) {
		// request.setAttribute("message", "注册失败");
		// request.getRequestDispatcher("register.jsp").forward(request,
		// response);
		// e.printStackTrace();
		// }
	}

}
