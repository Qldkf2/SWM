package com.ez.swm.meeting.vo;

import java.sql.Date;

public class MeetingBoardModify {
	
	private int meeting_board_no;
	private int meeting_no;
	private int meeting_board_writer;
	private String meeting_board_title;
	private String meeting_board_content;
	private Date meeting_board_date;
	private int meeting_board_hit;
	
	public int getMeeting_board_no() {
		return meeting_board_no;
	}
	public void setMeeting_board_no(int meeting_board_no) {
		this.meeting_board_no = meeting_board_no;
	}
	public int getMeeting_no() {
		return meeting_no;
	}
	public void setMeeting_no(int meeting_no) {
		this.meeting_no = meeting_no;
	}
	public int getMeeting_board_writer() {
		return meeting_board_writer;
	}
	public void setMeeting_board_writer(int meeting_board_writer) {
		this.meeting_board_writer = meeting_board_writer;
	}
	public String getMeeting_board_title() {
		return meeting_board_title;
	}
	public void setMeeting_board_title(String meeting_board_title) {
		this.meeting_board_title = meeting_board_title;
	}
	public String getMeeting_board_content() {
		return meeting_board_content;
	}
	public void setMeeting_board_content(String meeting_board_content) {
		this.meeting_board_content = meeting_board_content;
	}
	public Date getMeeting_board_date() {
		return meeting_board_date;
	}
	public void setMeeting_board_date(Date meeting_board_date) {
		this.meeting_board_date = meeting_board_date;
	}
	public int getMeeting_board_hit() {
		return meeting_board_hit;
	}
	public void setMeeting_board_hit(int meeting_board_hit) {
		this.meeting_board_hit = meeting_board_hit;
	}
	
	@Override
	public String toString() {
		return "MeetingBoardUpdate [meeting_board_no=" + meeting_board_no + ", meeting_no=" + meeting_no
				+ ", meeting_board_writer=" + meeting_board_writer + ", meeting_board_title=" + meeting_board_title
				+ ", meeting_board_content=" + meeting_board_content + ", meeting_board_date=" + meeting_board_date
				+ ", meeting_board_hit=" + meeting_board_hit + "]";
	}
	
	

}
