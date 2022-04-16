package com.team.fitzza.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.AdminService;
import com.team.fitzza.vo.MemberVO;

@Controller
public class AdminController {
	@Inject
	AdminService service;
	
	@GetMapping("/admin/adminHome")
	public ModelAndView adminHome(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		//회원관리-----------------------------------------------------------------------------------------------------------------------------------
		//전체 회원 수
		mav.addObject("user_num",service.CountUser(vo));
		
		//회원 명단
		mav.addObject("userList", service.AllUser(vo));
		
		
		mav.setViewName("admin/adminHome");
		return mav;
	}
	
	
	
	
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
}
