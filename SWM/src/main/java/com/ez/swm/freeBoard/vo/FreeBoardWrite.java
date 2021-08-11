package com.ez.swm.freeBoard.vo;

public class FreeBoardWrite {
	private int free_no;
	private int userNo;
	private String free_title;
	private String free_content;
	
	
	public int getFree_no() {
		return free_no;
	}
	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getFree_content() {
		return free_content;
	}
	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}
	@Override
	public String toString() {
		return "FreeBoardWrite [free_no=" + free_no + ", userNo=" + userNo + ", free_title=" + free_title
				+ ", free_content=" + free_content + "]";
	}
	
	

}
