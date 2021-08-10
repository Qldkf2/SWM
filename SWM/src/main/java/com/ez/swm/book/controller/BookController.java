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
	
	
	//������ �ֱ�		
	
	
		@RequestMapping(value="/book/studycafeBook", method=RequestMethod.POST) 
		public String book(BookVo bookVo ,Model model) throws Exception{
			
			int result = bookService.studycafeBook(bookVo);
			if(result > 0) {
				System.out.println("����!");
			} 
			return "studycafe/book";
		}
		
		//ȸ������ + ������ ������ ��������
		@RequestMapping(value="/studycafeUser", method=RequestMethod.POST) 
		public ModelAndView userbook(UserBookVo userBookVo , Model model) throws Exception{
			ModelAndView mav = new ModelAndView();
			List<UserBookVo> k = bookService.studycafeUser(userBookVo);
			
			System.out.println("�������� : " + k);
			
			if(k != null) {
				System.out.println("����!");
				mav.addObject("book", k);
				System.out.println("�������� : " + k);
				
			} 
			return mav;
		}
		

}
