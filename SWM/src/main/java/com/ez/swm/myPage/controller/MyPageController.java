package com.ez.swm.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	// 마이페이지 이동
	@RequestMapping(value="/myPage")
	public String myPage() {
		
		return "myPage/myPage";
	}
	
	// 회원 정보 수정
	@RequestMapping(value="/myPage/memberModify")
	public String memberModify() {
		
		return "myPage/memberModify";
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/myPage/memberOut")
	public String memberOut() {
		
		return "myPage/memberOut";
	}
	
	// 내가 만든 스터디
	@RequestMapping(value="/myPage/myCreateStudy")
	public String myCreateStudy() {
		
		return "myPage/myCreateStudy";
	}
	
	// 내가 가입한 스터디
	@RequestMapping(value="/myPage/myJoinStudy")
	public String myJoinStudy() {
		
		return "myPage/myJoinStudy";
	}
	
	// 스터디 모임에서 내가 쓴 게시글
	@RequestMapping(value="/myPage/myMeetingBoard")
	public String myMeetingBoard() {
		
		return "myPage/myMeetingBoard";
	}
	
	// 스터디 모임에서 내가 쓴 댓글 
	@RequestMapping(value="/myPage/myMeetingBoardComment")
	public String myMeetingBoardComment() {
		
		return "myPage/myMeetingBoardComment";
	}
	

	// 내가 쓴 자유게시판 게시글
	@RequestMapping(value="/myPage/myCommunityList")
	public String myCommunityList() {
		
		return "myPage/myCommunityBoardList";
	}
	
	// 내가 댓글 단 글 확인
	@RequestMapping(value="/myPage/myCommunityCommentList")
	public String myCommunityCommentList() {
		
		return "/myPage/myCommunityCommentList";
	}
	
	// 예약 확인
	@RequestMapping(value="/myPage/myBookList")
	public String myBookList() {
		
		return "/myPage/myBookList";
	}

	// 1:1 문의 하기
	@RequestMapping(value="/myPage/askWrite")
	public String askWrite() {
		
		return "/myPage/askWrite";
	}
	
	// 내가 쓴 1:1 문의 
	@RequestMapping(value="/myPage/myAskList")
	public String myAskList() {
		
		return "/myPage/myAskList";
	}
	
	// 내가 쓴 1:1 문의 상세보기
	@RequestMapping(value="/myPage/myAskDetail")
	public String myAskDetail() {
		
		return "/myPage/myAskDetail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
