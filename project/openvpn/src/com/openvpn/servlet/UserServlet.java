package com.openvpn.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.openvpn.common.TransactionManage;
import com.openvpn.entity.User;
import com.openvpn.service.impl.UserServiceImpl;
/**
 * 
 * @author liwei
 * 用户登录 并查询个人账户信息
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserServiceImpl userServiceImpl = new UserServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		try {
			User login = userServiceImpl.login(user);
			if (login != null) {
				Map<String, Object> info = userServiceImpl.userInfo(user);
				System.out.println(info);
				request.setAttribute("userInfo", info);
				request.getRequestDispatcher("/WEB-INF/page/info.jsp").forward(request,
						response);
			} else {
				request.setAttribute("error", "用户名或者密码错误");
				request.getRequestDispatcher("/index.jsp").forward(request,
						response);
			}
		} catch (Exception e1) {
			request.setAttribute("error", "登陆错误!");
			request.getRequestDispatcher("/index.jsp").forward(request,
					response);
			e1.printStackTrace();
		}
	}
}
