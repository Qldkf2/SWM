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
	
	//ȸ������ �� ����
	@RequestMapping(value= "/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		return "login/joinForm";
	}
	
	//ȸ������ 
	@RequestMapping(value="/joinForm", method=RequestMethod.POST)
	public String memberJoin(SignUpForm member, Model model) throws Exception {
		
		int result =  memberService.insertMember(member);
		 String msg = ""; 
		 String loc = "/"; 
		 if(result > 0) { 
			 msg = "ȸ������ ����";
		 	  
		  }else {
			  msg = "ȸ������ ����"; 
			 	} 
		 model.addAttribute("msg", msg); 
		 model.addAttribute("loc", loc);
		 
		 return "common/msg";
		 
				
	}
	
	// �α��� ������
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm";
	}	
	
	// �α��� ó��
	@RequestMapping(value="/loginForm", method=RequestMethod.POST)
	public ModelAndView login(LoginForm member,HttpSession httpSession, Model model) throws Exception {	
		ModelAndView mav = new ModelAndView();
		Member m = memberService.memberLogin(member);
		
		String msg = "";
		String loc = "/";
		if(m != null) {
			msg = "�α��� ����";
			httpSession.setAttribute("member", m);
			mav.addObject("member", m); 
			System.out.println("ȸ�� ���� : " + m);
				
		} else {
			msg = "�α��� ����";
		}
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("common/msg");
			return mav;
	}
		
			
			
			// ���̵� ��Ű�� ����ϱ� ����
			/*Cookie rememberCookie = new Cookie("rememberId", member.getUserid()); 
			rememberCookie.setPath("/");
			if(member.isRememberId()) {
				rememberCookie.setMaxAge(60*60*24*30); // �� �Ѵ޵��� ���̵� ����
			} else {
				rememberCookie.setMaxAge(0); 
			}
			
			response.addCookie(rememberCookie);
			
			return "index";
		}*/

	
	// ���̵� ã�� ȭ��
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public String findIdPage() {
		return "/login/findID2";
	}
	
	
	// ���̵� ã��
	
	  @RequestMapping(value="/findId", method=RequestMethod.POST) public String
	  findId(Member member, Model model) throws Exception {
	  
	  Member idResult = memberService.findId(member); // ���̵� �־�
	  
	  // ���̵�, �̸��� ��ġ�ϴ� ȸ���� x -> ���̵� ã�� ���� 
	  if(idResult == null) {
		
		  return "/login/findID2"; 
	  } else {
		  model.addAttribute("findId", idResult); 
		  return "/login/findIdResult"; } 
	  }
	 
	
	// ��й�ȣ ã�� ������
	
	  @RequestMapping(value="/findPw", method=RequestMethod.GET) 
	  public String findPwPage() { 
		  return "login/findPw2"; 
		  }
	  
	  
	  // ��й�ȣ ã��
	  
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
	 
	//�α׾ƿ�
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
		
	}	
		
	// ȸ������ ����(�����) ������ 
	@RequestMapping(value="/my/memberModify", method=RequestMethod.GET)
	public String myInfoModifyPage(Member m , HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("loginResult");
		model.addAttribute(sessionMember);
		return "/mypage/membermodify";
	}
	
	/*
	 * //ȸ������ ����(�����)
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
	 * // ȸ������ ����(������) ������
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
	 * // ȸ�� Ż�� - ���̵�, ��� Ȯ��
	 * 
	 * @RequestMapping(value="/my/out", method=RequestMethod.POST) public String
	 * out(Member member, HttpSession session) throws Exception {
	 * 
	 * // ���ǿ� ����Ǿ� �ִ� member ���� ������ Member sessionMember = (Member)
	 * session.getAttribute("loginResult"); String sessionPw =
	 * sessionMember.getPassword(); String sessionId = sessionMember.getUserId();
	 * 
	 * // ���ǿ� ����Ǿ� �ִ� ��й�ȣ�� ȸ������ ��й�ȣ�� �� if(sessionPw.equals(member.getPassword())
	 * && sessionId.equals(member.getUserId())) {
	 * memberService.deleteMember(member); session.invalidate(); return
	 * "redirect: /main"; } else { return "redirect: /my/out"; }
	 * 
	 * 
	 * 
	 * }
	 */

}
