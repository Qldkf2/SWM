package com.ez.swm.login.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.login.vo.LoginForm;
import com.ez.swm.login.vo.Member;
import com.ez.swm.login.vo.SignUpForm;

@Repository
public class MemberDao  {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public Member memberLogin(LoginForm member) {
		
		return sqlSession.selectOne("member.memberLogin", member);
	}


	public int insertMember(SignUpForm member) {
		
		return sqlSession.insert("member.insertMember", member);
	}
	
	public Member findId(Member member) {
		
		return sqlSession.selectOne("member.findId", member);
	}

	public Member findPw(Member member) {
		
		return sqlSession.selectOne("member.findPw", member);
	}


	public void updateMemberByUser(Member member) {
		
		sqlSession.update("member.updateMemberByUser", member);
	}
	
	public void updateMemberByAdmin(Member member) {
		
		sqlSession.update("member.updateMemberByAdmin", member);
	}

	public void deleteMember(Member member) {
		sqlSession.delete("member.deleteMember", member);
		
	}
	
}	
