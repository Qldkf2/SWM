package com.ez.swm.freeBoard.vo;

public class FreeBoardFile {
	private int free_no;
	private String stored_file_name;
	public int getFree_no() {
		return free_no;
	}
	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	@Override
	public String toString() {
		return "FreeBoardFile [free_no=" + free_no + ", stored_file_name=" + stored_file_name + "]";
	}
	
	

}
