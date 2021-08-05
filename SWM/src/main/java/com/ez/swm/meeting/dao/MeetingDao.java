package com.ez.swm.meeting.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.meeting.vo.Meeting;
import com.ez.swm.meeting.vo.MeetingBoard;
import com.ez.swm.meeting.vo.MeetingBoardComment;
import com.ez.swm.meeting.vo.MeetingBoardFile;
import com.ez.swm.meeting.vo.MeetingBoardModify;
import com.ez.swm.meeting.vo.MeetingDetail;
import com.ez.swm.meeting.vo.MeetingList;
import com.ez.swm.meeting.vo.MeetingPermit;
import com.ez.swm.meeting.vo.MeetingPermitList;
import com.ez.swm.meeting.vo.MeetingUpdate;
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
	// 모임 내 게시글에서 파일 리스트 받아올때 씀
	public MeetingBoardFile getFileList2(int meeting_board_no) {
		
		return sqlSession.selectOne("Meeting.getFileList", meeting_board_no);
	}

	public List<MeetingBoardComment> getPartyBoardComment(int party_no) {
		return sqlSession.selectList("Meeting.getPartyBoardComment",party_no);
	}

	public MeetingBoard getPartyBoardArticle(HashMap<String, Object> valueMap) {
		return sqlSession.selectOne("Meeting.getPartyBoardArticle", valueMap);
	}

	public int meetingUpdate(MeetingUpdate mu) {
		
		return sqlSession.update("Meeting.meetingUpdate", mu);
	}

	public Meeting getMeetingOne(int meeting_no) {
	
		return sqlSession.selectOne("Meeting.getMeetingOne", meeting_no);
	}

	public int meetingDelete(int meeting_no) {
		
		return sqlSession.delete("Meeting.meetingDelete", meeting_no);
	}

	public int meetingPermit(MeetingPermit mp) {
		
		return sqlSession.insert("Meeting.meetingPermit", mp);
	}
	
	// 모임 게시글 한개 가져오기
	public MeetingBoardModify getMeetingBoard(int meeting_board_no) {
		return sqlSession.selectOne("Meeting.getMeetingBoard", meeting_board_no);
	}

	public int meetingBoardModify(MeetingBoardModify meetingBoardModify) {
		return sqlSession.update("Meeting.meetingBoardModify", meetingBoardModify);
		
	}

	/*
	 * public void modifyFile(Map<String, Object> map) {
	 * sqlSession.update("File.modifyFile", map); }
	 */
	public int fileCheck(int idx) {
		
		return sqlSession.selectOne("File.fileCheck", idx);
	}

	// 모임 내 게시글 기존 파일 삭제
	public void deleteFile(int idx) {
		sqlSession.delete("File.deleteFile", idx);
		
	}

	public int meetingBoardDelete(int meeting_board_no) {
		return sqlSession.delete("Meeting.meetingBoardDelete", meeting_board_no);
	}

	public List<MeetingPermitList> meetingPermitList(int meeting_no) {
		return sqlSession.selectList("Meeting.meetingPermitList", meeting_no);
	}

	public int meetingPermitYes(int meeting_no, int userNo) {
		return sqlSession.update("Meeting.meetingPermitYes",meeting_no );
	}
}
