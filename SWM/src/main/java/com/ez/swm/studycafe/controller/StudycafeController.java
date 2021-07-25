package com.ez.swm.studycafe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudycafeController {
	
	@RequestMapping(value="/studycafeList")
	public String studycafeList() {
		return "studycafe/studycafeList";
	}

	@RequestMapping(value="/studycafe/studtcafeBookDetail")
	public String studycafeBookDetail() {
		return "studycafe/bookDetail";
	}
	
	@RequestMapping(value="/studycafe/studycafeBook")
	public String studycafeBook() {
		return "studycafe/book";
	}

	
	
}
