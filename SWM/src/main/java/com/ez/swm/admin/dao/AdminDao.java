package com.ez.swm.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.swm.admin.vo.AdminVo;
import com.ez.swm.admin.vo.StudycafeWrite;
import com.ez.swm.login.vo.Member;
import com.ez.swm.myPage.vo.AskComment;
import com.ez.swm.myPage.vo.AskJoin;

@Repository
public class AdminDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int studycafeWrite(StudycafeWrite studycafeWrite,MultipartHttpServletRequest request) {
		 sqlSession.insert("Studycafe.studycafeWrite", studycafeWrite);
		 return sqlSession.selectOne("Studycafe.getStudycafe_no"); 
	}

	public void insertFile(Map<String, Object> valueMap) {
		sqlSession.insert("File.studycafeFileInsert",valueMap);
	}
	
	public List<AskJoin> askAllList() {
		return sqlSession.selectList("admin.askAllList");
	}
	
	public AskComment getAskReply(int ask_no) {
		return sqlSession.selectOne("admin.getAskReply", ask_no);
	}
	
	public int insertAskReply(AskComment comment) {
		return sqlSession.insert("admin.insertAskReply", comment);
	}
	
	public List<Member> adminMemberList() {
		return sqlSession.selectList("admin.selectMemberList");
	}
	
	public Member adminMemberDetail(int userNo) {
		return sqlSession.selectOne("admin.selectOneMember", userNo);
	}

	public int adminMemberDelete(int userNo) {
		return sqlSession.update("admin.adminMemberDelete", userNo);
	}

	public int updateMemberByadmin(Member member) {
		return sqlSession.update("admin.updateMemberByadmin", member);
	}

	public List<AdminVo> selectAdminMeeting() {
		return sqlSession.selectList("admin.selectAdminMeeting");
	}

	public AdminVo detailAdminMeeting(int meeting_no) {
		return sqlSession.selectOne("admin.detailAdminMeeting", meeting_no);
	}

	public List<AdminVo> FreeBoardList() {
		return sqlSession.selectList("admin.FreeBoardList");
	}

	public AdminVo adminFreeDetail(int free_no) {
		return sqlSession.selectOne("admin.FreeBoardDetail", free_no);
	}

	public List<AdminVo> adminstudycafelist() {
		return sqlSession.selectList("admin.adminstudycafelist");
	}

	public AdminVo studycafedetail(int studycafe_no) {
		return sqlSession.selectOne("admin.studycafedetail");
	}

	public int studycafedelete(int studycafe_no) {
		return sqlSession.update("admin.studycafedelete", studycafe_no);
	}

	public int meetingdelete(int meeting_no) {
		return sqlSession.update("admin.meetingdelete", meeting_no);
	}


}
