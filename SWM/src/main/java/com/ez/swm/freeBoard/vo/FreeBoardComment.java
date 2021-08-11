package com.ez.swm.freeBoard.vo;


import org.springframework.stereotype.Controller;

@Controller
public class FreeBoardComment {

	private int free_comment_no;
	private int free_no;
	private String userNo;
	private String free_comment_content;
	private String free_comment_date;
	private int free_comment_level;
	private int free_comment_refno;
	private String status;
	
	public int getFree_comment_no() {
		return free_comment_no;
	}
	public void setFree_comment_no(int free_comment_no) {
		this.free_comment_no = free_comment_no;
	}
	public int getFree_no() {
		return free_no;
	}
	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getFree_comment_content() {
		return free_comment_content;
	}
	public void setFree_comment_content(String free_comment_content) {
		this.free_comment_content = free_comment_content;
	}
	public String getFree_comment_date() {
		return free_comment_date;
	}
	public void setFree_comment_date(String free_comment_date) {
		this.free_comment_date = free_comment_date;
	}
	public int getFree_comment_level() {
		return free_comment_level;
	}
	public void setFree_comment_level(int free_comment_level) {
		this.free_comment_level = free_comment_level;
	}
	public int getFree_comment_refno() {
		return free_comment_refno;
	}
	public void setFree_comment_refno(int free_comment_refno) {
		this.free_comment_refno = free_comment_refno;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "FreeBoardComment [free_comment_no=" + free_comment_no + ", free_no=" + free_no + ", userNo=" + userNo
				+ ", free_comment_content=" + free_comment_content + ", free_comment_date=" + free_comment_date
				+ ", free_comment_level=" + free_comment_level + ", free_comment_refno=" + free_comment_refno
				+ ", status=" + status + "]";
	}
	
	
}
