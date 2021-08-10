package com.ez.swm.admin.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.swm.admin.vo.StudycafeWrite;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int studycafeWrite(StudycafeWrite studycafeWrite,MultipartHttpServletRequest request) {
		 sqlSession.insert("Studycafe.studycafeWrite", studycafeWrite);
		 return sqlSession.selectOne("Studycafe.getStudycafe_no"); 
	}

	public void insertFile(Map<String, Object> valueMap) {
		sqlSession.insert("File.studycafeFileInsert",valueMap);
	}

	

}
