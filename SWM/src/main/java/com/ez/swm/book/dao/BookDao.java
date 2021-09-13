package com.ez.swm.book.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.book.vo.BookTime;
import com.ez.swm.book.vo.BookVo;
import com.ez.swm.book.vo.PayInfo;
import com.ez.swm.book.vo.UserBookVo;


@Repository
public class BookDao {

	@Autowired
	private SqlSessionTemplate sqlSession; 
	
   //mapper와 이름으로 연결
	public int studycafeBook(BookVo bookVo) {
	
		
		return sqlSession.insert("book.studycafeBook",bookVo);
	}
	
	public List<UserBookVo> studycafeUser(UserBookVo userBookVo) {
		
		return sqlSession.selectList("book.getStudycafeBookList", userBookVo);
		
	}
	
	
	
	
	public int confirmBook(BookTime bookTime) {
		
		return sqlSession.selectOne("book.confirmBook",bookTime);
	}
	

	
	public void insertBookTime(BookTime bookTime) {
		sqlSession.insert("book.insertBookTime", bookTime);
	}
	
	public void updateBookTime(BookTime bookTime) {
		sqlSession.update("book.updateBookTime", bookTime);
	}
	
	//결제시 정보 가져오기
	public PayInfo payInfo(int book_no) {
		return sqlSession.selectOne("book.payInfo", book_no);
		
	}
	
}
