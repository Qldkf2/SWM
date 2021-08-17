package com.ez.swm.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.swm.home.dao.HomeDao;
import com.ez.swm.home.vo.CommunityList;
import com.ez.swm.home.vo.MyMeetingList;
import com.ez.swm.home.vo.StudycafeList;
import com.ez.swm.meeting.vo.MeetingList;



@Service
public class HomeService {
	

	@Autowired
	HomeDao homeDao;
	
	

	
	public List<StudycafeList> NewStudycafeList (){
		
		return homeDao.NewStudycafeList();
	}
	
	
	public List<MeetingList> NewMeetingList(){
		
		return homeDao.NewMeetingList();
	}
	
	
	public int MyMeetingListCount(int userno) {
		return homeDao.MyMeetingListCount(userno);
	}
	public List<MyMeetingList> MyMeetingList(int userno){
		
		return homeDao.MyMeetingList(userno);
		
	}
	
	public List<CommunityList> NewCommunityList(){
		return homeDao.NewCommunityList();
	}
	

}
