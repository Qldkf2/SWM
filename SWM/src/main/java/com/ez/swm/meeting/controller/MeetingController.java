package com.ez.swm.meeting.controller;

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
	public String meeting() {
	return "meeting/meeting";
	}
	
	// ���� �����
	@RequestMapping(value="/meeting/meetingWrite")
	public String meetingWrite(MeetingWrite meetingWrite, Model model) {
		boolean result = meetingService.meetingWrite(meetingWrite);
		
		if(!result) {
			model.addAttribute("msg", "fail");
			return "meeting/meetingWrite"; 
		}
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
