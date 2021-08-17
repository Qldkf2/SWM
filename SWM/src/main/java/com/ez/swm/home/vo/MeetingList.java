package com.ez.swm.home.vo;

public class MeetingList {
	
	private String nickname;
	private int meeting_no;
	private String meeting_title;
	private int meeting_hit;
	public String getNickname() {
		return nickname;
	}
	public int getMeeting_no() {
		return meeting_no;
	}
	public String getMeeting_title() {
		return meeting_title;
	}
	public int getMeeting_hit() {
		return meeting_hit;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setMeeting_no(int meeting_no) {
		this.meeting_no = meeting_no;
	}
	public void setMeeting_title(String meeting_title) {
		this.meeting_title = meeting_title;
	}
	public void setMeeting_hit(int meeting_hit) {
		this.meeting_hit = meeting_hit;
	}
	
	

}
