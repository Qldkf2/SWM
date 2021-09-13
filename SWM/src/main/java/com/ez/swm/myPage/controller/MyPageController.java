package com.ez.swm.myPage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.admin.service.AdminService;
import com.ez.swm.book.vo.UserBookVo;
import com.ez.swm.login.vo.Member;
import com.ez.swm.meeting.service.MeetingService;
import com.ez.swm.meeting.vo.CommentCount;
import com.ez.swm.meeting.vo.Meeting;
import com.ez.swm.myPage.service.MyPageService;
import com.ez.swm.myPage.vo.Ask;
import com.ez.swm.myPage.vo.AskComment;
import com.ez.swm.myPage.vo.AskJoin;
import com.ez.swm.myPage.vo.MyStudyBoard;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;
	
	@Autowired
	MeetingService meetingService;
	
	@Autowired
	AdminService adminService;
	
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
	public ModelAndView myCreateStudy(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = new Member();
		HttpSession session = request.getSession();
		m = (Member)session.getAttribute("member");
		int userNo = m.getUserNo();
		
		List<Meeting> list = myPageService.myCreateStudy(userNo);
		mav.addObject("myCreateStudy", list);
		mav.setViewName("myPage/myCreateStudy");
		return mav;
	}
	
	// 내가 가입한 스터디
	@RequestMapping(value="/myPage/myJoinStudy")
	public ModelAndView myJoinStudy(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = new Member();
		HttpSession session = request.getSession();
		m = (Member)session.getAttribute("member");
		int userNo = m.getUserNo();
		
		List<Meeting> list = myPageService.myJoinStudy(userNo);
		mav.addObject("myJoinStudy", list);
		mav.setViewName("myPage/myJoinStudy");
		return mav;
	}
	
	// 스터디 모임에서 내가 쓴 게시글
	@RequestMapping(value="/myPage/myMeetingBoard", method=RequestMethod.GET)
	public String myMeetingBoard(@RequestParam("userNo") int userNo, Model model) {
		
		List<MyStudyBoard> studyBoardList = myPageService.myStudyBoard(userNo);	
		model.addAttribute("SBList", studyBoardList);
		
		/*
		 * List<CommentCount> commentCount =
		 * meetingService.countMeetingboardComment(meeting_no);
		 * model.addAttribute("commentCount", commentCount);
		 */
		
		return "myPage/myMeetingBoard";
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
		System.out.println(askResult);
		if(askResult == 1) {
			
			return "redirect: /myPage";
		}
		
		return "/myPage/askWrite";
		
	}
	
	// 1:1 문의 리스트 이동 ( 사용자 유저번호로 식별 )
	@RequestMapping(value="/myPage/myAskList", method=RequestMethod.GET)
	public String myAskList(@RequestParam("id") int userNo, Model model) {
		
		
		List<AskJoin> askList = myPageService.getAskByUserNo(userNo);
		model.addAttribute("askList", askList);
		
		return "/myPage/myAskList";
	}
	
	// 내가 쓴 1:1 문의 상세보기
	@RequestMapping(value="/myPage/myAskDetail",method=RequestMethod.GET)
	public String myAskDetail(@RequestParam("ask_no") int askNo, Ask ask, Model model, AskComment comment) {
		
		Ask askDetail = myPageService.askDetail(askNo);
		model.addAttribute("detail", askDetail);
		
		AskComment replyResult = adminService.getAskReply(askNo);
		System.out.println(replyResult);
		model.addAttribute("adminReply",replyResult);
		
		return "/myPage/myAskDetail";
	}
	
	//결제 완료되면 결제완료로 바꿈	
	@RequestMapping(value="/myPage/payStatus")
	@ResponseBody
	public void payStatus(@RequestParam(value="book_no", required = false) int book_no,
			@RequestParam(value="status", required = false ) String status) {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		resultMap.put("book_no",book_no);
		resultMap.put("status", status);
		
		int result = myPageService.payStatus(resultMap);
		
		
	}
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
}
