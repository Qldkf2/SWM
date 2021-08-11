package com.ez.swm.freeBoard.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.freeBoard.service.FreeBoardService;
import com.ez.swm.freeBoard.vo.FreeBoard;
import com.ez.swm.freeBoard.vo.FreeBoardComment;
import com.ez.swm.freeBoard.vo.FreeBoardCommentList;
import com.ez.swm.freeBoard.vo.FreeBoardFile;
import com.ez.swm.freeBoard.vo.FreeBoardWrite;
import com.ez.swm.login.vo.Member;

@Controller
public class FreeBoardController {

	
	@Autowired
	private FreeBoardService freeBoardService;
	
	ModelAndView mv = new ModelAndView();
	
	
	// Ŀ�´�Ƽ �Խ��� �̵�, ����Ʈ ����
	@RequestMapping(value="/freeBoard")
	public ModelAndView community() {
		
		List<FreeBoard> freeBoardList = freeBoardService.communityBoardList();		
		//System.out.println("communityList :" + communityList);
		mv.addObject("freeBoardList",freeBoardList);
		mv.setViewName("freeBoard/freeBoard");
		return mv;
	}
	
	// Ŀ�´�Ƽ �Խñ� �ۼ����̵�
	@RequestMapping(value="/freeBoard/freeBoardWriteForm")
	public ModelAndView communityBoardWrite( HttpServletRequest request){
		Member m = new Member();
		HttpSession session = request.getSession();
		m = (Member)session.getAttribute("member");
		mv.addObject("member", m);
		mv.setViewName("freeBoard/freeBoardWrite");
		return mv;
	}

	// Ŀ�´�Ƽ ���ۼ�
	@RequestMapping(value="/freeBoard/freeBoardWrite")
	public ModelAndView communityBoardInsert(FreeBoardWrite freeBoardWrite, MultipartHttpServletRequest request) throws Exception{
		//������ �±׷� �ٲ��ִ� ����
			String content =  freeBoardWrite.getFree_content().replaceAll("\r\n", "<br />");		
			freeBoardWrite.setFree_content(content);
			int free_no = freeBoardService.communityBoardWrite(freeBoardWrite,request);
			mv.addObject("free_no", free_no);
			mv.setViewName("redirect:/freeBoard");
		return mv;
	}
	
	
	// Ŀ�´�Ƽ �Խñ� �󼼺���
	@RequestMapping(value="/freeBoard/freeBoardDetail")
	public ModelAndView communityBoardDetail(@RequestParam("free_no") int free_no,HttpServletRequest request) throws Exception {
		Member m = new Member();
		HttpSession session = request.getSession();
		m = (Member)session.getAttribute("member");
		mv.addObject("member", m);
		FreeBoard freeBoard = freeBoardService.communityBoardDetail(free_no);
		
		List<FreeBoardCommentList> commentList = freeBoardService.communityComment(free_no);
		List<FreeBoardFile> files = freeBoardService.freeBoardGetFile(free_no);
	
		mv.addObject("files",files);
		mv.addObject("freeBoardDetail",freeBoard);
		mv.addObject("cumList", commentList);
		mv.setViewName("freeBoard/freeBoardDetail");		
		
		return mv;
	}
	
	//��۴ޱ�
	@RequestMapping("/community/commentWrite")
	public ModelAndView commentWrite(@ModelAttribute("commentVo") FreeBoardComment commentVo,
			HttpSession session) {
		
		freeBoardService.writeComment(commentVo);
		
		mv.addObject("comment", commentVo);
		mv.setViewName("redirect:/freeBoard/freeBoardDetail?free_no="+commentVo.getFree_no());
		return mv;
	}
	
	
	// Ŀ�´�Ƽ �Խñ� ������
	@RequestMapping(value="/community/communityBoardModufy", method = RequestMethod.POST)
	public String communityBoardModufy(FreeBoard freeBoard) throws Exception {
		return "freeBoard/freeBoardModufy";
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String updateCummunityBoard(FreeBoard freeBoard) {
		
		freeBoardService.updateFreeBorad(freeBoard);
		
		return "redirect:/freeBoard/freeBoardBoard";
	}
	
	// Ŀ�´�Ƽ �Խñ� ���� ��
	@RequestMapping(value="/community/communityBoardDelete")
	public String communityBoardDelete(@RequestParam("free_no") int free_no) {
		freeBoardService.deleteFreeBoard(free_no);
		return "freeBoard/freeBoard";
	}
	
	// ��� ����	
	@RequestMapping(value="/community/communityCommentDelete")
	public String communityCommentDelete(@RequestParam("free_comment_no") int free_comment_no,@RequestParam("free_no") int free_no) {
		freeBoardService.deleteFreeComment(free_comment_no);
		
		return "redirect:/freeBoard/freeBoardDetail?free_no="+free_no;
	}
	
	@InitBinder //Date Ȱ��ȭ
    protected void initBinder(WebDataBinder binder) {
       DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
       binder.registerCustomEditor(Date.class, new CustomDateEditor(
             dateFormat, true));
    }
	
	

	// �Խñ� ����
	@RequestMapping(value="/community/communityBoardDelete2", method = RequestMethod.POST)
	public String communityBoardDelete2(FreeBoard freeBoard) throws Exception {
		
		System.out.println("free_no : " + freeBoard.getFree_no());
		System.out.println("commVo : " + freeBoard);
		freeBoardService.deleteFreeBoard(freeBoard.getFree_no());
		
		
		return "redirect:/freeBoard";
	}
}
