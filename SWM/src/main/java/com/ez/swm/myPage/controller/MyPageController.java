package com.ez.swm.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	// ���������� �̵�
	@RequestMapping(value="/myPage")
	public String myPage() {
		
		return "myPage/myPage";
	}
	
	// ȸ�� ���� ����
	@RequestMapping(value="/myPage/memberModify")
	public String memberModify() {
		
		return "myPage/memberModify";
	}
	
	// ȸ�� Ż��
	@RequestMapping(value="/myPage/memberOut")
	public String memberOut() {
		
		return "myPage/memberOut";
	}
	
	// ���� ���� ���͵�
	@RequestMapping(value="/myPage/myCreateStudy")
	public String myCreateStudy() {
		
		return "myPage/myCreateStudy";
	}
	
	// ���� ������ ���͵�
	@RequestMapping(value="/myPage/myJoinStudy")
	public String myJoinStudy() {
		
		return "myPage/myJoinStudy";
	}
	
	// ���͵� ���ӿ��� ���� �� �Խñ�
	@RequestMapping(value="/myPage/myMeetingBoard")
	public String myMeetingBoard() {
		
		return "myPage/myMeetingBoard";
	}
	
	// ���͵� ���ӿ��� ���� �� ��� 
	@RequestMapping(value="/myPage/myMeetingBoardComment")
	public String myMeetingBoardComment() {
		
		return "myPage/myMeetingBoardComment";
	}
	

	// ���� �� �����Խ��� �Խñ�
	@RequestMapping(value="/myPage/myCommunityList")
	public String myCommunityList() {
		
		return "myPage/myCommunityBoardList";
	}
	
	// ���� ��� �� �� Ȯ��
	@RequestMapping(value="/myPage/myCommunityCommentList")
	public String myCommunityCommentList() {
		
		return "/myPage/myCommunityCommentList";
	}
	
	// ���� Ȯ��
	@RequestMapping(value="/myPage/myBookList")
	public String myBookList() {
		
		return "/myPage/myBookList";
	}

	// 1:1 ���� �ϱ�
	@RequestMapping(value="/myPage/askWrite")
	public String askWrite() {
		
		return "/myPage/askWrite";
	}
	
	// ���� �� 1:1 ���� 
	@RequestMapping(value="/myPage/myAskList")
	public String myAskList() {
		
		return "/myPage/myAskList";
	}
	
	// ���� �� 1:1 ���� �󼼺���
	@RequestMapping(value="/myPage/myAskDetail")
	public String myAskDetail() {
		
		return "/myPage/myAskDetail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
