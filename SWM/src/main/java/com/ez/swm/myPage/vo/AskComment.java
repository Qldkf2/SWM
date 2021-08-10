package com.ez.swm.myPage.vo;

import java.sql.Date;

public class AskComment {
	
	private int ask_comment_no;
	private int ask_no;
	private String ask_comment_content;
	private Date ask_comment_date;
	
	public int getAsk_comment_no() {
		return ask_comment_no;
	}
	public void setAsk_comment_no(int ask_comment_no) {
		this.ask_comment_no = ask_comment_no;
	}
	public int getAsk_no() {
		return ask_no;
	}
	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}
	public String getAsk_comment_content() {
		return ask_comment_content;
	}
	public void setAsk_comment_content(String ask_comment_content) {
		this.ask_comment_content = ask_comment_content;
	}
	public Date getAsk_comment_date() {
		return ask_comment_date;
	}
	public void setAsk_comment_date(Date ask_comment_date) {
		this.ask_comment_date = ask_comment_date;
	}
	@Override
	public String toString() {
		return "AskComment [ask_comment_no=" + ask_comment_no + ", ask_no=" + ask_no + ", ask_comment_content="
				+ ask_comment_content + ", ask_comment_date=" + ask_comment_date + "]";
	}
	

}
