package com.openvpn.service.impl;

import java.math.BigDecimal;

import com.openvpn.entity.Log;
import com.openvpn.entity.User;

public class UserInfo {
	private User user;
	BigDecimal bytesReceived;
	BigDecimal bytesSent;
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public BigDecimal getBytesReceived() {
		return bytesReceived;
	}
	public void setBytesReceived(BigDecimal bytesReceived) {
		this.bytesReceived = bytesReceived;
	}
	public BigDecimal getBytesSent() {
		return bytesSent;
	}
	public void setBytesSent(BigDecimal bytesSent) {
		this.bytesSent = bytesSent;
	}
	
	
}
