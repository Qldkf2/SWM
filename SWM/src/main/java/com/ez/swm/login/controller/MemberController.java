package com.ez.swm.login.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
			 msg = "회원가입이 정상적으로 완료되었습니다";
		 	  
		  }else {
			  msg = "회원가입 실패"; 
			 	} 
		 model.addAttribute("msg", msg); 
		 model.addAttribute("loc", loc);
		 
		 return "common/msg";
		 		
	}
	
	// 아이디 중복 확인
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public @ResponseBody String idCheck(@RequestParam("id") String userId) {
		String str = "";
		int idCheck = memberService.idCheck(userId);
		if(idCheck == 1) {
			str = "YES";
		} else {
			str  = "NO";  
		}
		return str;
	}
	
	// 닉네임 중복 확인
	@RequestMapping(value="/nickNameCheck", method=RequestMethod.POST) 
	public @ResponseBody String nickNameCheck(@RequestParam("nickName") String nickName) {
		String str = "";
		int nickNameCheck = memberService.nickNameCheck(nickName);
		if(nickNameCheck == 1) {
			str = "YES";
		} else {
			str = "NO";
		}
		return str;
	}
	
	// 로그인 페이지
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm";
	}	
	
	// 로그인 처리 (사용자)
	@RequestMapping(value="/loginForm", method=RequestMethod.POST)
	public String memberLogin(LoginForm member,HttpSession httpSession, Model model) throws Exception {
		Member m = memberService.memberLogin(member);
		
		if(m != null) {
			httpSession.setAttribute("member", m);
			model.addAttribute("member", m);
			return "redirect:/";
		} else {
			String msg = "입력하신 정보와 일치하는 회원이 없습니다";
			String loc = "/loginForm";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			return "common/msg";
		}	
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
	@RequestMapping(value="/findIdForm", method=RequestMethod.GET)
	public String findIdPage() {
		return "/login/findId";
	}
	
	
	// 아이디 찾기
	
	  @RequestMapping(value="/findId", method=RequestMethod.POST) 
	  public String findId(Member member, Model model) throws Exception {
	  
	  Member idResult = memberService.findId(member); // 아이디 있어
	  
	  // 아이디 찾기 실패
	  if(idResult == null) {
		
		  String msg = "입력하신 정보와 일치하는 아이디가 없습니다 \\n 다시 입력해주세요";
		  String loc= "/findIdForm";
		  model.addAttribute("msg", msg);
		  model.addAttribute("loc", loc);
		  return "common/msg";
		 
	  } else {
		 
		  model.addAttribute("findId", idResult);
		  return "/login/findIdResult";
		  
		  } 
	  }
	 
	
	// 비밀번호 찾기 페이지
	
	  @RequestMapping(value="/findPw", method=RequestMethod.GET) 
	  public String findPwPage() { 
		  return "login/findPw"; 
		  }
	  
	  
	  // 비밀번호 찾기
	  
	  @RequestMapping(value="/findPw", method=RequestMethod.POST) 
	  public String findPw(Member member, Model model) throws Exception {
		  Member pwResult = memberService.findPw(member);
		  
		  String msg = "";
		  String loc = "/";
		 
		// 비밀번호 찾기 실패  
	  if(pwResult == null) {
		  msg = "입력하신 정보와 일치하는 비밀번호가 없습니다 \\n 다시 입력해주세요";
		  loc = "/findPw";
		  model.addAttribute("msg", msg);
		  model.addAttribute("loc", loc);
		  return "common/msg";
	  } else {
		  model.addAttribute("findPw", pwResult);
		  return "/login/findPwResult";
		  }
	  }
	 
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session, Model model) {
		
		session.invalidate();
		
		String msg = "로그아웃 되었습니다";
		String loc = "/";
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
		
	}	
	
}
