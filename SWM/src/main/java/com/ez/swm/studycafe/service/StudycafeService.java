package com.ez.swm.studycafe.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.swm.book.vo.BookTime;
import com.ez.swm.studycafe.dao.StudycafeDao;
import com.ez.swm.studycafe.vo.Studycafe;
import com.ez.swm.studycafe.vo.StudycafeDetailFile;
import com.ez.swm.studycafe.vo.StudycafeReview;


@Service
public class StudycafeService {

	@Autowired
	StudycafeDao studycafeDao;
	
	public int insertStudycafe(Studycafe studycafe) {
		return studycafeDao.insertStudycafe(studycafe);
	}
	
	//
	public List<Studycafe> BestStudycafeList(){
		return studycafeDao.BestStudycafeList();
	}

	public List<Studycafe> NewStudycafeList() {
		return studycafeDao.NewStudycafeList();
	}

	public List<Studycafe> studycafeSearch(String keyword) {
		return studycafeDao.studycafeSearch(keyword);
	}

	public List<StudycafeDetailFile> studycafeDetailFile(int studycafe_no) {
		return studycafeDao.studycafeDetailFile(studycafe_no);
	}

	public Studycafe getStudycafeOne(int studycafe_no) {
		return studycafeDao.getStudycafeOne(studycafe_no);
	}
	
	public String getBookTime(BookTime bookTime) {
		return studycafeDao.getBookTime(bookTime);
	}
	
	//∏Æ∫‰æ≤±‚
	public void insertReview(StudycafeReview review) {
		 studycafeDao.insertReview(review);
	}
	
	//∏Æ∫‰∏ÆΩ∫∆Æ∞°¡Æø¿±‚
	public List<StudycafeReview> getReviewList(int studycafe_no){
		return studycafeDao.getReviewList(studycafe_no);
	}
	
	//∏Æ∫‰∆Ú¡°
	public HashMap<String, Object> getReviewGrade(int studycafe_no){
		return studycafeDao.getReviewGrade(studycafe_no);

	}
	//∏Æ∫‰ªË¡¶
	public void reviewDelete(int review_no) {
		studycafeDao.reviewDelete(review_no);
		
	}
}
