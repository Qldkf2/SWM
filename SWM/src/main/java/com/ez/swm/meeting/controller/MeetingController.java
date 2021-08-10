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

import com.ez.swm.common.paging.PagingVO;
import com.ez.swm.login.vo.Member;
import com.ez.swm.meeting.service.MeetingService;
import com.ez.swm.meeting.vo.CommentCount;
import com.ez.swm.meeting.vo.Location;
import com.ez.swm.meeting.vo.Meeting;
import com.ez.swm.meeting.vo.MeetingBoard;
import com.ez.swm.meeting.vo.MeetingBoardComment;
import com.ez.swm.meeting.vo.MeetingBoardFile;
import com.ez.swm.meeting.vo.MeetingBoardModify;
import com.ez.swm.meeting.vo.MeetingDetail;
import com.ez.swm.meeting.vo.MeetingList;
import com.ez.swm.meeting.vo.MeetingPermit;
import com.ez.swm.meeting.vo.MeetingPermitList;
import com.ez.swm.meeting.vo.MeetingPermitYes;
import com.ez.swm.meeting.vo.MeetingUpdate;
import com.ez.swm.meeting.vo.MeetingWrite;

@Controller
public class MeetingController {
	
	@Autowired
	MeetingService meetingService;
	
	// ���� ��ƨ
	@RequestMapping(value="/meeting")
	public ModelAndView meeting(HttpServletRequest request, 
			PagingVO pagingVo,
			@RequestParam(value="subject", required=false) String keyword , 
			@RequestParam(value="nowPage", required=false)String nowPage,
			Model model) {
		ModelAndView mv=  new ModelAndView("meeting/meeting");
			
		int total=meetingService.countMeeting(keyword);
		
		if (nowPage == null) {
			nowPage = "1";
		} 
		
		pagingVo = new PagingVO(total, Integer.parseInt(nowPage));
		//��� ���� �� �о� �˻���
		HttpSession session = request.getSession();
		//ùȭ���̳� ���û����� ��ü�϶�
		if(keyword==null || keyword.equals("all")) {
			List<MeetingList> list = meetingService.getMeetingList(pagingVo);	
			
			mv.addObject("list", list);
			mv.addObject("paging", pagingVo);
			session.setAttribute("currentSubject", "all");
		}	
		//�о߼��� �Ȱ��
		else {
			//db rownum�˻���
			int start= pagingVo.getStart();
			int end=pagingVo.getEnd();
			
			List<MeetingList> list = meetingService.selectSubject(keyword, start, end);
			
			mv.addObject("list", list);
			mv.addObject("paging", pagingVo);
			session.setAttribute("currentSubject", keyword);
		}
		return mv;
		}
	// ���� ����� ������ �̵� ��
	@RequestMapping(value="/meeting/meetingWrite")
	public ModelAndView meetingWrtie() {
		ModelAndView mv=  new ModelAndView("meeting/meetingWriteForm");
		
		String si="����";
		List<Location> location = meetingService.locationList(si);
		mv.addObject("location",location);
		
		return mv;
	}
	
	// ���� �����
		@RequestMapping(value="/meeting/meetingWriteForm")
		public ModelAndView meetingWriteForm2(MeetingWrite meetingWrite, Model model, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			//������ �±׷� �ٲ��ִ� ����
			String content =  meetingWrite.getMeeting_content().replaceAll("\r\n", "<br />");		
			meetingWrite.setMeeting_content(content);
			System.out.println("������ ȸ����ȣ : " + meetingWrite.getMeeting_leader());
			boolean result = meetingService.meetingWriteForm(meetingWrite);
			Member m = new Member();
			HttpSession session = request.getSession();
			m = (Member)session.getAttribute("member");
			if(!result) {
				mav.addObject("msg", "fail");
			}
			
			mav.addObject("member" , m);
			mav.addObject("meetingWrite", meetingWrite);
			mav.addObject("msg", "����");
			mav.setViewName("redirect:/meeting");
			
			return mav;
		}
	
