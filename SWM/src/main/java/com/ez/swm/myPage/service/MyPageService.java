package com.ez.swm.myPage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.swm.book.vo.UserBookVo;
import com.ez.swm.login.vo.Member;
import com.ez.swm.meeting.vo.Meeting;
import com.ez.swm.myPage.dao.MyPageDao;
import com.ez.swm.myPage.vo.Ask;
import com.ez.swm.myPage.vo.AskComment;
import com.ez.swm.myPage.vo.AskJoin;
import com.ez.swm.myPage.vo.MyStudyBoard;

@Service
public class MyPageService {

	@Autowired
	MyPageDao myPageDao;
	
	
	public int updateMemberByUser(Member member) {
		return myPageDao.updateMemberByUser(member);
	}

	public int deleteMember(Member member) {
		return myPageDao.deleteMember(member);
	}

	public int insertAsk(Ask ask) {
		return myPageDao.insertAsk(ask);
	}

	public List<AskJoin> getAskByUserNo(int userNo) {
		return myPageDao.getAskByUserNo(userNo);	
	}

	public Ask askDetail(int askNo) {
		return myPageDao.askDetail(askNo);
	}

	public List<UserBookVo> getBookInfoList(int userNo) {
		return myPageDao.getBookInfoList(userNo);
	}

	public List<Meeting> myCreateStudy(int userNo) {
		return myPageDao.myCreateStudy(userNo);
	}

	public List<Meeting> myJoinStudy(int userNo) {
		return myPageDao.myJoinStudy(userNo);
	}

	public List<MyStudyBoard> myStudyBoard(int userNo) {
		return myPageDao.myStudyBoard(userNo);
	}
	
	public int payStatus (HashMap<String,Object> resultMap) {
		return myPageDao.payStatus(resultMap);
		
	}
}
