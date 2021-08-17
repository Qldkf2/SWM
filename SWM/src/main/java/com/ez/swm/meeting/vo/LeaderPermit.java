package com.ez.swm.meeting.vo;

public class LeaderPermit {
	private int meeting_no;
	private int userNo;
	
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
	@Override
	public String toString() {
		return "LeaderPermit [meeting_no=" + meeting_no + ", userNo=" + userNo + "]";
	}
	
	
}
