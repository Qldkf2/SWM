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
		System.out.println("ī�� ���ϵ� ���� ? " + files);
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
	
	//�ɹ� ����Ʈ
		public List<Member> adminMemberList(){
			return adminDao.adminMemberList();
		}
		//�ɹ� �󼼺���
		public Member adminMemberDetail(int userNo) {
			return adminDao.adminMemberDetail(userNo);
		}
		//�ɹ� �����ϱ�
		public int adminMemberDelete(int userNo) {
			return adminDao.adminMemberDelete(userNo);
			
		}
		//�ɹ� ��������
		public int updateMemberByadmin(Member member) {
			return adminDao.updateMemberByadmin(member);
		}
		
		//���� ����Ʈ
		public List<AdminVo> selectAdminMeeting() {
			return adminDao.selectAdminMeeting();

		}
		//���� �󼼺���
		public AdminVo adminMeetingDetail(int meeting_no) {
			return adminDao.detailAdminMeeting(meeting_no);
		}
		//���� ���� ����Ʈ
		public List<AdminVo> freeBoardList() {
			return adminDao.FreeBoardList();
		}
		//���� ���� ��������
		public AdminVo adminFreeDetail(int free_no) {
			return adminDao.adminFreeDetail(free_no);
		}
		//���͵�ī�� ����Ʈ
		public List<AdminVo> adminstudycafelist() {
			return adminDao.adminstudycafelist();
		}
		public AdminVo studycafedetail(int studycafe_no) {
			return adminDao.studycafedetail(studycafe_no);
		}
		//���͵�ī�� ����
		public int studycafedelete(int studycafe_no) {
			return adminDao.studycafedelete(studycafe_no);
		}
		//���� ����
		public int meetingdelete(int meeting_no) {
			return adminDao.meetingdelete(meeting_no);
		}
}