	// ���� �󼼺���
		@RequestMapping(value="/meeting/meetingDetail")
		public ModelAndView meetingDetail(@RequestParam("meeting_no") int meeting_no, HttpServletRequest request) throws Exception {
			ModelAndView mv=  new ModelAndView("meeting/meetingDetail");
			Member m = new Member();
			HttpSession session = request.getSession();
			m = (Member)session.getAttribute("member");
			int userNo = m.getUserNo();
			MeetingDetail meetingDetail = meetingService.getMeetingArticle(meeting_no);
			List<MeetingPermitList> meetingPermitList = meetingService.meetingPermitList(meeting_no);
			MeetingPermitYes mp = new MeetingPermitYes();
			mp.setMeeting_no(meeting_no);
			mp.setUserNo(userNo);
			String permitCheck = meetingService.permitCheck(mp);
			System.out.println("N�� �Գ� :" + permitCheck);

			
			mv.addObject("article",meetingDetail);
			mv.addObject("member",m);
			mv.addObject("mpList",meetingPermitList);
			mv.addObject("permitCheck",permitCheck);
			return mv;
	}
	
	// ���� ���������� �̵�s
	  @RequestMapping(value="/meeting/meetingUpdateForm") 
	  public ModelAndView meetingUpdateForm(@RequestParam("meeting_no") int meeting_no , HttpServletRequest request) throws Exception { 
		  ModelAndView mav = new ModelAndView(); 
		  Meeting m = meetingService.getMeetingOne(meeting_no);
		  System.out.println("���Ͷ� ! : " + m);
		  
		  Member member = new Member();
			HttpSession session = request.getSession();
			member = (Member)session.getAttribute("member");
		  mav.addObject("member", member);
		  mav.addObject("m" ,m);
		  mav.setViewName("meeting/meetingUpdateForm");
		  return mav; 
	  }
	 
	// ���� �����ϱ�
		@RequestMapping(value="/meeting/meetingUpdate")
		public ModelAndView meetingUpdate(MeetingUpdate mu) throws Exception {
			ModelAndView mav=  new ModelAndView();		
			int result = meetingService.meetingUpdate(mu);
			
			 String msg = ""; 
			 String loc = "/meeting"; 
			 if(result > 0) { 
				 msg = "���Ӽ��� ����~.~";
			 	  
			  }else {
				  msg = "���Ӽ��� ����~.~"; 
				 	} 
			 mav.addObject("msg", msg); 
			 mav.addObject("loc", loc);
			 mav.setViewName("common/msg");
			
			return mav;
		}
		
	// ���� �����ϱ� 		
		@RequestMapping(value="/meeting/meetingDelete")
		@ResponseBody
		public void meetingDelete(@RequestParam("meeting_no") int meeting_no) {
			meetingService.meetingDelete(meeting_no);
		}
		
	// ���� �����ϱ�
		@RequestMapping(value="/meeting/meetingPermit")
		public ModelAndView meetingPermit(MeetingPermit mp) {
			ModelAndView mav=  new ModelAndView();
			int result = meetingService.meetingPermit(mp);
			String msg="";
			String loc="/meeting";
			if(result > 0) {
				msg="���� ��û�� �Ϸ�Ǿ����ϴ�";	
			}
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			mav.setViewName("common/msg");
			return mav;
		}
		
	
		// ���� �� �Խ���
				@RequestMapping(value="/meeting/meetingBoard")
				public ModelAndView meetingBoard(
						@RequestParam("meeting_no") int meeting_no,
						@RequestParam(value="nowPage", required=false)String nowPage	) throws Exception {
					ModelAndView mv=  new ModelAndView("meeting/meetingBoard");
					
					int total=meetingService.countMeetingBoard(meeting_no);
					
					if (nowPage == null) {
						nowPage = "1";
					} 
					
					PagingVO pagingVo = new PagingVO(total, Integer.parseInt(nowPage));
				
					//db rownum�˻���
					int start= pagingVo.getStart();
					int end=pagingVo.getEnd();
					
					
					MeetingDetail article = meetingService.getMeetingArticle(meeting_no);
					List<MeetingBoard> list = meetingService.getMeetingBoardList(meeting_no, start, end);
					List<CommentCount> count = meetingService.countMeetingboardComment(meeting_no);
							
					mv.addObject("paging", pagingVo);
					mv.addObject("list", list);
					mv.addObject("article", article);
					mv.addObject("count", count);
					
					return mv;
			}
		
