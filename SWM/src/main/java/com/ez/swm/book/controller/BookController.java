package com.ez.swm.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.book.service.BookService;
import com.ez.swm.book.vo.BookVo;
import com.ez.swm.book.vo.UserBookVo;

@Controller
public class BookController {
	
	@Autowired
	private BookService bookService; 
	
	
	//데이터 넣기		
	
	
		@RequestMapping(value="/book/studycafeBook", method=RequestMethod.POST) 
		public String book(BookVo bookVo ,Model model) throws Exception{
			
			int result = bookService.studycafeBook(bookVo);
			if(result > 0) {
				System.out.println("성공!");
			} 
			return "studycafe/book";
		}
		
		//회원정보 + 예약폼 데이터 가져오기
		@RequestMapping(value="/studycafeUser", method=RequestMethod.POST) 
		public ModelAndView userbook(UserBookVo userBookVo , Model model) throws Exception{
			ModelAndView mav = new ModelAndView();
			List<UserBookVo> k = bookService.studycafeUser(userBookVo);
			
			System.out.println("예약정보 : " + k);
			
			if(k != null) {
				System.out.println("성공!");
				mav.addObject("book", k);
				System.out.println("예약정보 : " + k);
				
			} 
			return mav;
		}
		

}
