package com.ez.swm.meeting.vo;

public class MeetingBoardFile {
	private int idx;
	private int meeting_board_no;
	private String original_file_name;
	private String stored_file_name;
	private int file_size;
	private String del_gb;
	
	public int getIdx() {
		return idx;
	}

	public int getMeeting_board_no() {
		return meeting_board_no;
	}
	public void setMeeting_board_no(int meeting_board_no) {
		this.meeting_board_no = meeting_board_no;
	}

	public String getOriginal_file_name() {
		return original_file_name;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public String getDel_gb() {
		return del_gb;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}

	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public void setDel_gb(String del_gb) {
		this.del_gb = del_gb;
	}

	@Override
	public String toString() {
		return "MeetingBoardFile [idx=" + idx + ", meeting_board_no=" + meeting_board_no + ", original_file_name="
				+ original_file_name + ", stored_file_name=" + stored_file_name + ", file_size=" + file_size
				+ ", del_gb=" + del_gb + "]";
	}
	
	
	
	

}
