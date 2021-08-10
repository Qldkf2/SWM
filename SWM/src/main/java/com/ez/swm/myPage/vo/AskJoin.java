package com.ez.swm.myPage.vo;

import java.sql.Date;

public class AskJoin {

	private int ask_no;
	private String ask_title;
	private String ask_content;
	private Date ask_date;
	private int userNo;
	private String nickName;
	
	public int getAsk_no() {
		return ask_no;
	}
	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}
	public String getAsk_title() {
		return ask_title;
	}
	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}
	public String getAsk_content() {
		return ask_content;
	}
	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
	public Date getAsk_date() {
		return ask_date;
	}
	public void setAsk_date(Date ask_date) {
		this.ask_date = ask_date;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	@Override
	public String toString() {
		return "AskJoin [ask_no=" + ask_no + ", ask_title=" + ask_title + ", ask_content=" + ask_content + ", ask_date="
				+ ask_date + ", userNo=" + userNo + ", nickName=" + nickName + "]";
	}
	
	
	
}
