package com.ez.swm.meeting.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.swm.login.vo.Member;
import com.ez.swm.meeting.service.MeetingService;
import com.ez.swm.meeting.vo.MeetingWrite;

@Controller
public class MeetingController {
	
	@Autowired
	MeetingService meetingService;
	
	@RequestMapping(value="/meeting")
	public String meeting(HttpServletRequest request, Model model) {
		/*
		 * Member m = new Member(); HttpSession session = request.getSession();
		 * 
		 * m = (Member)session.getAttribute("member"); System.out.println("m : " +
		 * m.getUserNo()); model.addAttribute("member", m);
		 */
	return "meeting/meeting";
	}
	
	
	@RequestMapping(value="/meeting/meetingWrite")
	public String meetingWrtie() {
		return "meeting/meetingWriteForm";
	}
	
	// ���� �����
	@RequestMapping(value="/meeting/meetingWriteForm")
	public String meetingWriteForm(MeetingWrite meetingWrite, Model model, HttpServletRequest request) {
		boolean result = meetingService.meetingWriteForm(meetingWrite);
		Member m = new Member();
		HttpSession session = request.getSession();
		m = (Member)session.getAttribute("member");
		if(!result) {
			model.addAttribute("msg", "fail");
			return "meeting/meetingWrite"; 
		}
		model.addAttribute("member" , m);
		model.addAttribute("msg", "����");
		
		return "meeting/meeting";
	}
	
	// ���� �󼼺���
	@RequestMapping(value="/meeting/meetingDetail")
	public String meetingDetail() {
		
		return "meeting/meetingDetail";
		
	}
	
	// ���� �� �Խ���
	@RequestMapping(value="/meeting/meetingBoard")
	public String meetingBoard() {
		
		return "meeting/meetingBoard";
		
	}
	
	// ���� �� �Խñ� �󼼺���
	@RequestMapping(value="/meeting/meetingBoardDetail")
	public String meetingBoardDetail() {
		
		return "meeting/meetingBoardDetail";
		
	}
	
	// ���� �� �Խñ� ����
	@RequestMapping(value="/meeting/meetingBoardModify")
	public String meetingBoardModify() {
		
		return "meeting/meetingBoardModify";
		
	}
	
	// ���� �� �Խñ� ����
	@RequestMapping(value="/meeting/meetingBoardDelete")
	public String meetingBoardDelete() {
		
		return "meeting/meetingBoardDelete";
		
	}

	
}
