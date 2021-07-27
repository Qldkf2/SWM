package com.ez.swm.meeting.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.meeting.vo.MeetingWrite;

@Repository
public class MeetingDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int meetingWriteForm(MeetingWrite meetingWrite) {
	
		return sqlSession.insert("Meeting.meetingWrite", meetingWrite);
	}

}
