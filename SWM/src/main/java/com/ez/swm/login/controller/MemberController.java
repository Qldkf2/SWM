package com.ez.swm.login.controller;

import java.sql.Date;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.ez.swm.login.service.MemberService;
import com.ez.swm.login.vo.LoginForm;
import com.ez.swm.login.vo.Member;
import com.ez.swm.login.vo.SignUpForm;
import com.sun.org.slf4j.internal.Logger;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	JavaMailSender mailSender;
	
	//회원가입 폼 가기
	@RequestMapping(value= "/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		return "login/joinForm";
	}
	
	//회원가입 
	@RequestMapping(value="/joinForm", method=RequestMethod.POST)
	public String memberJoin(SignUpForm member, Model model) throws Exception {
		
		/* 단방향 암호화 - 스프링 시큐리티 제공
		 * BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); String securePw
		 * = encoder.encode(member.getPassword()); member.setPassword(securePw);
		 */
		
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
	@ResponseBody
	public String nickNameCheck(@RequestParam("nickName") String nickName) {
		String str = "";
		int nickNameCheck = memberService.nickNameCheck(nickName);
		if(nickNameCheck == 1) {
			str = "YES";
		} else {
			str = "NO";
		}
		return str;
	}
	
	
	// 이메일 인증
	@RequestMapping(value="/mailCheck", method=RequestMethod.POST)
	@ResponseBody // reponseBody를 써야지 String이 리턴한 문자열을 .jsp로 반환안하고 문자열 그자체로 반환함! (그래야지 에이젝스에서 리턴한 값 쓸수 있지!)
	public String mailCheck(String email) {
			System.out.println("넘어온 이메일 :" + email);
			
			// 인증번호로 사용할 난수 생성
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			
			//이메일 보낼때 사용할 기본 정보 설정
			String from = "StudyWithMe@gmail.com";
			String to = email;
			String title = "[스윗미] 회원가입 인증 이메일 입니다.";
			String content = "스윗미 홈페이지를 방문해주셔서 감사합니다."
					+ "<br><br>"
					+ "인증 번호는 <b>" + checkNum + "</b> 입니다."
					+ "<br>"
					+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
			
			// 메일 내용을 넣을 객체
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, "UTF-8"); 
			// 여기서 두번째 값 true 추가하면 얘는 파일 업로드까지 할 수 있는 이메일! 지금처럼 하면 텍스트만 보낼수 있는 이메일
			
			try {
				helper.setFrom(from);
				helper.setTo(to);
				helper.setSubject(title);
				helper.setText(content, true); // 여기서 2번째 매개변수에 true 쓰면 html 읽을수 있음
				mailSender.send(mail);
				
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			// ajax를 통한 요청으로 인해 뷰로 다시 데이터를 반환할 때 데이터 타입은 String만 가능해서 형변환해줘야 함!
			String num = Integer.toString(checkNum);
			
			return num;
			
	}
	
	
	// 로그인 페이지
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm";
	}	
	
	// 로그인 처리 (사용자)
	@RequestMapping(value="/loginForm", method=RequestMethod.POST)
	public String memberLogin(LoginForm member,HttpSession session, HttpServletResponse response, Model model) throws Exception {
		
		Member m = memberService.memberLogin(member);
		System.out.println(member.isAutoLogin());
		
			if(m != null) { // 로그인 성공
				
				if(member.isAutoLogin()) { // 즉 화면에서, 자동로그인 한다는 체크를 했을 때
					Cookie cookie = new Cookie("loginCookie", session.getId()); // 로그인 할때 생긴 세션 고유 ID를 쿠키에 저장
					cookie.setPath("/"); // 모든 경로에서 사용할 수 있게 / 로 경로 지정
					long limitTime = 60*60*24*90;
					cookie.setMaxAge((int) limitTime); // 자동로그인을 90일로 지정
					response.addCookie(cookie);
					
					long expiredDate = System.currentTimeMillis()+(limitTime*1000); // 현재 시간 + 아까 지정한 3개월 = 3개월 후의 날짜
					Date limitDate = new Date(expiredDate);
					member.setLimitTime(limitDate);
					member.setSessionId(session.getId());
					memberService.keepLogin(member);
				}
				
					session.setAttribute("member", m);
					model.addAttribute("member", m);
					return "redirect:/";
				
			} else { // 로그인 실패
				String msg = "입력하신 정보와 일치하는 회원이 없습니다";
				String loc = "/loginForm";
				model.addAttribute("msg", msg);
				model.addAttribute("loc", loc);
				return "common/msg";
			}	
	    }
		
	
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
	public String logout(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, LoginForm member) {
		
		Member loginMember = (Member) session.getAttribute("member");
		
		if(loginMember != null) { // 로그인 했던 이력이 있다면
			session.invalidate();
		
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) { // 즉 쿠키 존재 할때
				loginCookie.setMaxAge(0); // 유효시간을 0으로 지정하여, 쿠키를 삭제함
				response.addCookie(loginCookie);
			
				member.setSessionId("NONE");
				Date date = new Date(System.currentTimeMillis());
				member.setLimitTime(date);
				member.setUserId(loginMember.getUserId());
				memberService.keepLogin(member);
			}	
			
		}
		
		String msg = "로그아웃 되었습니다";
		String loc = "/";
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}	
	
}
