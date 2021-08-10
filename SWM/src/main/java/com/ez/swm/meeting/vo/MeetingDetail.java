package com.ez.swm.meeting.vo;

import java.sql.Date;

public class MeetingDetail {

	private String nickname;
	private int meeting_leader;
	private String meeting_title;
	private String meeting_content;
	private String meeting_address;
	private String meeting_subject;
	private int meeting_limit;
	private int meeting_no;
	private String meeting_age;
	private Date meeting_date;
	private int meeting_hit;
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getMeeting_leader() {
		return meeting_leader;
	}
	public void setMeeting_leader(int meeting_leader) {
		this.meeting_leader = meeting_leader;
	}
	public String getMeeting_title() {
		return meeting_title;
	}
	public void setMeeting_title(String meeting_title) {
		this.meeting_title = meeting_title;
	}
	public String getMeeting_content() {
		return meeting_content;
	}
	public void setMeeting_content(String meeting_content) {
		this.meeting_content = meeting_content;
	}
	public String getMeeting_address() {
		return meeting_address;
	}
	public void setMeeting_address(String meeting_address) {
		this.meeting_address = meeting_address;
	}
	public String getMeeting_subject() {
		return meeting_subject;
	}
	public void setMeeting_subject(String meeting_subject) {
		this.meeting_subject = meeting_subject;
	}
	public int getMeeting_limit() {
		return meeting_limit;
	}
	public void setMeeting_limit(int meeting_limit) {
		this.meeting_limit = meeting_limit;
	}
	public int getMeeting_no() {
		return meeting_no;
	}
	public void setMeeting_no(int meeting_no) {
		this.meeting_no = meeting_no;
	}
	public String getMeeting_age() {
		return meeting_age;
	}
	public void setMeeting_age(String meeting_age) {
		this.meeting_age = meeting_age;
	}
	public Date getMeeting_date() {
		return meeting_date;
	}
	public void setMeeting_date(Date meeting_date) {
		this.meeting_date = meeting_date;
	}
	public int getMeeting_hit() {
		return meeting_hit;
	}
	public void setMeeting_hit(int meeting_hit) {
		this.meeting_hit = meeting_hit;
	}
	@Override
	public String toString() {
		return "MeetingDetail [nickname=" + nickname + ", meeting_leader=" + meeting_leader + ", meeting_title="
				+ meeting_title + ", meeting_content=" + meeting_content + ", meeting_address=" + meeting_address
				+ ", meeting_subject=" + meeting_subject + ", meeting_limit=" + meeting_limit + ", meeting_no="
				+ meeting_no + ", meeting_age=" + meeting_age + ", meeting_date=" + meeting_date + ", meeting_hit="
				+ meeting_hit + "]";
	}
	
	
	
}
