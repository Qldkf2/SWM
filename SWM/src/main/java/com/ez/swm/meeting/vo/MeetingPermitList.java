package com.ez.swm.meeting.vo;

public class MeetingPermitList {
	private int meeting_no;
	private int userNo;
	private String nickName;
	private String aboutMe;
	
	
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAboutMe() {
		return aboutMe;
	}
	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}
	
	@Override
	public String toString() {
		return "MeetingPerMitList [meeting_no=" + meeting_no + ", userNo=" + userNo + ", nickName=" + nickName
				+ ", aboutMe=" + aboutMe + "]";
	}
	
	
	

}
