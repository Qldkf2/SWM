package com.ez.swm.studycafe.vo;

public class Studycafe {
	private int studycafe_no;
	private String studycafe_name;
	private String studycafe_address;
	private String studycafe_phone;
	private String studycafe_open;
	private String studycafe_end;
	private String studycafe_content;
	
	public int getStudycafe_no() {
		return studycafe_no;
	}
	public void setStudycafe_no(int studycafe_no) {
		this.studycafe_no = studycafe_no;
	}
	public String getStudycafe_name() {
		return studycafe_name;
	}
	public void setStudycafe_name(String studycafe_name) {
		this.studycafe_name = studycafe_name;
	}
	public String getStudycafe_address() {
		return studycafe_address;
	}
	public void setStudycafe_address(String studycafe_address) {
		this.studycafe_address = studycafe_address;
	}
	public String getStudycafe_phone() {
		return studycafe_phone;
	}
	public void setStudycafe_phone(String studycafe_phone) {
		this.studycafe_phone = studycafe_phone;
	}
	public String getStudycafe_open() {
		return studycafe_open;
	}
	public void setStudycafe_open(String studycafe_open) {
		this.studycafe_open = studycafe_open;
	}
	public String getStudycafe_end() {
		return studycafe_end;
	}
	public void setStudycafe_end(String studycafe_end) {
		this.studycafe_end = studycafe_end;
	}
	public String getStudycafe_content() {
		return studycafe_content;
	}
	public void setStudycafe_content(String studycafe_content) {
		this.studycafe_content = studycafe_content;
	}
	
	@Override
	public String toString() {
		return "Studycafe [studycafe_no=" + studycafe_no + ", studycafe_name=" + studycafe_name + ", studycafe_address="
				+ studycafe_address + ", studycafe_phone=" + studycafe_phone + ", studycafe_open=" + studycafe_open
				+ ", studycafe_end=" + studycafe_end + ", studycafe_content=" + studycafe_content + "]";
	}
	
	
	

}
