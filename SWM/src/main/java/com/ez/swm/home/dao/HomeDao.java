package com.ez.swm.home.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.home.vo.StudycafeList;
import com.ez.swm.meeting.vo.MeetingList;
import com.ez.swm.home.vo.CommunityList;
import com.ez.swm.home.vo.MyMeetingList;

@Repository
public class HomeDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	
	public List<StudycafeList> NewStudycafeList (){
		
		return sqlSession.selectList("Main.NewStudycafeList");
	}
	
	
	public List<MeetingList> NewMeetingList(){
		
		return sqlSession.selectList("Main.NewMeetingList");
	}
	
	
	
	public int MyMeetingListCount(int userno) {
		return sqlSession.selectOne("Main.MyMeetingListCount", userno);
	}
	
	
	public List<MyMeetingList> MyMeetingList(int userno){
		
		return sqlSession.selectList("Main.MyMeetingList",userno);
		
	}
	
	public List<CommunityList> NewCommunityList(){
		return sqlSession.selectList("Main.NewCommunityList");
	}
	

}
