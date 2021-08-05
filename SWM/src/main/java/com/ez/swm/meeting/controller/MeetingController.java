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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.login.vo.Member;
import com.ez.swm.meeting.service.MeetingService;
import com.ez.swm.meeting.vo.Meeting;
import com.ez.swm.meeting.vo.MeetingBoard;
import com.ez.swm.meeting.vo.MeetingBoardComment;
import com.ez.swm.meeting.vo.MeetingBoardFile;
import com.ez.swm.meeting.vo.MeetingBoardModify;
import com.ez.swm.meeting.vo.MeetingDetail;
import com.ez.swm.meeting.vo.MeetingList;
import com.ez.swm.meeting.vo.MeetingPermit;
import com.ez.swm.meeting.vo.MeetingPermitList;
import com.ez.swm.meeting.vo.MeetingUpdate;
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
		public ModelAndView meetingWriteForm2(MeetingWrite meetingWrite, Model model, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			System.out.println("모임장 회원번호 : " + meetingWrite.getMeeting_leader());
			boolean result = meetingService.meetingWriteForm(meetingWrite);
			Member m = new Member();
			HttpSession session = request.getSession();
			m = (Member)session.getAttribute("member");
			if(!result) {
				mav.addObject("msg", "fail");
			}
			
			mav.addObject("member" , m);
			mav.addObject("meetingWrite", meetingWrite);
			mav.addObject("msg", "성공");
			mav.setViewName("redirect:/meeting");
			
			return mav;
		}
	
	// 모임 상세보기
		@RequestMapping(value="/meeting/meetingDetail")
		public ModelAndView meetingDetail(@RequestParam("meeting_no") int meeting_no, HttpServletRequest request) throws Exception {
			ModelAndView mv=  new ModelAndView("meeting/meetingDetail");
			Member m = new Member();
			HttpSession session = request.getSession();
			m = (Member)session.getAttribute("member");
			MeetingDetail meetingDetail = meetingService.getMeetingArticle(meeting_no);
			List<MeetingPermitList> meetingPermitList = meetingService.meetingPermitList(meeting_no);
			System.out.println("신청리스트 오냐 ? : " + meetingPermitList);
			mv.addObject("article",meetingDetail);
			mv.addObject("member",m);
			mv.addObject("mpList",meetingPermitList);
			return mv;
	}
	
	// 모임 수정폼으로 이동s
	  @RequestMapping(value="/meeting/meetingUpdateForm") 
	  public ModelAndView meetingUpdateForm(@RequestParam("meeting_no") int meeting_no , HttpServletRequest request) throws Exception { 
		  ModelAndView mav = new ModelAndView(); 
		  Meeting m = meetingService.getMeetingOne(meeting_no);
		  System.out.println("나와라 ! : " + m);
		  
		  Member member = new Member();
			HttpSession session = request.getSession();
			member = (Member)session.getAttribute("member");
		  mav.addObject("member", member);
		  mav.addObject("m" ,m);
		  mav.setViewName("meeting/meetingUpdateForm");
		  return mav; 
	  }
	 
	// 모임 수정하기
		@RequestMapping(value="/meeting/meetingUpdate")
		public ModelAndView meetingUpdate(MeetingUpdate mu) throws Exception {
			ModelAndView mav=  new ModelAndView();		
			int result = meetingService.meetingUpdate(mu);
			
			 String msg = ""; 
			 String loc = "/meeting"; 
			 if(result > 0) { 
				 msg = "모임수정 성공~.~";
			 	  
			  }else {
				  msg = "모임수정 실패~.~"; 
				 	} 
			 mav.addObject("msg", msg); 
			 mav.addObject("loc", loc);
			 mav.setViewName("common/msg");
			
			return mav;
		}
		
	// 모임 삭제하기 		
		@RequestMapping(value="/meeting/meetingDelete")
		@ResponseBody
		public ModelAndView meetingDelete(@RequestParam("meeting_no") int meeting_no) {
			ModelAndView mav=  new ModelAndView();
			int result = meetingService.meetingDelete(meeting_no);
			if(result > 0) {
				mav.setViewName("meeting/meeting");
			}
			
			return mav;
		}
		
	// 모임 가입하기
		@RequestMapping(value="/meeting/meetingPermit")
		public ModelAndView meetingPermit(MeetingPermit mp) {
			ModelAndView mav=  new ModelAndView();
			int result = meetingService.meetingPermit(mp);
			String msg="";
			String loc="/meeting";
			if(result > 0) {
				msg="가입 신청이 완료되었습니다";	
			}
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("common/msg");
			return mav;
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
	public ModelAndView meetingBoardDetail(@RequestParam(value="meeting_no", required=false) int meeting_no, 
			@RequestParam(value="party_no", required=false) int party_no,HttpServletRequest request) throws Exception {
		ModelAndView mv=  new ModelAndView("meeting/meetingBoardDetail");
		
		MeetingDetail article = meetingService.getMeetingArticle(meeting_no);

		MeetingBoard partyArticle = meetingService.getPartyBoardArticle(meeting_no, party_no);

		List<MeetingBoardFile> fileList = meetingService.getFileList(party_no);
		
		List<MeetingBoardComment> comment = meetingService.getPartyBoardComment(party_no);
		
		Member member = new Member();
			HttpSession session = request.getSession();
			member = (Member)session.getAttribute("member");
		mv.addObject("member", member);
		mv.addObject("article", article);
		mv.addObject("partyArticle", partyArticle);
		mv.addObject("fileList", fileList);
		mv.addObject("comment", comment);
		//System.out.println(fileList.size());
		return mv;
		
	}
	
	// 모임 내 게시글 수정폼으로 이동
	@RequestMapping(value="/meeting/meetingBoardModifyForm")
	public ModelAndView meetingBoardModify(@RequestParam(value="meeting_board_no") int meeting_board_no, 
			@RequestParam(value="meeting_no", required=false) int meeting_no, HttpServletRequest request ) throws Exception{
		ModelAndView mav = new ModelAndView();
		MeetingBoardModify m = meetingService.getMeetingBoard(meeting_board_no);
		System.out.println("모임내 게시글 정보 확인 : " + m);
		Member member = new Member();
			HttpSession session = request.getSession();
			member = (Member)session.getAttribute("member");
		MeetingBoardFile file = meetingService.getFileList2(meeting_board_no);
		System.out.println("fileList : " + file);
		MeetingDetail article = meetingService.getMeetingArticle(meeting_no);
		
		
		mav.addObject("file", file);
		mav.addObject("member", member);
		mav.addObject("m" ,m);
		mav.addObject("article", article);
		mav.setViewName("meeting/meetingBoardModify");
		
		return mav;
		
	}
	
	// 모임 내 게시글 수정하기
	@RequestMapping(value="/meeting/meetingBoardModify")
	public ModelAndView meetingBoardModify(MeetingBoardModify meetingBoardModify, MultipartHttpServletRequest request,
			@RequestParam(value="idx",defaultValue="9999") int idx) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int result = meetingService.meetingBoardModify(meetingBoardModify, request, idx);
		String msg = ""; 
		String loc = "/meeting"; 
		if(result > 0) { 
			 msg = "게시글수정 성공~.~";
		 	  
		  }else {
			  msg = "게시글모임수정 실패~.~"; 
			 	} 
		 mav.addObject("msg", msg); 
		 mav.addObject("loc", loc);
		 mav.setViewName("common/msg");
		
		return mav;
	}
	
	
	// 모임 내 게시글 삭제
	@ResponseBody
	@RequestMapping(value="/meeting/meetingBoardDelete")
	public void meetingBoardDelete(@RequestParam("meeting_board_no") int meeting_board_no) {
		 meetingService.meetingBoardDelete(meeting_board_no);
	}
	
	// 모임 신청 수락하기
	@ResponseBody
	@RequestMapping(value="/meeting/meetingPermitYes")
	public void meetingPermitYes(@RequestParam("meeting_no") int meeting_no, @RequestParam("userNo") int userNo) {
		 meetingService.meetingPermitYes(meeting_no ,userNo);
	}

	
}
