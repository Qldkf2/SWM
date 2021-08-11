package com.ez.swm.freeBoard.vo;


import org.springframework.stereotype.Controller;

@Controller
public class FreeBoard {

	private int free_no;
	private int userNo;
	private String free_title;
	private String free_content;
	private String free_date;
	private int free_hit;
	private String status;
	
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "FreeBoard [free_no=" + free_no + ", userNo=" + userNo + ", free_title=" + free_title + ", free_content="
				+ free_content + ", free_date=" + free_date + ", free_hit=" + free_hit + ", status=" + status + "]";
	}
	
	

}
