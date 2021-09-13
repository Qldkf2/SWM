package com.ez.swm.login.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.ez.swm.login.service.MemberService;
import com.ez.swm.login.vo.Member;


public class AuthenticationInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// �̹� �α��� �Ǿ��ִ� ������ �ִ��� Ȯ���Ϸ��� ������
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");
		
		if( obj == null ) { // �ƹ��� �α��� �� ���°� �ƴ϶��
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie"); // �츮�� ������� ��Ű ������
			System.out.println();
			
				if( loginCookie != null ) { // ��, �ڵ��α��� �ϰڴٰ� ���� ��Ű�� �ִٸ�
					String sessionId = loginCookie.getValue(); // ��Ű�� �����ߴ� ����ID ������
					Member loginMember = memberService.sessionKeyCheck(sessionId);
					System.out.println("loginMember >>> " + loginMember);
					
					if( loginMember != null ) { // �ڵ��α��� üũ �� ����ڰ� �ִٸ� ������ ����� ���ǿ� ����
						session.setAttribute("member", loginMember);
						return true; // prehandle ����Ÿ�Կ��� true�� ��Ʈ�ѷ� ��û uri�� ���� �ǳ��� �㰡 ����! true�� ����
						
					}
					
					// �α���, �ڵ��α��� üũ�� �ȵ� ���´� �׳� ���� ȭ������ �����ϸ� ��
					response.sendRedirect("/");
					return false; // ���ͼ�Ʈ�� ����� �� x 
					
				}
		
		}
		return true; // ���ͼ�Ʈ ����Ͽ� ��û�� url ����
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
	

}
