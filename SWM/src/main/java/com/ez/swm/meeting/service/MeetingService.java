package com.ez.swm.meeting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.swm.meeting.dao.MeetingDao;
import com.ez.swm.meeting.vo.MeetingWrite;

@Service
public class MeetingService {
	
	@Autowired
	MeetingDao meetingDao;

	public boolean meetingWrite(MeetingWrite meetingWrite) {
		return meetingDao.meetingWrite(meetingWrite) > 0;
	}

}
