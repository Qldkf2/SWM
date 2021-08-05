package com.ez.swm.meeting.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.swm.common.FileUtils;
import com.ez.swm.meeting.dao.MeetingDao;
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


@Service
public class MeetingService {
	
	@Autowired
	MeetingDao meetingDao;
	
	@Autowired
	private FileUtils fileUtils;
	
	private HashMap<String, Object> valueMap;

	public boolean meetingWriteForm(MeetingWrite meetingWrite) {
		return meetingDao.meetingWriteForm(meetingWrite) > 0;
	}

	public List<MeetingList> getMeetingList() {
			
		return meetingDao.getMeetingList();
	}

	public MeetingDetail getMeetingArticle(int meeting_no) {

		return meetingDao.getMeetingArticle(meeting_no);
	}

	public List<MeetingBoard> getMeetingBoardList(int meeting_no) {
	
		return meetingDao.getMeetingBoardList(meeting_no);
	}

	public int insertPartyBoardArticle(MeetingBoard meetingBoard, MultipartHttpServletRequest request) 
		throws Exception {
		int meeting_board_no = meetingDao.insertPartyBoardArticle(meetingBoard);	

		meetingBoard.setMeeting_board_no(meeting_board_no);
		
		List<Map<String,Object>> files = fileUtils.parseInsertFileInfo(meetingBoard, request);
		 System.out.println("야 파일 너 오냐  :? " + files);
		
			int size = files.size();
			for(int i=0; i<size; i++) {
				meetingDao.insertFile(files.get(i));
			
		}
		
			
		return meeting_board_no;
	}
	
	public List<MeetingBoardFile> getFileList(int party_no) throws Exception {
		
		return meetingDao.getFileList(party_no);
	}
	
	// 모임 내 게시글에서 파일 리스트 받아올때 씀
	public MeetingBoardFile getFileList2(int meeting_board_no) throws Exception {
		
		return meetingDao.getFileList2(meeting_board_no);
	}
	
	
	public MeetingBoard getPartyBoardArticle(int meeting_no, int party_no) {
		valueMap=new HashMap<String, Object>();
		valueMap.put("MEETING_NO", meeting_no);
		valueMap.put("MEETING_BOARD_NO", party_no);
		
		return meetingDao.getPartyBoardArticle(valueMap);
	}

	public List<MeetingBoardComment> getPartyBoardComment(int party_no) throws Exception{
		return meetingDao.getPartyBoardComment(party_no);
	}

	public int meetingUpdate(MeetingUpdate mu) {
		
		return meetingDao.meetingUpdate(mu);
	}
	
	// 모임 한개 가져오기
	public Meeting getMeetingOne(int meeting_no) {
		
		return meetingDao.getMeetingOne(meeting_no);
	}

	public int meetingDelete(int meeting_no) {
	
		return meetingDao.meetingDelete(meeting_no);
	}
	// 모임 가입하기
	public int meetingPermit(MeetingPermit mp) {
		
		return meetingDao.meetingPermit(mp);
	}
	
	// 모임 게시글 하나 가져오기
	public MeetingBoardModify getMeetingBoard(int meeting_board_no) {
		
		return meetingDao.getMeetingBoard(meeting_board_no);
	}

	public int meetingBoardModify(MeetingBoardModify meetingBoardModify , MultipartHttpServletRequest request, int idx) throws Exception {
		int result = meetingDao.meetingBoardModify(meetingBoardModify);
		List<Map<String,Object>> files = fileUtils.parseUpdateFileInfo(meetingBoardModify, request);
		 System.out.println("야 파일 너 오냐2 :? " + files);
		 	
		 	int fileCheck = meetingDao.fileCheck(idx);
		 	System.out.println("fileCheck 확인 : " + fileCheck);
		 	if(fileCheck == 0) {
				int size = files.size();
				for(int i=0; i<size; i++) {
					meetingDao.insertFile(files.get(i));
				}
		 	}else {
		 		int size = files.size();
		 			meetingDao.deleteFile(idx);
				for(int i=0; i<size; i++) {			
					meetingDao.insertFile(files.get(i));	
				 }
		 	}
		 	
			return result;

	
	}
	
	// 모임 내 게시글 삭제하기
	public int meetingBoardDelete(int meeting_board_no) {
		return meetingDao.meetingBoardDelete(meeting_board_no);
	}
	
	// 모임 내 가입신청 한사람들 리스트 불러오기
	public List<MeetingPermitList> meetingPermitList(int meeting_no) {
		return meetingDao.meetingPermitList(meeting_no);
	}

	public void meetingPermitYes(int meeting_no, int userNo) {
		return meetingDao.meetingPermitYes(meeting_no,userNo);
	}

}
	
