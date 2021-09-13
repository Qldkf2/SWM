package com.ez.swm.book.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.swm.book.dao.BookDao;
import com.ez.swm.book.vo.BookTime;
import com.ez.swm.book.vo.BookVo;
import com.ez.swm.book.vo.PayInfo;
import com.ez.swm.book.vo.UserBookVo;


@Service
public class BookService {
	
	@Autowired
	BookDao bookDao;
	
	
	
	
	public int studycafeBook(BookVo bookVo) throws Exception {
		
		int result=bookDao.studycafeBook(bookVo);
		

		
		//����ð� ��� �����
		if(result >0) {
			BookTime bookTime=new BookTime();
			bookTime.setStudycafe_no(bookVo.getStudycafe_no());
			bookTime.setStudycafe_room(bookVo.getStudycafe_room());
			bookTime.setBook_date(bookVo.getBook_date());
			
			
			int startTime=Integer.parseInt(bookVo.getStart_time());
			int endTime=Integer.parseInt(bookVo.getEnd_time());
			
			
			String str="";

			
			if(startTime==endTime) {
				if(startTime<10) {
					str += "#0"+startTime;
				}else {
					str += "#"+startTime;
				}
				
			}				
			else{
				for(;startTime<endTime;startTime++) {
					if(startTime<10) {
						str += "#0"+startTime;
					}else {
						str += "#"+startTime;
					}
					
				}
			}
			
			
			bookTime.setBook_time(str);
			
			
			int r=bookDao.confirmBook(bookTime);

			//����� �ð��� ������ ���� �ð��� ������Ʈ
			if(r > 0) {
				bookDao.updateBookTime(bookTime);;
			}
			//����� �ð��� ������ ���� �μ�Ʈ
			else {
				bookDao.insertBookTime(bookTime);
			}
		}
		return result;
	}
	
	public List<UserBookVo> studycafeUser(UserBookVo userBook) throws Exception {
		return bookDao.studycafeUser(userBook);
	}
	
	public PayInfo payInfo(int book_no) {
		return bookDao.payInfo(book_no);
	}
	
}
