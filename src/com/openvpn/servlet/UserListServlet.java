package com.openvpn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.openvpn.service.impl.UserInfo;
import com.openvpn.service.impl.UserServiceImpl;

public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserServiceImpl userServiceImpl = new UserServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<UserInfo> listUserInfo;
		try {
			String username  = request.getParameter("username");
			System.out.println(username);
			listUserInfo = userServiceImpl.findUserInfo(username);
			request.setAttribute("userListInfo", listUserInfo);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
