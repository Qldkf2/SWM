package com.ez.swm.book.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.book.vo.BookVo;
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
	
}
