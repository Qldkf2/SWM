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
		
		// 이미 로그인 되어있는 세션이 있는지 확인하려고 가져옴
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");
		
		if( obj == null ) { // 아무도 로그인 한 상태가 아니라면
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie"); // 우리가 만들었던 쿠키 꺼내옴
			System.out.println();
			
				if( loginCookie != null ) { // 즉, 자동로그인 하겠다고 만든 쿠키가 있다면
					String sessionId = loginCookie.getValue(); // 쿠키에 저장했던 세션ID 가져옴
					Member loginMember = memberService.sessionKeyCheck(sessionId);
					System.out.println("loginMember >>> " + loginMember);
					
					if( loginMember != null ) { // 자동로그인 체크 한 사용자가 있다면 가져온 결과를 세션에 저장
						session.setAttribute("member", loginMember);
						return true; // prehandle 리턴타입에서 true는 컨트롤러 요청 uri로 가도 되냐의 허가 여부! true는 간다
						
					}
					
					// 로그인, 자동로그인 체크도 안된 상태니 그냥 메인 화면으로 가게하면 됨
					response.sendRedirect("/");
					return false; // 인터셉트를 통과할 수 x 
					
				}
		
		}
		return true; // 인터셉트 통과하여 요청된 url 수행
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
	

}
