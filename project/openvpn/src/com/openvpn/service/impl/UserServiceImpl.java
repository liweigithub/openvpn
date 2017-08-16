package com.openvpn.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.openvpn.common.TransactionManage;
import com.openvpn.dao.ipml.LogDao;
import com.openvpn.dao.ipml.UserDao;
import com.openvpn.entity.User;

public class UserServiceImpl {
	private UserDao userDao = new UserDao();
	private LogDao logDao = new LogDao();

	public Map<String, Object> userInfo(User user) throws Exception {
		User user2 = userDao.findByExample(user);
		BigDecimal findUserReceived = logDao.findUserReceived(user2);
		BigDecimal findUserSend = logDao.findUserSend(user2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user2);
		map.put("user_received", findUserReceived);
		map.put("user_send", findUserSend);
		return map;
	}

	public User login(User user) throws Exception {
		User findByExample = userDao.findByExample(user);
		return findByExample;
	}

	/**
	 * 查询用户信息
	 * @return
	 * @throws Exception
	 */
	public List<UserInfo> findUserInfo(String username) throws Exception {
		List<User> list =null;
		if (username==null||username.equals("")) {
			list = userDao.findAll();
		}else{
			list = userDao.findByUsername(username);
		}
		List<UserInfo> listInfo = new ArrayList<UserInfo>();
		for (User user : list) {
			UserInfo userInfo = new UserInfo();
			userInfo.setUser(user);//用户的信息
			BigDecimal findUserReceived = logDao.findUserReceived(user);//实际从手机流量扣除
			BigDecimal findUserSend = logDao.findUserSend(user);//用户使用的免流流量
			userInfo.setBytesReceived(findUserReceived);
			userInfo.setBytesSent(findUserSend);
			listInfo.add(userInfo);
		}
		return listInfo;
	}
}
