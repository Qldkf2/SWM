package com.ez.swm.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.book.service.BookService;
import com.ez.swm.book.vo.BookVo;
import com.ez.swm.book.vo.PayInfo;
import com.ez.swm.book.vo.UserBookVo;

@Controller
public class BookController {
	
	@Autowired
	private BookService bookService; 
	
		@RequestMapping(value="/book/studycafeBook") 
		public ModelAndView book(BookVo bookVo ,Model model) throws Exception{
			ModelAndView mav = new ModelAndView();
			String msg = ""; 
			String loc = "/"; 
				 	
			 model.addAttribute("msg", msg); 
			 model.addAttribute("loc", loc);
			 
			 //스터디룸 이름만 가져오려공
			String[] room= bookVo.getStudycafe_room().split("#");
			bookVo.setStudycafe_room(room[1]);
			
			int result = bookService.studycafeBook(bookVo);
			if(result > 0) {
				msg = "예약이 정상적으로 완료되었습니다";		
				mav.addObject("msg",msg);
				mav.setViewName("common/msg");
			}
			
			return mav;
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
		
		//결제정보가져오기
		@RequestMapping(value="book/requestPay")
		@ResponseBody
		public PayInfo payInfo(@RequestParam(value="book_no",required=false) int book_no) {
			
			return bookService.payInfo(book_no);
			
		}
		

}
