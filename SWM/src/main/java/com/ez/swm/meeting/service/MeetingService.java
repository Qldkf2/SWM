package com.ez.swm.meeting.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.swm.common.FileUtils;
import com.ez.swm.common.paging.PagingVO;
import com.ez.swm.meeting.dao.MeetingDao;
import com.ez.swm.meeting.vo.CommentCount;
import com.ez.swm.meeting.vo.LeaderPermit;
import com.ez.swm.meeting.vo.Location;
import com.ez.swm.meeting.vo.Meeting;
import com.ez.swm.meeting.vo.MeetingBoard;
import com.ez.swm.meeting.vo.MeetingBoardComment;
import com.ez.swm.meeting.vo.MeetingBoardFile;
import com.ez.swm.meeting.vo.MeetingBoardModify;
import com.ez.swm.meeting.vo.MeetingDetail;
import com.ez.swm.meeting.vo.MeetingList;
import com.ez.swm.meeting.vo.MeetingPermit;
import com.ez.swm.meeting.vo.MeetingPermitList;
import com.ez.swm.meeting.vo.MeetingPermitYes;
import com.ez.swm.meeting.vo.MeetingUpdate;
import com.ez.swm.meeting.vo.MeetingWrite;


@Service
public class MeetingService {
	
	@Autowired
	MeetingDao meetingDao;
	
	@Autowired
	private FileUtils fileUtils;
	
	private HashMap<String, Object> valueMap;

	public boolean meetingWriteForm(MeetingWrite meetingWrite, int userNo) {
		meetingDao.meetingWriteForm(meetingWrite) ;
		int meeting_no = meetingDao.getMeetingNo(); 
		LeaderPermit lp = new LeaderPermit();
		lp.setMeeting_no(meeting_no);
		lp.setUserNo(userNo);
		return meetingDao.meetingLeaderPermit(lp) >0;
	}

	public List<MeetingList> getMeetingList(PagingVO vo) {
			
		return meetingDao.getMeetingList(vo);
	}

	public MeetingDetail getMeetingArticle(int meeting_no) {

		return meetingDao.getMeetingArticle(meeting_no);
	}

	public List<MeetingBoard> getMeetingBoardList(int meeting_no, int start, int end) {
	
		valueMap=new HashMap<String, Object>();

		valueMap.put("meeting_no", meeting_no);
		valueMap.put("start", start);
		valueMap.put("end", end);
			
		return meetingDao.getMeetingBoardList(valueMap);
	}
	
	// ���� �� �Խñ� ����� 
	public int insertPartyBoardArticle(MeetingBoard meetingBoard, MultipartHttpServletRequest request) 
		throws Exception {
		int meeting_board_no = meetingDao.insertPartyBoardArticle(meetingBoard);	

		meetingBoard.setMeeting_board_no(meeting_board_no);
		
		List<Map<String,Object>> files = fileUtils.parseInsertFileInfo(meetingBoard, request);
		/* System.out.println("�� ���� �� ����  :? " + files); */
			int size = files.size();
			for(int i=0; i<size; i++) {
				meetingDao.insertFile(files.get(i));
			
		}
		
			
		return meeting_board_no;
	}
	
	public List<MeetingBoardFile> getFileList(int party_no) throws Exception {
		
		return meetingDao.getFileList(party_no);
	}
	
	// ���� �� �Խñۿ��� ���� ����Ʈ �޾ƿö� ��
	public MeetingBoardFile getFileList2(int meeting_board_no) throws Exception {
		
		return meetingDao.getFileList2(meeting_board_no);
	}
	
	
	public MeetingBoard getPartyBoardArticle(int meeting_no, int party_no) {
		valueMap=new HashMap<String, Object>();
		valueMap.put("MEETING_NO", meeting_no);
		valueMap.put("MEETING_BOARD_NO", party_no);
		
		meetingDao.meetingBoardHitcount(party_no);
		return meetingDao.getPartyBoardArticle(valueMap);
	}

	public List<MeetingBoardComment> getPartyBoardComment(int party_no) throws Exception{
		return meetingDao.getPartyBoardComment(party_no);
	}

	public int meetingUpdate(MeetingUpdate mu) {
		
		return meetingDao.meetingUpdate(mu);
	}
	
	// ���� �Ѱ� ��������
	public Meeting getMeetingOne(int meeting_no) {
		
		return meetingDao.getMeetingOne(meeting_no);
	}

	public int meetingDelete(int meeting_no) {
	
		return meetingDao.meetingDelete(meeting_no);
	}
	// ���� �����ϱ�
	public int meetingPermit(MeetingPermit mp) {
		
		return meetingDao.meetingPermit(mp);
	}
	
	// ���� �Խñ� �ϳ� ��������
	public MeetingBoardModify getMeetingBoard(int meeting_board_no) {
		
		return meetingDao.getMeetingBoard(meeting_board_no);
	}

