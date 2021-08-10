package com.ez.swm.studycafe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.studycafe.service.StudycafeService;
import com.ez.swm.studycafe.vo.Studycafe;
import com.ez.swm.studycafe.vo.StudycafeDetailFile;

@Controller
public class StudycafeController {
	
	@Autowired
	private StudycafeService studycafeService;
	
	// 스터디 카페 리스트 뷰로 이동
	@RequestMapping(value="/studycafeList")
	public ModelAndView studycafeList(Studycafe studtycafe) {
		ModelAndView mav = new ModelAndView();
		List<Studycafe> list = studycafeService.BestStudycafeList();
		List<Studycafe> list2 = studycafeService.NewStudycafeList();
		
		mav.addObject("bestStudycafeList", list);
		mav.addObject("newStudycafeList",list2);
		mav.setViewName("studycafe/studycafeList");
		return mav;
	}
	
	// 스터디 카페 리스트 뷰로 이동
	@RequestMapping(value="/studycafeSearch")
	public ModelAndView studycafeSearch(@RequestParam("keyword") String keyword) {
		ModelAndView mav = new ModelAndView();
		
		List<Studycafe> list = studycafeService.studycafeSearch(keyword);
		mav.setViewName("studycafe/studycafeSearch");
		mav.addObject("studycafeSearchList", list);
		
		return mav;
	}
	
	// 스터디 카페 상세보기 뷰로 이동
	@RequestMapping(value="/studycafe/studycafeDetail")
	public ModelAndView studycafeDetail(@RequestParam("studycafe_no") int studycafe_no) {
		ModelAndView mav = new ModelAndView();
		List<StudycafeDetailFile> list = studycafeService.studycafeDetailFile(studycafe_no);
		
		Studycafe studycafeOne = studycafeService.getStudycafeOne(studycafe_no);
		String[] list2 = {"1인실", "3 ~ 4 인실", "5 ~ 6 인실", "7 ~ 8 인실", "세 미 나 룸"};
		mav.addObject("s",studycafeOne);
		mav.addObject("files",list);
		mav.addObject("list2", list2);
		mav.setViewName("studycafe/studycafeDetail");
		return mav;
	}
	
	
}
	