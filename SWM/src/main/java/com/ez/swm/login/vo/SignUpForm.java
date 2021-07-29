package com.ez.swm.login.vo;

public class SignUpForm {
	
	private String userId;
	private String password;
	private String re_password;
	private String userName;
	private String nickname;
	private String jumin1;
	private String jumin2;
	private String phone1;
	private String phone2;
	private String phone3;
	

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
	public String getRe_password() {
		return re_password;
	}
	public void setRe_password(String re_password) {
		this.re_password = re_password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getJumin1() {
		return jumin1;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	public String getJumin2() {
		return jumin2;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	
	
	@Override
	public String toString() {
		return "JoinForm [userId=" + userId + ", password=" + password + ", re_password=" + re_password + ", userName="
				+ userName + ", nickname=" + nickname + ", jumin1=" + jumin1 + ", jumin2=" + jumin2 + ", phone1="
				+ phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + "]";
	}
	
	
	
	
	
	
}
