package com.ez.swm.book.vo;


public class BookVo {
	
	private int book_no;
	private String studycafe_name;
	private int studycafe_no;
	private int booker_no;
	private int studycafe_roomno;
	private String room_strength;
	private String book_date;
	private String start_time;
	private String end_time;
	
	

	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public String getStudycafe_name() {
		return studycafe_name;
	}
	public void setStudycafe_name(String studycafe_name) {
		this.studycafe_name = studycafe_name;
	}
	public int getStudycafe_no() {
		return studycafe_no;
	}
	public void setStudycafe_no(int studycafe_no) {
		this.studycafe_no = studycafe_no;
	}
	public int getBooker_no() {
		return booker_no;
	}
	public void setBooker_no(int booker_no) {
		this.booker_no = booker_no;
	}
	
	public int getStudycafe_roomno() {
		return studycafe_roomno;
	}
	public void setStudycafe_roomno(int studycafe_roomno) {
		this.studycafe_roomno = studycafe_roomno;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	
	public String getRoom_strength() {
		return room_strength;
	}
	public void setRoom_strength(String room_strength) {
		this.room_strength = room_strength;
	}
	@Override
	public String toString() {
		return "BookVo [book_no=" + book_no + ", studycafe_name=" + studycafe_name + ", studycafe_no=" + studycafe_no
				+ ", booker_no=" + booker_no + ", studycafe_roomno=" + studycafe_roomno + ", room_strength="
				+ room_strength + ", book_date=" + book_date + ", start_time=" + start_time + ", end_time=" + end_time
				+ "]";
	}
	
		

}
