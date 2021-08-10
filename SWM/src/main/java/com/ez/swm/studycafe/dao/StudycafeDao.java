package com.ez.swm.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.admin.vo.StudycafeWrite;
import com.ez.swm.studycafe.vo.Studycafe;
import com.ez.swm.studycafe.vo.StudycafeDetailFile;



@Repository
public class StudycafeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
		// 스터디 카페 등록하기
		public int insertStudycafe(Studycafe studycafe) {
			return sqlSession.insert("Studycafe.insertStudycafe",studycafe);
		}
	
		// 스터디 카페 리스트 불러오기
		public List<Studycafe> BestStudycafeList() {
			return sqlSession.selectList("Studycafe.BestStudycafeList");
		}

		public List<Studycafe> NewStudycafeList() {
			return sqlSession.selectList("Studycafe.NewStudycafeList");
		}

		public List<Studycafe> studycafeSearch(String keyword) {
			return sqlSession.selectList("Studycafe.studycafeSearch",keyword);
		}

		public List<StudycafeDetailFile> studycafeDetailFile(int studycafe_no) {
			return sqlSession.selectList("File.studycafeDetailFile",studycafe_no);
		}

		public Studycafe getStudycafeOne(int studycafe_no) {
			return sqlSession.selectOne("Studycafe.getStudycafeOne",studycafe_no);
		}
		
}
