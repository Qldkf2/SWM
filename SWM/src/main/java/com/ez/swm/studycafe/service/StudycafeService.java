package com.ez.swm.studycafe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.swm.admin.vo.StudycafeWrite;
import com.ez.swm.studycafe.dao.StudycafeDao;
import com.ez.swm.studycafe.vo.Studycafe;
import com.ez.swm.studycafe.vo.StudycafeDetailFile;


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
}
