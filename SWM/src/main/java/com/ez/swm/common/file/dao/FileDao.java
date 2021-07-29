package com.ez.swm.common.file.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.meeting.vo.MeetingBoardFile;

@Repository
public class FileDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MeetingBoardFile selectFileInfo(int idx) throws	Exception{
		return sqlSession.selectOne("File.selectFileInfo", idx);
	}

}