	// ���� �� �Խñ� �۾��� ��
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
	
	// ���� �� �Խñ� �۾��� ����
	@RequestMapping(value="/meeting/meetingBoardInsert", method=RequestMethod.POST)
	public ModelAndView meetingBoardInsert(MeetingBoard meetingBoard, MultipartHttpServletRequest request, Model model) 
			throws Exception {
		ModelAndView mv=  new ModelAndView("redirect:/meeting/meetingBoardDetail");
		//������ �±׷� �ٲ��ִ� ����
		String content =  meetingBoard.getMeeting_board_content().replaceAll("\r\n", "<br />");		
		meetingBoard.setMeeting_board_content(content);
		int party_no = meetingService.insertPartyBoardArticle(meetingBoard,request);
		
		model.addAttribute("meeting_no", meetingBoard.getMeeting_no());
		model.addAttribute("party_no", party_no);
		
		return mv;
			
	}
	

	// ���� �� �Խñ� �󼼺���
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
		mv.addObject("comments", comment);
		//System.out.println(fileList.size());
		return mv;
		
	}
	
	// ���� �� �Խñ� ���������� �̵�
	@RequestMapping(value="/meeting/meetingBoardModifyForm")
	public ModelAndView meetingBoardModify(@RequestParam(value="meeting_board_no") int meeting_board_no, 
			@RequestParam(value="meeting_no", required=false) int meeting_no, HttpServletRequest request ) throws Exception{
		ModelAndView mav = new ModelAndView();
		MeetingBoardModify m = meetingService.getMeetingBoard(meeting_board_no);
		System.out.println("���ӳ� �Խñ� ���� Ȯ�� : " + m);
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
	
	// ���� �� �Խñ� �����ϱ�
	@RequestMapping(value="/meeting/meetingBoardModify")
	public ModelAndView meetingBoardModify(MeetingBoardModify meetingBoardModify, MultipartHttpServletRequest request,
			@RequestParam(value="idx",defaultValue="9999") int idx) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int result = meetingService.meetingBoardModify(meetingBoardModify, request, idx);
		String msg = ""; 
		String loc = "/meeting"; 
		if(result > 0) { 
			 msg = "�Խñۼ��� ����~.~";
		 	  
		  }else {
			  msg = "�Խñ۸��Ӽ��� ����~.~"; 
			 	} 
		 mav.addObject("msg", msg); 
		 mav.addObject("loc", loc);
		 mav.setViewName("common/msg");
		
		return mav;
	}
	
	
	// ���� �� �Խñ� ����
	@ResponseBody
	@RequestMapping(value="/meeting/meetingBoardDelete")
	public void meetingBoardDelete(@RequestParam("meeting_board_no") int meeting_board_no) {
		 meetingService.meetingBoardDelete(meeting_board_no);
	}
	
	// ���� ��û �����ϱ�
	@ResponseBody
	@RequestMapping(value="/meeting/meetingPermitYes")
	public void meetingPermitYes(@RequestParam("meeting_no") int meeting_no, @RequestParam("userNo") int userNo) {
		MeetingPermitYes mp = new MeetingPermitYes();
		mp.setMeeting_no(meeting_no);
		mp.setUserNo(userNo);
		System.out.println("mp : " + mp);
		 meetingService.meetingPermitYes(mp);
	}

	// ���� ��û �����ϱ�
	@ResponseBody
	@RequestMapping(value="/meeting/meetingPermitNo")
	public void meetingPermitNo(@RequestParam("meeting_no") int meeting_no, @RequestParam("userNo") int userNo) {
		MeetingPermitYes mp = new MeetingPermitYes();
		mp.setMeeting_no(meeting_no);
		mp.setUserNo(userNo);
		System.out.println("mp : " + mp);
		 meetingService.meetingPermitNo(mp);
	}
	
	// ���� �� �Խñ� ��� �ޱ�
		@RequestMapping(value="/meeting/insertComment")
		public ModelAndView insertComment(
				@RequestParam(value="meeting_no", required=false) int meeting_no, 
				MeetingBoardComment meetingBoardComment,
				Model model)	throws Exception {
		
			ModelAndView mv=  new ModelAndView("redirect:/meeting/meetingBoardDetail");
			
			
			//������ �±׷� �ٲ��ִ� ����
			String content =  meetingBoardComment.getMeeting_board_comment_content().replaceAll("\r\n", "<br />");		
			meetingBoardComment.setMeeting_board_comment_content(content);
			
			//********��۴ޱ�
			meetingService.insertPartyBoardComment(meetingBoardComment);
	 
			model.addAttribute("meeting_no", meeting_no);
			model.addAttribute("party_no", meetingBoardComment.getMeeting_board_no());

		
			return mv;
			
		}
		
