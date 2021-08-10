package com.ez.swm.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.admin.service.AdminService;
import com.ez.swm.admin.vo.StudycafeWrite;
import com.ez.swm.login.vo.Member;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/admin")
	public String admin() {
	
	return "admin/adminMain";
	}
	
	//스터디 카페 글쓰기 폼
	@RequestMapping("/admin/studycafeWriteForm")
	public ModelAndView studycafeWriteForm(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Member m = new Member();
		HttpSession session = request.getSession();
		m = (Member)session.getAttribute("member");
		
		mv.addObject("member",m);
		mv.setViewName("admin/studycafeWriteForm");
		return mv;
	}	
	
   // 스터디 카페 글쓰기 진행
	@RequestMapping(value = "/admin/studycafeWrite", method=RequestMethod.POST)
	public ModelAndView studycafeWrite (StudycafeWrite studycafeWrite , MultipartHttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		int result = adminService.studycafeWrite(studycafeWrite,request);
		
		 String msg = ""; 
		 String loc = "/admin"; 
		 if(result > 0) { 
			 msg = "카페등록 성공~.~";
		  }else  msg = "카페등록 실패~.~"; 
			 	
		 mav.addObject("msg", msg); 
		 mav.addObject("loc", loc);
		 mav.setViewName("common/msg");

		return mav;
	}
	
}
