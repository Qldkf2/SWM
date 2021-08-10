package com.ez.swm.myPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.swm.book.vo.UserBookVo;
import com.ez.swm.login.vo.Member;
import com.ez.swm.myPage.dao.MyPageDao;
import com.ez.swm.myPage.vo.Ask;
import com.ez.swm.myPage.vo.AskComment;
import com.ez.swm.myPage.vo.AskJoin;

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

	public List<AskJoin> askAllList() {
		return myPageDao.askAllList();
	}

	public int insertAskReply(AskComment comment) {
		return myPageDao.insertAskReply(comment);
	}	

	public AskComment getAskReply(int ask_no) {
		return myPageDao.getAskReply(ask_no);
	}

	public List<UserBookVo> getBookInfoList(int userNo) {
		return myPageDao.getBookInfoList(userNo);
	}
}
