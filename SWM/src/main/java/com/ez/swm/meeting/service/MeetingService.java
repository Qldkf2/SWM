package com.ez.swm.meeting.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.swm.common.FileUtils;
import com.ez.swm.meeting.dao.MeetingDao;
import com.ez.swm.meeting.vo.MeetingBoard;
import com.ez.swm.meeting.vo.MeetingBoardComment;
import com.ez.swm.meeting.vo.MeetingBoardFile;
import com.ez.swm.meeting.vo.MeetingDetail;
import com.ez.swm.meeting.vo.MeetingList;
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
	
	
	public MeetingBoard getPartyBoardArticle(int meeting_no, int party_no) {
		valueMap=new HashMap<String, Object>();
		valueMap.put("MEETING_NO", meeting_no);
		valueMap.put("MEETING_BOARD_NO", party_no);
		
		return meetingDao.getPartyBoardArticle(valueMap);
	}

	public List<MeetingBoardComment> getPartyBoardComment(int party_no) throws Exception{
		return meetingDao.getPartyBoardComment(party_no);
	}




}
