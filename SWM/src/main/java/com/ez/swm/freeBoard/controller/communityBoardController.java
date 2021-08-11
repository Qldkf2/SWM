package com.ez.swm.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class communityBoardController {

	// Ŀ�´�Ƽ �Խ��� �̵�
	@RequestMapping(value="/community")
	public String community() {
		return "community/communityBoard";
	}
	
	// Ŀ�´�Ƽ �Խñ� �ۼ�
	@RequestMapping(value="/community/communityBoardWrite")
	public String communityBoardWrite() {
		return "community/communityBoardWrite";
	}
	
	// Ŀ�´�Ƽ �Խñ� �󼼺���
	@RequestMapping(value="/community/communityBoardDetail")
	public String communityBaordDetail() {
		return "community/communityBoardDetail";
	}
	
	// Ŀ�´�Ƽ �Խñ� ����
	@RequestMapping(value="/community/communityBoardModufy")
	public String communityBoardModufy() {
		return "community/communityBoardModufy";
	}
	
	// Ŀ�´�Ƽ �Խñ� ����
	@RequestMapping(value="/community/communityBoardDelete")
	public String communityBoardDelete() {
		return "community/communityBoardDelete";
	}
	
}
