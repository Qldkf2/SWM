package com.ez.swm.myPage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.swm.book.vo.UserBookVo;
import com.ez.swm.login.vo.Member;
import com.ez.swm.meeting.service.MeetingService;
import com.ez.swm.myPage.service.MyPageService;
import com.ez.swm.myPage.vo.Ask;
import com.ez.swm.myPage.vo.AskComment;
import com.ez.swm.myPage.vo.AskJoin;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;
	
	@Autowired
	MeetingService meetingService;
	
	// 마이페이지 이동
	@RequestMapping(value="/myPage")
	public String myPage() {
		
		return "myPage/myPage";
	}
	
	// 회원 정보 수정 페이지 이동
	@RequestMapping(value="/myPage/memberModify", method=RequestMethod.GET)
	public String memberModify() {
		
		return "myPage/memberModify";
	}
	
	// 회원 정보 수정 (사용자)
	@RequestMapping(value="/myPage/memberModify", method=RequestMethod.POST)
	public String memberModifyByUser(Member member, @RequestParam("userNo") int userNo, Model model) {
		
		int updateResult = myPageService.updateMemberByUser(member);
		
		if(updateResult == 1) {
			
			return "redirect: /myPage";
		}
		
		return "/myPage/memberModify";
		
	}
	
	// 회원 탈퇴 페이지 이동
	@RequestMapping(value="/myPage/memberOut", method=RequestMethod.GET)
	public String memberOut() {
		
		return "myPage/memberOut";
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/myPage/memberOut", method=RequestMethod.POST)
	public String memberOut(Member member, Model model, HttpSession session) {
		
		
		int outResult = myPageService.deleteMember(member);
		
		if(outResult == 1) {
			
			session.invalidate();
			return "redirect: /";
			
			}
		
			String msg = "입력된 비밀번호가 일치하지 않습니다";
			String loc = "/myPage/memberOut";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			return "common/msg";
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
	@RequestMapping(value="/myPage/myBookList", method=RequestMethod.GET)
	public String myBookList(@RequestParam("userNo") int userNo,Model model) {
		
		List<UserBookVo> bookResult = myPageService.getBookInfoList(userNo);
		model.addAttribute("bookList", bookResult);
		
		return "/myPage/myBookList";
	}

	
	
	
	// 1:1 문의 하기 페이지 이동
	@RequestMapping(value="/myPage/askWrite", method=RequestMethod.GET)
	public String askWrite() {
		
		return "/myPage/askWrite";
	}
	
	// 1:1 문의 하기
	@RequestMapping(value="/myPage/askWrite", method=RequestMethod.POST)
	public String askWrite(Ask ask, Model model) {
		
		int askResult = myPageService.insertAsk(ask);
		
		if(askResult == 1) {
			
			return "redirect: /myPage";
		}
		
		return "/myPage/askWrite";
		
	}
	
	// 1:1 문의 리스트 이동 ( 사용자 유저번호로 식별 )
	@RequestMapping(value="/myPage/myAskList", method=RequestMethod.GET)
	public String myAskList(@RequestParam("id") int userNo, Model model) {
		
		
		List<AskJoin> askList = myPageService.getAskByUserNo(userNo);
		/*
		 * for(int i=0;i<askList.size();i++) {
		 * System.out.println(askList.get(i).getUserNo()); }
		 */
		model.addAttribute("askList", askList);
		
		return "/myPage/myAskList";
	}
	
	// 내가 쓴 1:1 문의 상세보기
	@RequestMapping(value="/myPage/myAskDetail",method=RequestMethod.GET)
	public String myAskDetail(@RequestParam("ask_no") int askNo, Ask ask, Model model, AskComment comment) {
		
		Ask askDetail = myPageService.askDetail(askNo);
		model.addAttribute("detail", askDetail);
		
		AskComment replyResult = myPageService.getAskReply(askNo);
		System.out.println(replyResult);
		model.addAttribute("adminReply",replyResult);
		
		return "/myPage/myAskDetail";
	}
	
	// 관리자의 1:1 문의 답변 페이지 이동
	@RequestMapping(value="/myPage/adminAskList", method=RequestMethod.GET)
	public String adminAskList(Model model) {
		
		List<AskJoin> allAsk = myPageService.askAllList();
		model.addAttribute("allAsk", allAsk);
		
		return "/myPage/adminAskList";
	}
	
	// 관리자 1:1 문의 상세페이지 - 답변 가능
	@RequestMapping(value="/myPage/askReply", method=RequestMethod.GET)
	public String askReply(@RequestParam("ask_no") int askNo, Ask ask, Model model, AskComment comment) {
		
		Ask askDetail = myPageService.askDetail(askNo);
		model.addAttribute("detail", askDetail);
		
		AskComment replyResult = myPageService.getAskReply(askNo);
		model.addAttribute("adminReply",replyResult);
		
		return "/myPage/askReply";
	}
	
	// 관리자 1:1문의 답변
	@RequestMapping(value="/myPage/askReplyByAdmin", method=RequestMethod.POST)
	public String askReplyByAdmin(AskComment comment, Model model) {
		
		int reply = myPageService.insertAskReply(comment);
		int ask_no = comment.getAsk_no();
		model.addAttribute("ask_no", ask_no);
	
		return "redirect: /myPage/askReply";
	}
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
}
