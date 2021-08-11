package com.ez.swm.freeBoard.vo;

public class FreeBoardList {
	private int free_no;
	private int userNo;
	private int nickName;
	private String free_title;
	private String free_date;
	private int free_hit;
	
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
	public int getNickName() {
		return nickName;
	}
	public void setNickName(int nickName) {
		this.nickName = nickName;
	}
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getFree_date() {
		return free_date;
	}
	public void setFree_date(String free_date) {
		this.free_date = free_date;
	}
	public int getFree_hit() {
		return free_hit;
	}
	public void setFree_hit(int free_hit) {
		this.free_hit = free_hit;
	}
	@Override
	public String toString() {
		return "FreeBoardList [free_no=" + free_no + ", userNo=" + userNo + ", nickName=" + nickName + ", free_title="
				+ free_title + ", free_date=" + free_date + ", free_hit=" + free_hit + "]";
	}
	
	
}
