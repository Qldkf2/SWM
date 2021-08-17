package com.ez.swm.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.admin.service.AdminService;
import com.ez.swm.admin.vo.AdminVo;
import com.ez.swm.admin.vo.StudycafeWrite;
import com.ez.swm.login.vo.Member;
import com.ez.swm.myPage.service.MyPageService;
import com.ez.swm.myPage.vo.Ask;
import com.ez.swm.myPage.vo.AskComment;
import com.ez.swm.myPage.vo.AskJoin;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	MyPageService myPageService;
	

	// ������ ������ �̵�
	@RequestMapping(value="/admin")
	public String admin() {
	
	return "admin/adminMain";
	}
	
	//���͵� ī�� �۾��� ��
		@RequestMapping("/admin/studycafeWriteForm")
		public ModelAndView studycafeWriteForm(HttpServletRequest request) {
			ModelAndView mv = new ModelAndView();
			Member m = new Member();
			HttpSession session = request.getSession();
			m = (Member)session.getAttribute("member");
			
			mv.addObject("member",m);
			mv.setViewName("admin/studycafeWriteForm");
			return mv;
		}	
		
	   // ���͵� ī�� �۾��� ����
		@RequestMapping(value = "/admin/studycafeWrite", method=RequestMethod.POST)
		public ModelAndView studycafeWrite (StudycafeWrite studycafeWrite , MultipartHttpServletRequest request) throws Exception {
			ModelAndView mav = new ModelAndView();
			int result = adminService.studycafeWrite(studycafeWrite,request);
			
			 String msg = ""; 
			 String loc = "/admin"; 
			 if(result > 0) { 
				 msg = "ī���� ����~.~";
			  }else  msg = "ī���� ����~.~"; 
				 	
			 mav.addObject("msg", msg); 
			 mav.addObject("loc", loc);
			 mav.setViewName("common/msg");

			return mav;
		}
		
	// �������� 1:1 ���� �亯 ������ �̵�
	@RequestMapping(value="/admin/adminAskList", method=RequestMethod.GET)
	public String adminAskList(Model model) {
			
		List<AskJoin> allAsk = adminService.askAllList();
		model.addAttribute("allAsk", allAsk);
			
		return "/admin/adminAskList";
	}
	
	// ������ 1:1 ���� �������� - �亯 ����
		@RequestMapping(value="/admin/askReply", method=RequestMethod.GET)
		public String askReply(@RequestParam("ask_no") int askNo, Ask ask, Model model, AskComment comment) {
			
			Ask askDetail = myPageService.askDetail(askNo);
			model.addAttribute("detail", askDetail);
			
			AskComment replyResult = adminService.getAskReply(askNo);
			model.addAttribute("adminReply",replyResult);
			
			return "/admin/askReply";
		}
		
		
		// ������ 1:1���� �亯
		@RequestMapping(value="/admin/askReplyByAdmin", method=RequestMethod.POST)
		public String askReplyByAdmin(AskComment comment, Model model) {
			
			int reply = adminService.insertAskReply(comment);
			int ask_no = comment.getAsk_no();
			model.addAttribute("reply", reply);
			model.addAttribute("ask_no", ask_no);
		
			return "redirect: /admin/askReply";
		}
		
		// ���͵�ī�� ����Ʈ
				@RequestMapping(value = "/admin/studycafeinfo")
				public ModelAndView adminstudycafelist() {

					ModelAndView mv = new ModelAndView();
					mv.setViewName("admin/studycafe_info");

					List<AdminVo> list = adminService.adminstudycafelist();
					mv.addObject("studycafeList", list);

					return mv;
				}
				
				//���͵�ī�� ��������
				@RequestMapping(value = "/admin/studycafedetail")
				public ModelAndView studycafedetail(@RequestParam("studycafe_no") int studycafe_no) {

					ModelAndView mv = new ModelAndView();
					mv.setViewName("admin/studycafeDetail");

					AdminVo list = adminService.studycafedetail(studycafe_no);
					mv.addObject("studycafedetail", list);

					return mv;
				}
				
						// ���͵� ī�� ����
						@RequestMapping(value = "/admin/studycafeDelete")
						public ModelAndView studycafedelete(@RequestParam("studycafe_no") int studycafe_no) {

							ModelAndView mv = new ModelAndView();

							int result = 0;
							result = adminService.studycafedelete(studycafe_no);
							return mv;

						}
				
				
			

			// �ɹ� ����Ʈ
			@RequestMapping(value = "/admin/adminMemberinfo")
			public ModelAndView adminmemberlist() {

				ModelAndView mv = new ModelAndView();
				mv.setViewName("admin/member_info");

				List<Member> list = adminService.adminMemberList();
				mv.addObject("memberList", list);

				return mv;
			}

			// �ɹ� �󼼺���
			@RequestMapping(value = "/admin/adminMemberDetail")
			public ModelAndView adminMemberdetail(@RequestParam("userNo") int userNo) {

				ModelAndView mv = new ModelAndView();
				mv.setViewName("admin/detailMember");

				Member list = adminService.adminMemberDetail(userNo);
				mv.addObject("adminMember", list);

				return mv;
			}

				// �ɹ� ����
				@RequestMapping(value = "/admin/adminMemberDelete")
				public ModelAndView adminMemberDelete(@RequestParam("userNo") int userNo) {

					ModelAndView mv = new ModelAndView();

					int result = 0;
					result = adminService.adminMemberDelete(userNo);
					return mv;

				}
			
				// ȸ�� ���� ���� ������ �̵�
				@RequestMapping(value="/admin/memberModify2", method=RequestMethod.GET)
				public ModelAndView memberModify( @RequestParam("userNo") int userNo) {
					
					ModelAndView mv = new ModelAndView();
					mv.setViewName("admin/memberModify2");
					mv.addObject("detaolMember", userNo);

					return mv;
				}
				
				// ȸ�� ���� ���� (������)
				@RequestMapping(value="/admin/memberModify2", method=RequestMethod.POST)
				public String memberModifyByadmin(Member member, @RequestParam("userNo") int userNo, Model model) {
					
					int updateResult = adminService.updateMemberByadmin(member);
					
					if(updateResult == 1) {
						
						return "redirect: /admin";
					}
					
					return "/admin/memberModify2";
					
				}
				
				//���� ����Ʈ
				@RequestMapping(value="/admin/adminMeetingList")
				public ModelAndView selectAdminMeeting() {
					
					ModelAndView mv = new ModelAndView();
					mv.setViewName("admin/meeting_info");

					List<AdminVo> list = adminService.selectAdminMeeting();
					mv.addObject("meetingList", list);

					return mv;
				
				}
				
				// ���� �󼼺���
				@RequestMapping(value = "/admin/adminMeetingDetail")
				public ModelAndView adminMeetingDetail(@RequestParam("meeting_no") int meeting_no) {

					ModelAndView mv = new ModelAndView();
					mv.setViewName("admin/detailMeeting");

					AdminVo list = adminService.adminMeetingDetail(meeting_no);
					mv.addObject("detailMeeting", list);

					return mv;
				}
				
				//���û���
				@RequestMapping(value = "/admin/adminMeetingDelete")
				public ModelAndView meetingdelete(@RequestParam("meeting_no") int meeting_no) {

					ModelAndView mv = new ModelAndView();

					int result = 0;
					result = adminService.meetingdelete(meeting_no);
					return mv;

				}
				
				//�������� ����Ʈ
				@RequestMapping(value="/admin/adminfreeboard")
				public ModelAndView freeBoardList() {
							
					ModelAndView mv = new ModelAndView();
					mv.setViewName("admin/community_info");

					List<AdminVo> list = adminService.freeBoardList();

					mv.addObject("freeList", list);

					return mv;
						
				}
				
						// �������� ������ �󼼺���
						@RequestMapping(value = "/admin/adminfreeDetail")
						public ModelAndView adminFreeDetail(@RequestParam("free_No") int free_No) {

							ModelAndView mv = new ModelAndView();
							mv.setViewName("admin/detailFreeboard");

							AdminVo list = adminService.adminFreeDetail(free_No);
							mv.addObject("detailfree", list);

							return mv;
						}
				
		
}
