package com.ez.swm.meeting.vo;

import java.sql.Date;

public class MeetingBoardComment {
	
	private String nickname;
	private int meeting_board_comment_no;
	private int meeting_board_no;
	private int userno;
	private String meeting_board_comment_content;
	private Date meeting_board_comment_date;
	private int meeting_board_comment_level;
	private int meeting_board_comment_refno;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getMeeting_board_comment_no() {
		return meeting_board_comment_no;
	}
	public void setMeeting_board_comment_no(int meeting_board_comment_no) {
		this.meeting_board_comment_no = meeting_board_comment_no;
	}
	public int getMeeting_board_no() {
		return meeting_board_no;
	}
	public void setMeeting_board_no(int meeting_board_no) {
		this.meeting_board_no = meeting_board_no;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getMeeting_board_comment_content() {
		return meeting_board_comment_content;
	}
	public void setMeeting_board_comment_content(String meeting_board_comment_content) {
		this.meeting_board_comment_content = meeting_board_comment_content;
	}
	public Date getMeeting_board_comment_date() {
		return meeting_board_comment_date;
	}
	public void setMeeting_board_comment_date(Date meeting_board_comment_date) {
		this.meeting_board_comment_date = meeting_board_comment_date;
	}
	public int getMeeting_board_comment_level() {
		return meeting_board_comment_level;
	}
	public void setMeeting_board_comment_level(int meeting_board_comment_level) {
		this.meeting_board_comment_level = meeting_board_comment_level;
	}
	public int getMeeting_board_comment_refno() {
		return meeting_board_comment_refno;
	}
	public void setMeeting_board_comment_refno(int meeting_board_comment_refno) {
		this.meeting_board_comment_refno = meeting_board_comment_refno;
	}
	
	
	
	
}
