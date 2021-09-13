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
	
	// ���������� �̵�
	@RequestMapping(value="/myPage")
	public String myPage() {
		
		return "myPage/myPage";
	}
	
	// ȸ�� ���� ���� ������ �̵�
	@RequestMapping(value="/myPage/memberModify", method=RequestMethod.GET)
	public String memberModify() {
		
		return "myPage/memberModify";
	}
	
	// ȸ�� ���� ���� (�����)
	@RequestMapping(value="/myPage/memberModify", method=RequestMethod.POST)
	public String memberModifyByUser(Member member, @RequestParam("userNo") int userNo, Model model) {
		
		int updateResult = myPageService.updateMemberByUser(member);
		
		if(updateResult == 1) {
			
			return "redirect: /myPage";
		}
		
		return "/myPage/memberModify";
		
	}
	
	// ȸ�� Ż�� ������ �̵�
	@RequestMapping(value="/myPage/memberOut", method=RequestMethod.GET)
	public String memberOut() {
		
		return "myPage/memberOut";
	}
	
	// ȸ�� Ż��
	@RequestMapping(value="/myPage/memberOut", method=RequestMethod.POST)
	public String memberOut(Member member, Model model, HttpSession session) {
		
		
		int outResult = myPageService.deleteMember(member);
		
		if(outResult == 1) {
			
			session.invalidate();
			return "redirect: /";
			
			}
		
			String msg = "�Էµ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�";
			String loc = "/myPage/memberOut";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			return "common/msg";
		}
	
	// ���� ���� ���͵�
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
	
	// ���� ������ ���͵�
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
	
	// ���͵� ���ӿ��� ���� �� �Խñ�
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
	@RequestMapping(value="/myPage/myBookList", method=RequestMethod.GET)
	public String myBookList(@RequestParam("userNo") int userNo,Model model) {
		
		List<UserBookVo> bookResult = myPageService.getBookInfoList(userNo);
		
		
		model.addAttribute("bookList", bookResult);
		
		return "/myPage/myBookList";
	}

	
	
	
	// 1:1 ���� �ϱ� ������ �̵�
	@RequestMapping(value="/myPage/askWrite", method=RequestMethod.GET)
	public String askWrite() {
		
		return "/myPage/askWrite";
	}
	
	// 1:1 ���� �ϱ�
	@RequestMapping(value="/myPage/askWrite", method=RequestMethod.POST)
	public String askWrite(Ask ask, Model model) {
		
		int askResult = myPageService.insertAsk(ask);
		System.out.println(askResult);
		if(askResult == 1) {
			
			return "redirect: /myPage";
		}
		
		return "/myPage/askWrite";
		
	}
	
	// 1:1 ���� ����Ʈ �̵� ( ����� ������ȣ�� �ĺ� )
	@RequestMapping(value="/myPage/myAskList", method=RequestMethod.GET)
	public String myAskList(@RequestParam("id") int userNo, Model model) {
		
		
		List<AskJoin> askList = myPageService.getAskByUserNo(userNo);
		model.addAttribute("askList", askList);
		
		return "/myPage/myAskList";
	}
	
	// ���� �� 1:1 ���� �󼼺���
	@RequestMapping(value="/myPage/myAskDetail",method=RequestMethod.GET)
	public String myAskDetail(@RequestParam("ask_no") int askNo, Ask ask, Model model, AskComment comment) {
		
		Ask askDetail = myPageService.askDetail(askNo);
		model.addAttribute("detail", askDetail);
		
		AskComment replyResult = adminService.getAskReply(askNo);
		System.out.println(replyResult);
		model.addAttribute("adminReply",replyResult);
		
		return "/myPage/myAskDetail";
	}
	
	//���� �Ϸ�Ǹ� �����Ϸ�� �ٲ�	
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
