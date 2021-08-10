package com.ez.swm.login.vo;

public class LoginForm {
	
	private String userId;
	private String password;
	private String status;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "LoginForm [userId=" + userId + ", password=" + password + ", status=" + status + "]";
	}
	
	
}
