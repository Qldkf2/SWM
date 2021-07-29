package com.ez.swm.login.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.login.service.MemberService;
import com.ez.swm.login.vo.LoginForm;
import com.ez.swm.login.vo.Member;
import com.ez.swm.login.vo.SignUpForm;

@Controller  
public class MemberController {
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(value="/sign_up")
	public String joinForm() {
	
	return "login/joinForm"; 
	}

	@RequestMapping(value="/signUpMember")  
	public String sign_up(SignUpForm member, Model model) {
	
		boolean result = memberService.signUpMember(member); 
		if(!result) {
			model.addAttribute("msg", "fail");
			return "login/joinForm"; 
		}
		model.addAttribute("msg", "����");
		return "redirect:/";
	}

	@RequestMapping(value="/loginForm")
	public String loginForm() {
	
	return "login/loginForm";
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(LoginForm member, HttpSession httpSession, Model model) {		
		ModelAndView mav = new ModelAndView();
		Member m = memberService.loginMember(member);
		
		String msg = "";
		String loc = "/";
		if(m != null) {
			msg = "�α��� ����";
			httpSession.setAttribute("member", m);
			mav.addObject("member", m); 
			System.out.println("ȸ�� ���� : " + m);
			
		}else {
			msg = "�α��� ����";
		}
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			
			mav.setViewName("common/msg");

		return mav;
	}

}
