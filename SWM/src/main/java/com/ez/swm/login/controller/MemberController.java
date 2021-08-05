package com.ez.swm.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.login.service.MemberService;
import com.ez.swm.login.vo.LoginForm;
import com.ez.swm.login.vo.Member;
import com.ez.swm.login.vo.SignUpForm;

@Controller
public class MemberController {
	
	//Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	MemberService memberService;
	
	//회원가입 폼 가기
	@RequestMapping(value= "/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		return "login/joinForm";
	}
	
	//회원가입 
	@RequestMapping(value="/joinForm", method=RequestMethod.POST)
	public String memberJoin(SignUpForm member, Model model) throws Exception {
		
		int result =  memberService.insertMember(member);
		 String msg = ""; 
		 String loc = "/"; 
		 if(result > 0) { 
			 msg = "회원가입 성공";
		 	  
		  }else {
			  msg = "회원가입 실패"; 
			 	} 
		 model.addAttribute("msg", msg); 
		 model.addAttribute("loc", loc);
		 
		 return "common/msg";
		 
				
	}
	
	// 로그인 페이지
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm";
	}	
	
	// 로그인 처리
	@RequestMapping(value="/loginForm", method=RequestMethod.POST)
	public ModelAndView login(LoginForm member,HttpSession httpSession, Model model) throws Exception {	
		ModelAndView mav = new ModelAndView();
		Member m = memberService.memberLogin(member);
		
		String msg = "";
		String loc = "/";
		if(m != null) {
			msg = "로그인 성공";
			httpSession.setAttribute("member", m);
			mav.addObject("member", m); 
			System.out.println("회원 정보 : " + m);
				
		} else {
			msg = "로그인 실패";
		}
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("common/msg");
			return mav;
	}
		
			
			
			// 아이디 쿠키에 기억하기 로직
			/*Cookie rememberCookie = new Cookie("rememberId", member.getUserid()); 
			rememberCookie.setPath("/");
			if(member.isRememberId()) {
				rememberCookie.setMaxAge(60*60*24*30); // 총 한달동안 아이디 저장
			} else {
				rememberCookie.setMaxAge(0); 
			}
			
			response.addCookie(rememberCookie);
			
			return "index";
		}*/

	
	// 아이디 찾기 화면
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public String findIdPage() {
		return "/login/findID2";
	}
	
	
	// 아이디 찾기
	
	  @RequestMapping(value="/findId", method=RequestMethod.POST) public String
	  findId(Member member, Model model) throws Exception {
	  
	  Member idResult = memberService.findId(member); // 아이디 있어
	  
	  // 아이디, 이메일 일치하는 회원이 x -> 아이디 찾기 실패 
	  if(idResult == null) {
		
		  return "/login/findID2"; 
	  } else {
		  model.addAttribute("findId", idResult); 
		  return "/login/findIdResult"; } 
	  }
	 
	
	// 비밀번호 찾기 페이지
	
	  @RequestMapping(value="/findPw", method=RequestMethod.GET) 
	  public String findPwPage() { 
		  return "login/findPw2"; 
		  }
	  
	  
	  // 비밀번호 찾기
	  
	  @RequestMapping(value="/findPw", method=RequestMethod.POST) 
	  public String findPw(Member member, Model model) throws Exception {
		  Member pwResult = memberService.findPw(member);
	  
	  if(pwResult == null) { 		   
		  return "login/findPw2";
	  
	  } else {
		  model.addAttribute("findPw", pwResult);
		  return "login/findPwResult"; 
		  }
	  }
	 
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
		
	}	
		
	// 회원정보 수정(사용자) 페이지 
	@RequestMapping(value="/my/memberModify", method=RequestMethod.GET)
	public String myInfoModifyPage(Member m , HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("loginResult");
		model.addAttribute(sessionMember);
		return "/mypage/membermodify";
	}
	
	/*
	 * //회원정보 수정(사용자)
	 * 
	 * @RequestMapping(value="/my/memberModify", method=RequestMethod.POST) public
	 * String myInfoModify(Member member, HttpSession session) throws Exception {
	 * 
	 * Member sessionMember = (Member) session.getAttribute("loginResult"); int
	 * sessionUserNo = sessionMember.getUserNo(); member.setUserNo(sessionUserNo);
	 * 
	 * memberService.updateMemberByUser(member); return
	 * "redirect: /mypage/membermodify"; }
	 * 
	 * // 회원정보 수정(관리자) 페이지
	 * 
	 * @RequestMapping(value="/admin/memberModify", method=RequestMethod.GET) public
	 * String adminMemberModifyPage() { return "/admin/membermodify"; }
	 * 
	 * @RequestMapping(value="/admin/memberModify", method=RequestMethod.POST)
	 * public String adminMemberModify(Member member, HttpSession session) throws
	 * Exception {
	 * 
	 * memberService.updateMemberByAdmin(member); return
	 * "redirect: /mypage/membermodify"; }
	 * 
	 * @RequestMapping(value="/my/out", method=RequestMethod.GET) public String
	 * outPage() { return "/my/out"; }
	 * 
	 * // 회원 탈퇴 - 아이디, 비번 확인
	 * 
	 * @RequestMapping(value="/my/out", method=RequestMethod.POST) public String
	 * out(Member member, HttpSession session) throws Exception {
	 * 
	 * // 세션에 저장되어 있는 member 변수 가져옴 Member sessionMember = (Member)
	 * session.getAttribute("loginResult"); String sessionPw =
	 * sessionMember.getPassword(); String sessionId = sessionMember.getUserId();
	 * 
	 * // 세션에 저장되어 있는 비밀번호와 회원정보 비밀번호와 비교 if(sessionPw.equals(member.getPassword())
	 * && sessionId.equals(member.getUserId())) {
	 * memberService.deleteMember(member); session.invalidate(); return
	 * "redirect: /main"; } else { return "redirect: /my/out"; }
	 * 
	 * 
	 * 
	 * }
	 */

}
