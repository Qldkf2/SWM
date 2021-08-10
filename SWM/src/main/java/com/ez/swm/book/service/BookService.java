package com.ez.swm.book.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.swm.book.dao.BookDao;
import com.ez.swm.book.vo.BookVo;
import com.ez.swm.book.vo.UserBookVo;


@Service
public class BookService {
	
	@Autowired
	BookDao bookDao;
	
	public int studycafeBook(BookVo bookVo) throws Exception {
		
		return bookDao.studycafeBook(bookVo);
	}
	
	public List<UserBookVo> studycafeUser(UserBookVo userBook) throws Exception {
		return bookDao.studycafeUser(userBook);
	}
	
}
