package com.ez.swm.studycafe.vo;

public class StudycafeDetailFile {
	
	private int studycafe_no;
	private String stored_file_name;
	private String room_name;
	

	
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getStudycafe_no() {
		return studycafe_no;
	}
	public void setStudycafe_no(int studycafe_no) {
		this.studycafe_no = studycafe_no;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	
	@Override
	public String toString() {
		return "StudycafeDetailFile [studycafe_no=" + studycafe_no + ", stored_file_name=" + stored_file_name + "]";
	}
	
	
}


