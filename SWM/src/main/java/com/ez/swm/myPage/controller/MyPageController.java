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
		
		if(askResult == 1) {
			
			return "redirect: /myPage";
		}
		
		return "/myPage/askWrite";
		
	}
	
	// 1:1 ���� ����Ʈ �̵� ( ����� ������ȣ�� �ĺ� )
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
	
	// ���� �� 1:1 ���� �󼼺���
	@RequestMapping(value="/myPage/myAskDetail",method=RequestMethod.GET)
	public String myAskDetail(@RequestParam("ask_no") int askNo, Ask ask, Model model, AskComment comment) {
		
		Ask askDetail = myPageService.askDetail(askNo);
		model.addAttribute("detail", askDetail);
		
		AskComment replyResult = myPageService.getAskReply(askNo);
		System.out.println(replyResult);
		model.addAttribute("adminReply",replyResult);
		
		return "/myPage/myAskDetail";
	}
	
	// �������� 1:1 ���� �亯 ������ �̵�
	@RequestMapping(value="/myPage/adminAskList", method=RequestMethod.GET)
	public String adminAskList(Model model) {
		
		List<AskJoin> allAsk = myPageService.askAllList();
		model.addAttribute("allAsk", allAsk);
		
		return "/myPage/adminAskList";
	}
	
	// ������ 1:1 ���� �������� - �亯 ����
	@RequestMapping(value="/myPage/askReply", method=RequestMethod.GET)
	public String askReply(@RequestParam("ask_no") int askNo, Ask ask, Model model, AskComment comment) {
		
		Ask askDetail = myPageService.askDetail(askNo);
		model.addAttribute("detail", askDetail);
		
		AskComment replyResult = myPageService.getAskReply(askNo);
		model.addAttribute("adminReply",replyResult);
		
		return "/myPage/askReply";
	}
	
	// ������ 1:1���� �亯
	@RequestMapping(value="/myPage/askReplyByAdmin", method=RequestMethod.POST)
	public String askReplyByAdmin(AskComment comment, Model model) {
		
		int reply = myPageService.insertAskReply(comment);
		int ask_no = comment.getAsk_no();
		model.addAttribute("ask_no", ask_no);
	
		return "redirect: /myPage/askReply";
	}
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
}
