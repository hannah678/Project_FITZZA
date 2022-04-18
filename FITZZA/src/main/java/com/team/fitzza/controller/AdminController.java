package com.team.fitzza.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.AdminService;
import com.team.fitzza.service.MemberService;
import com.team.fitzza.vo.MemberVO;

@Controller
public class AdminController {
	@Inject
	AdminService service;
	@Inject
	MemberService Mservice;
	
	@GetMapping("/admin/adminHome")
	public ModelAndView adminHome(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		//회원관리-----------------------------------------------------------------------------------------------------------------------------------
		//전체 회원 수
		mav.addObject("user_num",service.CountUser(vo));	
		//탈퇴한 회원 수
		mav.addObject("user_leave_num",service.CountLeaveUser(vo));	
		//회원 명단
		mav.addObject("userList", service.AllUser(vo));
		//탈퇴한 회원 명단
		mav.addObject("leaveList", service.LeaveUser(vo));
		
		mav.setViewName("admin/adminHome");
		return mav;
	}
	
	//회원게시물
	@GetMapping("/admin/adminUserBoard")
	public ModelAndView adminUserBoard(String user_id, MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		//회원 게시물
		mav.addObject("UserBoardList", service.UserBoard(vo));
		//회원 댓글
		mav.addObject("UserReplyList", service.UserReply(vo));
		
		
		mav.setViewName("/admin/adminUserBoard");
		return mav;
	}
	/*//강제 탈퇴
	service.forcedBye(vo);
	Mservice.memberBye(vo);	
	
	//관리자 권한 부여
	service.makeAdmin(vo);*/
	
	//신고관리-----------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping("/admin/adminReport")
	public String adminReport() {
		return "/admin/adminReport";
	}
	//중고거래 관리--------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping("/admin/adminOld")
	public String adminOld() {
		return "/admin/adminOld";
	}
	//게시판 관리----------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping("/admin/adminBoard")
	public String adminBoard() {
		return "/admin/adminBoard";
	}
	//회원 추가
	@RequestMapping("/admin/adminMemberInsert")
	public String adminMemberInsert() {
		return "/admin/adminMemberInsert";
	}
}
