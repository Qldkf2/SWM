package com.ez.swm.myPage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.book.vo.UserBookVo;
import com.ez.swm.login.vo.Member;
import com.ez.swm.meeting.vo.Meeting;
import com.ez.swm.myPage.vo.Ask;
import com.ez.swm.myPage.vo.AskComment;
import com.ez.swm.myPage.vo.AskJoin;
import com.ez.swm.myPage.vo.MyStudyBoard;

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

	

	public List<UserBookVo> getBookInfoList(int userNo) {
		return sqlSession.selectList("myPage.getBookInfoList", userNo);
	}

	public List<Meeting> myCreateStudy(int userNo) {
		return sqlSession.selectList("myPage.myCreateStudy", userNo);
	}

	public List<Meeting> myJoinStudy(int userNo) {
		return sqlSession.selectList("myPage.myJoinStudy", userNo);
	}

	public List<MyStudyBoard> myStudyBoard(int userNo) {
		return sqlSession.selectList("myPage.myStudyBoard", userNo);
	}

	
	public int payStatus(HashMap<String,Object> resultMap) {
		return sqlSession.insert("myPage.payStatus", resultMap);
	}
}
