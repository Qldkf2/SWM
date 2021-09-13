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
	
	//ȸ������ �� ����
	@RequestMapping(value= "/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		return "login/joinForm";
	}
	
	//ȸ������ 
	@RequestMapping(value="/joinForm", method=RequestMethod.POST)
	public String memberJoin(SignUpForm member, Model model) throws Exception {
		
		/* �ܹ��� ��ȣȭ - ������ ��ť��Ƽ ����
		 * BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); String securePw
		 * = encoder.encode(member.getPassword()); member.setPassword(securePw);
		 */
		
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
	
	
	// �̸��� ����
	@RequestMapping(value="/mailCheck", method=RequestMethod.POST)
	@ResponseBody // reponseBody�� ����� String�� ������ ���ڿ��� .jsp�� ��ȯ���ϰ� ���ڿ� ����ü�� ��ȯ��! (�׷����� ������������ ������ �� ���� ����!)
	public String mailCheck(String email) {
			System.out.println("�Ѿ�� �̸��� :" + email);
			
			// ������ȣ�� ����� ���� ����
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			
			//�̸��� ������ ����� �⺻ ���� ����
			String from = "StudyWithMe@gmail.com";
			String to = email;
			String title = "[������] ȸ������ ���� �̸��� �Դϴ�.";
			String content = "������ Ȩ�������� �湮���ּż� �����մϴ�."
					+ "<br><br>"
					+ "���� ��ȣ�� <b>" + checkNum + "</b> �Դϴ�."
					+ "<br>"
					+ "�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";
			
			// ���� ������ ���� ��ü
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, "UTF-8"); 
			// ���⼭ �ι�° �� true �߰��ϸ� ��� ���� ���ε���� �� �� �ִ� �̸���! ����ó�� �ϸ� �ؽ�Ʈ�� ������ �ִ� �̸���
			
			try {
				helper.setFrom(from);
				helper.setTo(to);
				helper.setSubject(title);
				helper.setText(content, true); // ���⼭ 2��° �Ű������� true ���� html ������ ����
				mailSender.send(mail);
				
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			// ajax�� ���� ��û���� ���� ��� �ٽ� �����͸� ��ȯ�� �� ������ Ÿ���� String�� �����ؼ� ����ȯ����� ��!
			String num = Integer.toString(checkNum);
			
			return num;
			
	}
	
	
	// �α��� ������
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm";
	}	
	
	// �α��� ó�� (�����)
	@RequestMapping(value="/loginForm", method=RequestMethod.POST)
	public String memberLogin(LoginForm member,HttpSession session, HttpServletResponse response, Model model) throws Exception {
		
		Member m = memberService.memberLogin(member);
		System.out.println(member.isAutoLogin());
		
			if(m != null) { // �α��� ����
				
				if(member.isAutoLogin()) { // �� ȭ�鿡��, �ڵ��α��� �Ѵٴ� üũ�� ���� ��
					Cookie cookie = new Cookie("loginCookie", session.getId()); // �α��� �Ҷ� ���� ���� ���� ID�� ��Ű�� ����
					cookie.setPath("/"); // ��� ��ο��� ����� �� �ְ� / �� ��� ����
					long limitTime = 60*60*24*90;
					cookie.setMaxAge((int) limitTime); // �ڵ��α����� 90�Ϸ� ����
					response.addCookie(cookie);
					
					long expiredDate = System.currentTimeMillis()+(limitTime*1000); // ���� �ð� + �Ʊ� ������ 3���� = 3���� ���� ��¥
					Date limitDate = new Date(expiredDate);
					member.setLimitTime(limitDate);
					member.setSessionId(session.getId());
					memberService.keepLogin(member);
				}
				
					session.setAttribute("member", m);
					model.addAttribute("member", m);
					return "redirect:/";
				
			} else { // �α��� ����
				String msg = "�Է��Ͻ� ������ ��ġ�ϴ� ȸ���� �����ϴ�";
				String loc = "/loginForm";
				model.addAttribute("msg", msg);
				model.addAttribute("loc", loc);
				return "common/msg";
			}	
	    }
		
	
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
	public String logout(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, LoginForm member) {
		
		Member loginMember = (Member) session.getAttribute("member");
		
		if(loginMember != null) { // �α��� �ߴ� �̷��� �ִٸ�
			session.invalidate();
		
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) { // �� ��Ű ���� �Ҷ�
				loginCookie.setMaxAge(0); // ��ȿ�ð��� 0���� �����Ͽ�, ��Ű�� ������
				response.addCookie(loginCookie);
			
				member.setSessionId("NONE");
				Date date = new Date(System.currentTimeMillis());
				member.setLimitTime(date);
				member.setUserId(loginMember.getUserId());
				memberService.keepLogin(member);
			}	
			
		}
		
		String msg = "�α׾ƿ� �Ǿ����ϴ�";
		String loc = "/";
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}	
	
}