	public int meetingBoardModify(MeetingBoardModify meetingBoardModify , MultipartHttpServletRequest request, int idx) throws Exception {
		int result = meetingDao.meetingBoardModify(meetingBoardModify);
		List<Map<String,Object>> files = fileUtils.parseUpdateFileInfo(meetingBoardModify, request);
		 System.out.println("�� ���� �� ����2 :? " + files);
		 	
		 	int fileCheck = meetingDao.fileCheck(idx);
		 	System.out.println("fileCheck Ȯ�� : " + fileCheck);
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
	
	// ���� �� �Խñ� �����ϱ�
	public int meetingBoardDelete(int meeting_board_no) {
		return meetingDao.meetingBoardDelete(meeting_board_no);
	}
	
	// ���� �� ���Խ�û �ѻ���� ����Ʈ �ҷ�����
	public List<MeetingPermitList> meetingPermitList(int meeting_no) {
		return meetingDao.meetingPermitList(meeting_no);
	}

	public int meetingPermitYes(MeetingPermitYes mp) {
		return meetingDao.meetingPermitYes(mp);
	}

	public int meetingPermitNo(MeetingPermitYes mp) {
		return meetingDao.meetingPermitNo(mp);
		
	}
	
	public List<Object> permitCheck(MeetingPermitYes mp) {
		return meetingDao.permitCheck(mp);
	}
	
	//�ٿ�����
	//�о� keyword db���尪���� ��ȯ
		private String subject(String keyword) {
			//��ü�˻���
			if(keyword.equals("all")) {
				return null;
			}
			if(keyword.equals("language")) {	
				
				return "����";
			}
			if(keyword.equals("employment")) {	

				return "���";
			}
			if(keyword.equals("official")) {	

				return "���";
			}
			if(keyword.equals("hobby")) {	
				
				return "���";
			}
			if(keyword.equals("programming")) {	
				
				return "���α׷���";
			}
			if(keyword.equals("etc")) {	
				
				return "��Ÿ";
			}

			return keyword;
		}
	
		// �� meeting or �о߼��� �� �� ���� ��������	
		public int countMeeting(String keyword) {
			
			valueMap=new HashMap<String, Object>();
			
			if(keyword!=null) {
				keyword=subject(keyword);
			}
			
			valueMap.put("keyword", keyword);
			
				return meetingDao.countMeeting(valueMap);

		}
		// �˻� ���  �� ���� ��������	
		public int countMeetingSearch(String keyword) {
			
			valueMap=new HashMap<String, Object>();
					
			valueMap.put("keyword", keyword);
			
			return meetingDao.countMeetingSearch(valueMap);
			
		}
		
		//���ӰԽ��� �˻���� �� ���� ��������
		public int countMeetingBoardSearch(int meeting_no, String keyword) {
			
			valueMap=new HashMap<String, Object>();

			valueMap.put("meeting_no", meeting_no);
			valueMap.put("keyword", keyword);
			
			return meetingDao.countMeetingBoardSearch(valueMap);
		}
	
	
		//���ӰԽ��� ��ü�ۼ�
		public int countMeetingBoard(int meeting_no){
			return meetingDao.countMeetingBoard(meeting_no);

			
		}
	
		public List<CommentCount> countMeetingboardComment(int meeting_no) {
			
			return meetingDao.countMeetingboardComment(meeting_no);
			
		}
	
		//��۾���
		public void insertPartyBoardComment(MeetingBoardComment meetingBoardComment) {
			int refno= meetingBoardComment.getMeeting_board_comment_refno();
			
			//�θ��� �ڽĴ�� ��û�� ���� level ó��
			if(refno == 0) {
				meetingBoardComment.setMeeting_board_comment_level(1);
			}
			else {
				//�ڽĴ���̸� ������ level �����ͼ� +1���ֱ�
				int lastLevel = meetingDao.getLastLevel(refno);
				meetingBoardComment.setMeeting_board_comment_level(lastLevel+1);
			}
			meetingDao.insertPartyBoardComment(meetingBoardComment);
		}

		//��ۻ���	
		public void deleteComment(int meeting_board_comment_no) {
			meetingDao.deleteComment(meeting_board_comment_no);
		}
		
		//���ӰԽ��� �˻�
		public List<MeetingBoard> searchMeetingBoard(int meeting_no, String keyword, int start, int end){
			
			valueMap=new HashMap<String, Object>();
			valueMap.put("meeting_no", meeting_no);
			valueMap.put("keyword", keyword);
			valueMap.put("start", start);
			valueMap.put("end", end);
			
			
			return meetingDao.searchMeetingBoard(valueMap);
		}
		
		//�����Խ��� �˻�
		public List<MeetingList> searchMeeting(String keyword, int start, int end){
			valueMap=new HashMap<String, Object>();
		
			keyword=subject(keyword);
			valueMap.put("keyword", keyword);
			valueMap.put("start", start);
			valueMap.put("end", end);
			
			return meetingDao.searchMeeting(valueMap);
		}

		
		//�о߼���
		
		public List<MeetingList> selectSubject(String keyword, int start, int end){
			valueMap=new HashMap<String, Object>();
			
			keyword=subject(keyword);
			valueMap.put("keyword", keyword);
			valueMap.put("start", start);
			valueMap.put("end", end);
			
			return meetingDao.selectSubject(valueMap);
		}
		
		//��������Ʈ
		public List<Location> locationList(String location){
			valueMap=new HashMap<String, Object>();
			valueMap.put("location",location);
			return meetingDao.locationList(valueMap);
			
			
		}
		// ���ÿ��� ���� �ο� ���ϱ�
		public int totalMember(int meeting_no) {
			return meetingDao.totalMember(meeting_no);
		}

		public void meetingHit(int meeting_no) {
			meetingDao.meetingHit(meeting_no);
			
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
	
