package com.ez.swm.myPage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.book.vo.UserBookVo;
import com.ez.swm.login.vo.Member;
import com.ez.swm.myPage.vo.Ask;
import com.ez.swm.myPage.vo.AskComment;
import com.ez.swm.myPage.vo.AskJoin;

@Repository
public class MyPageDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int updateMemberByUser(Member member) {
		return sqlSession.update("myPage.updateMemberByUser", member);
	}

	public int deleteMember(Member member) {
		return sqlSession.update("myPage.deleteMember", member);
	}

	public int insertAsk(Ask ask) {
		return sqlSession.insert("myPage.insertAsk", ask);
	}

	public List<AskJoin> getAskByUserNo(int userNo) {
		return sqlSession.selectList("myPage.getAskByUserNo", userNo);
	}

	public Ask askDetail(int askNo) {
		return sqlSession.selectOne("myPage.askDetail", askNo);
	}

	public List<AskJoin> askAllList() {
		return sqlSession.selectList("myPage.askAllList");
	}

	public int insertAskReply(AskComment comment) {
		return sqlSession.insert("myPage.insertAskReply", comment);
	}

	public AskComment getAskReply(int ask_no) {
		return sqlSession.selectOne("myPage.getAskReply", ask_no);
	}

	public List<UserBookVo> getBookInfoList(int userNo) {
		return sqlSession.selectList("myPage.getBookInfoList", userNo);
	}

}
