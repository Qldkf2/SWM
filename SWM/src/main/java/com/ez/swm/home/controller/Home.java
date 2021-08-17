package com.ez.swm.home.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.home.service.HomeService;
import com.ez.swm.home.vo.CommunityList;
import com.ez.swm.home.vo.MyMeetingList;
import com.ez.swm.home.vo.StudycafeList;
import com.ez.swm.login.vo.Member;
import com.ez.swm.meeting.vo.MeetingList;



@Controller
public class Home {
	
	@Autowired
	HomeService homeService;
	
	
	@RequestMapping(value="/home" , method=RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) {

		ModelAndView mv=  new ModelAndView("index");
		
        HttpSession session = request.getSession();
        
        //�������
        session.setAttribute("menu", "main");
        //���� �������
        session.setAttribute("currentSubject", "all");
        
        //���͵�ī��
        List<StudycafeList> studycafeList = homeService.NewStudycafeList();
        mv.addObject("studycafeList", studycafeList);
       // System.out.println(studycafeList.size());
        
        //����
        List<MeetingList> meetingList = homeService.NewMeetingList();
        mv.addObject("meetingList", meetingList);

       //���������Ѹ��� (�α��� ������ �����ؾ���)
        Member m =  (Member)session.getAttribute("member");
        if(m != null) {
        	int myMeetingCount=homeService.MyMeetingListCount(m.getUserNo());
	        List<MyMeetingList> myMeetingList = homeService.MyMeetingList(m.getUserNo());
	        mv.addObject("myMeetingList",myMeetingList);
	        mv.addObject("myMeetingCount",myMeetingCount);
        }
        //�����Խ���
        List<CommunityList> communityList = homeService.NewCommunityList();
		mv.addObject("communityList", communityList);
		
		
		return mv;
		
		
	}
}