//		//��ۻ���1
//		@RequestMapping(value="/meeting/commentDelete")
//		public ModelAndView deleteComment(
//				@RequestParam(value="meeting_board_comment_no", required=false) int meeting_board_comment_no, 
//				@RequestParam(value="meeting_board_no", required=false) int meeting_board_no,
//				@RequestParam(value="meeting_no", required=false) int meeting_no,
//				Model model) {
	//
//			ModelAndView mv=  new ModelAndView("redirect:/meeting/meetingBoardDetail");
//			meetingService.deleteComment(meeting_board_comment_no) ;
	//
	//
//			return mv;
//			
	//	
//		}
		
		//��ۻ���2

		@RequestMapping(value="/meeting/commentDelete")
		@ResponseBody
		public void deleteComment(
				@RequestParam(value="meeting_board_comment_no", required=false) int meeting_board_comment_no)  throws Exception {

			meetingService.deleteComment(meeting_board_comment_no) ;
		
		}
		
		
		//���ӰԽ��� �˻�
		@RequestMapping(value="/meeting/meetingBoard/search")	
		public ModelAndView searchMeetingBoard(
				@RequestParam(value="meeting_no", required=false) int meeting_no,
				@RequestParam(value="keyword", required=false) String keyword,
				@RequestParam(value="nowPage", required=false)String nowPage) throws Exception {
			
			ModelAndView mv=  new ModelAndView("meeting/meetingBoard");
			
			
			int total=meetingService.countMeetingBoardSearch(meeting_no, keyword);
			System.out.println(total);
			
			
			if (nowPage == null) {
				nowPage = "1";
			} 
			
			PagingVO	pagingVo = new PagingVO(total, Integer.parseInt(nowPage));
			
			//db rownum�˻���
			int start= pagingVo.getStart();
			int end=pagingVo.getEnd();
			
			MeetingDetail article = meetingService.getMeetingArticle(meeting_no);
			List<MeetingBoard> list = meetingService.searchMeetingBoard(meeting_no, keyword, start, end);
			List<CommentCount> count = meetingService.countMeetingboardComment(meeting_no);
					
			
			mv.addObject("paging", pagingVo);
			mv.addObject("keyword", keyword);
			
			mv.addObject("list", list);
			mv.addObject("article", article);
			mv.addObject("count", count);
			
			return mv;
		}
		
		
		//�����Խ��� �˻�
		@RequestMapping(value="/meeting/search")	
		public ModelAndView searchMeeting(
				@RequestParam(value="keyword", required=false) String keyword,
				@RequestParam(value="nowPage", required=false)String nowPage) {
			
			ModelAndView mv=  new ModelAndView("meeting/meeting");

			int total=meetingService.countMeetingSearch(keyword);
			System.out.println(total);
			if (nowPage == null) {
				nowPage = "1";
			} 
			
			PagingVO pagingVo = new PagingVO(total, Integer.parseInt(nowPage));
			

			//db rownum�˻���
			int start= pagingVo.getStart();
			int end=pagingVo.getEnd();

			List<MeetingList> list = meetingService.searchMeeting(keyword, start, end);
			
			mv.addObject("list", list);
			mv.addObject("paging", pagingVo);
			mv.addObject("keyword", keyword);
			
			return mv;
		}
		

				
	}
	
	
