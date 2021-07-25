package com.ez.swm.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class communityBoardController {

	// 커뮤니티 게시판 이동
	@RequestMapping(value="/community")
	public String community() {
		return "community/communityBoard";
	}
	
	// 커뮤니티 게시글 작성
	@RequestMapping(value="/community/communityBoardWrite")
	public String communityBoardWrite() {
		return "community/communityBoardWrite";
	}
	
	// 커뮤니티 게시글 상세보기
	@RequestMapping(value="/community/communityBoardDetail")
	public String communityBaordDetail() {
		return "community/communityBoardDetail";
	}
	
	// 커뮤니티 게시글 수정
	@RequestMapping(value="/community/communityBoardModufy")
	public String communityBoardModufy() {
		return "community/communityBoardModufy";
	}
	
	// 커뮤니티 게시글 삭제
	@RequestMapping(value="/community/communityBoardDelete")
	public String communityBoardDelete() {
		return "community/communityBoardDelete";
	}
	
}
