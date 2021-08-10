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
			 msg = "ȸ�������� ���������� �Ϸ�Ǿ����ϴ�";
		 	  
		  }else {
			  msg = "ȸ������ ����"; 
			 	} 
		 model.addAttribute("msg", msg); 
		 model.addAttribute("loc", loc);
		 
		 return "common/msg";
		 		
	}
	
	// ���̵� �ߺ� Ȯ��
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
	
	// �г��� �ߺ� Ȯ��
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
	
	// �α��� ������
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm";
	}	
	
	// �α��� ó�� (�����)
	@RequestMapping(value="/loginForm", method=RequestMethod.POST)
	public String memberLogin(LoginForm member,HttpSession httpSession, Model model) throws Exception {
		Member m = memberService.memberLogin(member);
		
		if(m != null) {
			httpSession.setAttribute("member", m);
			model.addAttribute("member", m);
			return "redirect:/";
		} else {
			String msg = "�Է��Ͻ� ������ ��ġ�ϴ� ȸ���� �����ϴ�";
			String loc = "/loginForm";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			return "common/msg";
		}	
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
	@RequestMapping(value="/findIdForm", method=RequestMethod.GET)
	public String findIdPage() {
		return "/login/findId";
	}
	
	
	// ���̵� ã��
	
	  @RequestMapping(value="/findId", method=RequestMethod.POST) 
	  public String findId(Member member, Model model) throws Exception {
	  
	  Member idResult = memberService.findId(member); // ���̵� �־�
	  
	  // ���̵� ã�� ����
	  if(idResult == null) {
		
		  String msg = "�Է��Ͻ� ������ ��ġ�ϴ� ���̵� �����ϴ� \\n �ٽ� �Է����ּ���";
		  String loc= "/findIdForm";
		  model.addAttribute("msg", msg);
		  model.addAttribute("loc", loc);
		  return "common/msg";
		 
	  } else {
		 
		  model.addAttribute("findId", idResult);
		  return "/login/findIdResult";
		  
		  } 
	  }
	 
	
	// ��й�ȣ ã�� ������
	
	  @RequestMapping(value="/findPw", method=RequestMethod.GET) 
	  public String findPwPage() { 
		  return "login/findPw"; 
		  }
	  
	  
	  // ��й�ȣ ã��
	  
	  @RequestMapping(value="/findPw", method=RequestMethod.POST) 
	  public String findPw(Member member, Model model) throws Exception {
		  Member pwResult = memberService.findPw(member);
		  
		  String msg = "";
		  String loc = "/";
		 
		// ��й�ȣ ã�� ����  
	  if(pwResult == null) {
		  msg = "�Է��Ͻ� ������ ��ġ�ϴ� ��й�ȣ�� �����ϴ� \\n �ٽ� �Է����ּ���";
		  loc = "/findPw";
		  model.addAttribute("msg", msg);
		  model.addAttribute("loc", loc);
		  return "common/msg";
	  } else {
		  model.addAttribute("findPw", pwResult);
		  return "/login/findPwResult";
		  }
	  }
	 
	//�α׾ƿ�
	@RequestMapping("/logout")
	public String logout(HttpSession session, Model model) {
		
		session.invalidate();
		
		String msg = "�α׾ƿ� �Ǿ����ϴ�";
		String loc = "/";
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
		
	}	
	
}
