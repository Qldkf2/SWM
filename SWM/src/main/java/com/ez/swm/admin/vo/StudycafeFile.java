package com.ez.swm.admin.vo;

public class StudycafeFile {
	private int idx;
	private int studycafe_no;
	private String original_file_name;
	private String stored_file_name;
	private int file_size;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getStudycafe_no() {
		return studycafe_no;
	}
	public void setStudycafe_no(int studycafe_no) {
		this.studycafe_no = studycafe_no;
	}
	public String getOriginal_file_name() {
		return original_file_name;
	}
	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	
	@Override
	public String toString() {
		return "StudycafeFile [idx=" + idx + ", studycafe_no=" + studycafe_no + ", original_file_name="
				+ original_file_name + ", stored_file_name=" + stored_file_name + ", file_size=" + file_size + "]";
	}
	
	
	
}
