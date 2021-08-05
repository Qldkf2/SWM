package com.ez.swm.meeting.vo;

public class MeetingWrite {
	
	private int meeting_leader;
	private String meeting_age;
	private String meeting_subject;
	private String meeting_address;
	private int meeting_limit;
	private String meeting_title;
	private String meeting_content;

	
	public int getMeeting_leader() {
		return meeting_leader;
	}
	public void setMeeting_leader(int meeting_leader) {
		this.meeting_leader = meeting_leader;
	}
	
	public String getMeeting_age() {
		return meeting_age;
	}
	public void setMeeting_age(String meeting_age) {
		this.meeting_age = meeting_age;
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
	
	@Override
	public String toString() {
		return "MeetingWrite [meeting_leader=" + meeting_leader + ", meeting_age=" + meeting_age + ", meeting_subject="
				+ meeting_subject + ", meeting_address=" + meeting_address + ", meeting_limit=" + meeting_limit
				+ ", meeting_title=" + meeting_title + ", meeting_content=" + meeting_content + "]";
	}
	
	
	
	
	
	
	
	
}