package com.ez.swm.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.login.vo.LoginForm;
import com.ez.swm.login.vo.Member;
import com.ez.swm.login.vo.SignUpForm;

@Repository
public class MemberDao {
	
	@Autowired
	SqlSession sqlSession;

	public int signUpMember(SignUpForm member) {

		return sqlSession.insert("Member.signUpMember" , member);
	}

	public Member loginMember(LoginForm member) {

		return sqlSession.selectOne("Member.loginMember", member);
	} 

}
