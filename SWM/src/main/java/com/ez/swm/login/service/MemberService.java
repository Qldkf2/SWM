package com.ez.swm.login.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.swm.login.dao.MemberDao;
import com.ez.swm.login.vo.LoginForm;
import com.ez.swm.login.vo.Member;
import com.ez.swm.login.vo.SignUpForm;

@Service
public class MemberService {
	
	
	@Autowired
	MemberDao memberDao;
	
	public boolean signUpMember(SignUpForm member) {
		return memberDao.signUpMember(member) > 0; 
	}

	public Member loginMember(LoginForm member) {
		return memberDao.loginMember(member);
	}
}