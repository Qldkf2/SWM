package com.ez.swm.meeting.vo;

public class MeetingPermit {
	
	private int meeting_no;
	private int userNo;
	private String aboutMe;
	private char permit;
	
	
	public int getMeeting_no() {
		return meeting_no;
	}
	public void setMeeting_no(int meeting_no) {
		this.meeting_no = meeting_no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getAboutMe() {
		return aboutMe;
	}
	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}
	public char getPermit() {
		return permit;
	}
	public void setPermit(char permit) {
		this.permit = permit;
	}
	@Override
	public String toString() {
		return "MeetingPermit [meeting_no=" + meeting_no + ", userNo=" + userNo + ", aboutMe=" + aboutMe + ", permit="
				+ permit + "]";
	}
	
	
	

}
