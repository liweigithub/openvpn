package com.openvpn.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class User implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String username;
	private String password;
	private Integer active;
	private Date creation;
	private String name;
	private String email;
	private String note;
	private Integer level;
	private Integer quota_cycle;
	private Long quota_bytes;//总共的流量
	private Integer enabled;

	public User() {

	}

	public User(String username, String password, Integer enabled, String name,
			String email, String note, Long quota_bytes) {

		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.name = name;
		this.email = email;
		this.note = note;
		this.quota_bytes = quota_bytes;
		this.enabled = enabled;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getActive() {
		return this.active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	public Date getCreation() {
		return creation;
	}

	public void setCreation(Date creation) {
		this.creation = creation;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getQuota_cycle() {
		return quota_cycle;
	}

	public void setQuota_cycle(Integer quota_cycle) {
		this.quota_cycle = quota_cycle;
	}

	public Long getQuota_bytes() {
		return quota_bytes;
	}

	public void setQuota_bytes(Long quota_bytes) {
		this.quota_bytes = quota_bytes;
	}
	public String getCreateDate(){
		SimpleDateFormat sf = new SimpleDateFormat("yyyy年MM月dd日");
		return sf.format(creation);
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", active=" + active + ", creation=" + creation
				+ ", name=" + name + ", email=" + email + ", note=" + note
				+ ", level=" + level + ", quota_cycle=" + quota_cycle
				+ ", quota_bytes=" + quota_bytes + ", enabled=" + enabled + "]";
	}
	
}