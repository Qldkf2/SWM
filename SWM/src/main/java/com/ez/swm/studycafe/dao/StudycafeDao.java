package com.ez.swm.studycafe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.admin.vo.StudycafeWrite;
import com.ez.swm.book.vo.BookTime;
import com.ez.swm.studycafe.vo.Studycafe;
import com.ez.swm.studycafe.vo.StudycafeDetailFile;
import com.ez.swm.studycafe.vo.StudycafeReview;



@Repository
public class StudycafeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
		// ���͵� ī�� ����ϱ�
		public int insertStudycafe(Studycafe studycafe) {
			return sqlSession.insert("Studycafe.insertStudycafe",studycafe);
		}
	
		// ���͵� ī�� ����Ʈ �ҷ�����
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
		
		//����ð��� ��������
		public String getBookTime(BookTime bookTime) {
			return sqlSession.selectOne("Studycafe.getBookTime", bookTime);
		}
		
		//���侲��
		public void insertReview(StudycafeReview review) {
			 sqlSession.insert("Studycafe.insertReview", review);
		}
		
		//���䰡������
		public List<StudycafeReview> getReviewList(int studycafe_no){
			return sqlSession.selectList("Studycafe.getReviewList", studycafe_no);
		}
		
		//�������
		public HashMap<String, Object> getReviewGrade(int studycafe_no){
			return sqlSession.selectOne("Studycafe.getReviewGrade", studycafe_no);
		}

		public void reviewDelete(int review_no) {
			sqlSession.delete("Studycafe.reviewDelete", review_no);
			
		}
}
