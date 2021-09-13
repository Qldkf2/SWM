package com.ez.swm.book.vo;


public class BookVo {
	
	private int book_no;
	private String studycafe_name;
	private int studycafe_no;
	private int booker_no;
	private String studycafe_room;
		private int permit_limit;
	private String book_date;
	private String start_time;
	private String end_time;
	private int pay;
	
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getStudycafe_room() {
		return studycafe_room;
	}
	public void setStudycafe_room(String studycafe_roomno) {
		this.studycafe_room = studycafe_roomno;
	}
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

	public int getPermit_limit() {
		return permit_limit;
	}
	public void setPermit_limit(int permit_limit) {
		this.permit_limit = permit_limit;
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
	@Override
	public String toString() {
		return "BookVo [book_no=" + book_no + ", studycafe_name=" + studycafe_name + ", studycafe_no=" + studycafe_no
				+ ", booker_no=" + booker_no + ", studycafe_room=" + studycafe_room + ", permit_limit=" + permit_limit
				+ ", book_date=" + book_date + ", start_time=" + start_time + ", end_time=" + end_time + "]";
	}
	
	
	
	
	
		

}
