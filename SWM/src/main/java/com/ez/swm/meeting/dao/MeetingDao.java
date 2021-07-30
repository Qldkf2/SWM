package com.ez.swm.meeting.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.meeting.vo.MeetingBoard;
import com.ez.swm.meeting.vo.MeetingBoardComment;
import com.ez.swm.meeting.vo.MeetingBoardFile;
import com.ez.swm.meeting.vo.MeetingDetail;
import com.ez.swm.meeting.vo.MeetingList;
import com.ez.swm.meeting.vo.MeetingWrite;

@Repository
public class MeetingDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int meetingWriteForm(MeetingWrite meetingWrite) {
	
		return sqlSession.insert("Meeting.meetingWrite", meetingWrite);
	}

	public List<MeetingList> getMeetingList() {
	
		return sqlSession.selectList("Meeting.getMeetingList");
	}

	public MeetingDetail getMeetingArticle(int meeting_no) {
		
		return sqlSession.selectOne("Meeting.getMeetingArticle", meeting_no);
	}

	public List<MeetingBoard> getMeetingBoardList(int meeting_no) {
		
		return sqlSession.selectList("Meeting.getMeetingBoardList", meeting_no);
	}

	
	public MeetingBoard getMeetingBoardArticle(Map<String,Object> valueMap){
		
		return sqlSession.selectOne("Meeting.getMeetingBoardArticle", valueMap);
	}

	public int insertPartyBoardArticle(MeetingBoard meetingBoard) {
		sqlSession.insert("Meeting.insertPartyBoardArticle", meetingBoard);	
		return sqlSession.selectOne("Meeting.getParty_no");
	}

	public void insertFile(Map<String, Object> valueMap) {
		 sqlSession.insert("File.insertFile", valueMap);
		
	}

	public List<MeetingBoardFile> getFileList(int party_no) {
	
		return sqlSession.selectList("Meeting.getFileList", party_no);
	}

	public List<MeetingBoardComment> getPartyBoardComment(int party_no) {
		return sqlSession.selectList("Meeting.getPartyBoardComment",party_no);
	}

	public MeetingBoard getPartyBoardArticle(HashMap<String, Object> valueMap) {
		return sqlSession.selectOne("Meeting.getPartyBoardArticle", valueMap);
	}

	public int meetingUpdate(int meeting_no) {
		
		return sqlSession.update("Meeting.meetingUpdate", meeting_no);
	}
}
