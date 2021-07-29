package com.ez.swm.meeting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.login.vo.Member;
import com.ez.swm.meeting.service.MeetingService;
import com.ez.swm.meeting.vo.MeetingBoard;
import com.ez.swm.meeting.vo.MeetingBoardComment;
import com.ez.swm.meeting.vo.MeetingBoardFile;
import com.ez.swm.meeting.vo.MeetingDetail;
import com.ez.swm.meeting.vo.MeetingList;
import com.ez.swm.meeting.vo.MeetingWrite;

@Controller
public class MeetingController {
	
	@Autowired
	MeetingService meetingService;
	
	@RequestMapping(value="/meeting")
	public ModelAndView meeting(HttpServletRequest request, Model model) {
		ModelAndView mv=  new ModelAndView("meeting/meeting");
		
		List<MeetingList> list = meetingService.getMeetingList();
		
		mv.addObject("list", list);

		return mv;
	}
	
	
	@RequestMapping(value="/meeting/meetingWrite")
	public String meetingWrtie() {
		return "meeting/meetingWriteForm";
	}
	
	// 모임 만들기
		@RequestMapping(value="/meeting/meetingWriteForm")
		public String meetingWriteForm2(MeetingWrite meetingWrite, Model model, HttpServletRequest request) {
			System.out.println("모임장 회원번호 : " + meetingWrite.getMeeting_leader());
			boolean result = meetingService.meetingWriteForm(meetingWrite);
			Member m = new Member();
			HttpSession session = request.getSession();
			m = (Member)session.getAttribute("member");
			if(!result) {
				model.addAttribute("msg", "fail");
				return "meeting/meeting"; 
			}
			
			model.addAttribute("member" , m);
			model.addAttribute("meetingWrite", meetingWrite);
			model.addAttribute("msg", "성공");
			
			return "meeting/meeting";
		}
	
	// 모임 상세보기
		@RequestMapping(value="/meeting/meetingDetail")
		public ModelAndView meetingDetail(@RequestParam("meeting_no") int meeting_no) throws Exception {
			ModelAndView mv=  new ModelAndView("meeting/meetingDetail");
			

			MeetingDetail meetingDetail = meetingService.getMeetingArticle(meeting_no);
			mv.addObject("article",meetingDetail);
			return mv;
	}
	
	// 모임 내 게시판
		@RequestMapping(value="/meeting/meetingBoard")
		public ModelAndView meetingBoard(@RequestParam("meeting_no") int meeting_no) throws Exception {
			ModelAndView mv=  new ModelAndView("meeting/meetingBoard");
			
			MeetingDetail article = meetingService.getMeetingArticle(meeting_no);
			List<MeetingBoard> list = meetingService.getMeetingBoardList(meeting_no);

			mv.addObject("list", list);
			mv.addObject("article", article);
			
			return mv;
	}
		
	// 모임 내 게시글 글쓰기 폼
	@RequestMapping(value="/meeting/meetingBoardWrite")
	public ModelAndView meetingBoardWrite(@RequestParam("meeting_no") int meeting_no, HttpServletRequest request) throws Exception {
		ModelAndView mv=  new ModelAndView("/meeting/meetingBoardWrite");
		Member m = new Member();
		HttpSession session = request.getSession();
		m = (Member)session.getAttribute("member");
		MeetingDetail article = meetingService.getMeetingArticle(meeting_no);
			
		mv.addObject("article", article);
		mv.addObject("member", m);
		return mv;
			
	}
	
	// 모임 내 게시글 글쓰기 진행
	@RequestMapping(value="/meeting/meetingBoardInsert", method=RequestMethod.POST)
	public ModelAndView meetingBoardInsert(MeetingBoard meetingBoard, MultipartHttpServletRequest request, Model model) 
			throws Exception {
		ModelAndView mv=  new ModelAndView("redirect:/meeting/meetingBoardDetail");

		int party_no = meetingService.insertPartyBoardArticle(meetingBoard,request);
		
		model.addAttribute("meeting_no", meetingBoard.getMeeting_no());
		model.addAttribute("party_no", party_no);
		
		return mv;
			
	}
	

	// 모임 내 게시글 상세보기
	@RequestMapping(value="/meeting/meetingBoardDetail")
	public ModelAndView meetingBoardDetail(@RequestParam(value="meeting_no", required=false) int meeting_no, @RequestParam(value="party_no", required=false) int party_no) throws Exception {
		ModelAndView mv=  new ModelAndView("meeting/meetingBoardDetail");
		
		MeetingDetail article = meetingService.getMeetingArticle(meeting_no);

		MeetingBoard partyArticle = meetingService.getPartyBoardArticle(meeting_no, party_no);

		List<MeetingBoardFile> fileList = meetingService.getFileList(party_no);
		
		List<MeetingBoardComment> comment = meetingService.getPartyBoardComment(party_no);
		
		mv.addObject("article", article);
		mv.addObject("partyArticle", partyArticle);
		mv.addObject("fileList", fileList);
		mv.addObject("comment", comment);
		//System.out.println(fileList.size());
		return mv;
		
	}
	
	// 모임 내 게시글 수정
	@RequestMapping(value="/meeting/meetingBoardModify")
	public String meetingBoardModify() {
		
		return "meeting/meetingBoardModify";
		
	}
	
	// 모임 내 게시글 삭제
	@RequestMapping(value="/meeting/meetingBoardDelete")
	public String meetingBoardDelete() {
		
		return "meeting/meetingBoardDelete";
		
	}

	
}
