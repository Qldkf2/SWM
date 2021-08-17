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
	
		@RequestMapping(value="/book/studycafeBook", method=RequestMethod.POST) 
		public ModelAndView book(BookVo bookVo ,Model model) throws Exception{
			ModelAndView mav = new ModelAndView();
			String msg = ""; 
			String loc = "/"; 
				 	
			 model.addAttribute("msg", msg); 
			 model.addAttribute("loc", loc);
			int result = bookService.studycafeBook(bookVo);
			if(result > 0) {
				msg = "������ ���������� �Ϸ�Ǿ����ϴ�";		
				mav.addObject("msg",msg);
				mav.setViewName("common/msg");
			}
			
			return mav;
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
