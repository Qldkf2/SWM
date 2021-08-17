package com.ez.swm.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.swm.admin.dao.AdminDao;
import com.ez.swm.admin.vo.AdminVo;
import com.ez.swm.admin.vo.StudycafeWrite;
import com.ez.swm.common.FileUtils;
import com.ez.swm.login.vo.Member;
import com.ez.swm.myPage.vo.AskComment;
import com.ez.swm.myPage.vo.AskJoin;

@Service
public class AdminService {

	@Autowired
	AdminDao adminDao;
	
	@Autowired
	private FileUtils fileUtils;
	
	public int studycafeWrite(StudycafeWrite studycafeWrite,MultipartHttpServletRequest request) throws Exception {
		int studycafe_no = adminDao.studycafeWrite(studycafeWrite,request);
			studycafeWrite.setStudycafe_no(studycafe_no);
		
		List<Map<String,Object>> files = fileUtils.parseInsertFileInfo(studycafeWrite, request);
		System.out.println("카페 파일들 오냐 ? " + files);
		int size = files.size();
		for(int i=0; i<size; i++) {
			adminDao.insertFile(files.get(i));
	}
		return studycafe_no;
	}
	
	public List<AskJoin> askAllList() {
		return adminDao.askAllList();
	}
	
	public AskComment getAskReply(int ask_no) {
		return adminDao.getAskReply(ask_no);
	}
	
	public int insertAskReply(AskComment comment) {
		return adminDao.insertAskReply(comment);
	}
	
	//맴버 리스트
		public List<Member> adminMemberList(){
			return adminDao.adminMemberList();
		}
		//맴버 상세보기
		public Member adminMemberDetail(int userNo) {
			return adminDao.adminMemberDetail(userNo);
		}
		//맴버 강퇴하기
		public int adminMemberDelete(int userNo) {
			return adminDao.adminMemberDelete(userNo);
			
		}
		//맴버 상세페이지
		public int updateMemberByadmin(Member member) {
			return adminDao.updateMemberByadmin(member);
		}
		
		//미팅 리스트
		public List<AdminVo> selectAdminMeeting() {
			return adminDao.selectAdminMeeting();

		}
		//미팅 상세보기
		public AdminVo adminMeetingDetail(int meeting_no) {
			return adminDao.detailAdminMeeting(meeting_no);
		}
		//프리 보드 리스트
		public List<AdminVo> freeBoardList() {
			return adminDao.FreeBoardList();
		}
		//프리 보드 상세페이지
		public AdminVo adminFreeDetail(int free_no) {
			return adminDao.adminFreeDetail(free_no);
		}
		//스터디카페 리스트
		public List<AdminVo> adminstudycafelist() {
			return adminDao.adminstudycafelist();
		}
		public AdminVo studycafedetail(int studycafe_no) {
			return adminDao.studycafedetail(studycafe_no);
		}
		//스터디카페 삭제
		public int studycafedelete(int studycafe_no) {
			return adminDao.studycafedelete(studycafe_no);
		}
		//미팅 삭제
		public int meetingdelete(int meeting_no) {
			return adminDao.meetingdelete(meeting_no);
		}
}
