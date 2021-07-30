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
	
	public Member memberLogin(LoginForm member) throws Exception {
		return memberDao.memberLogin(member);
	}


	public int insertMember(SignUpForm member) throws Exception {
		return memberDao.insertMember(member);
	}

    public Member findId(Member member) throws Exception { 
    	return memberDao.findId(member); }
    
  	 
    public Member findPw(Member member) throws Exception {
    	return memberDao.findPw(member); 
    	}
    
    
    public void updateMemberByUser(Member member) throws Exception {
    	memberDao.updateMemberByUser(member);
    
    }
    
    public void updateMemberByAdmin(Member member) throws Exception {
    	memberDao.updateMemberByAdmin(member); 
    	}
	  
	public void deleteMember(Member member) throws Exception {
		 memberDao.deleteMember(member);
	  
	  }
	 
	
	
	
}