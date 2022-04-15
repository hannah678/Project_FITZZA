package com.team.fitzza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@GetMapping("/admin/adminHome")
	public String adminHome() {
		return "/admin/adminHome";
	}
	
	@RequestMapping("/admin/adminUser")
	public ModelAndView adminUser() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminUser");
		return mav;
	}
	
	@RequestMapping("/admin/adminReport")
	public String adminReport() {
		return "/admin/adminReport";
	}
	
	@RequestMapping("/admin/adminOld")
	public String adminOld() {
		return "/admin/adminOld";
	}
	
	@RequestMapping("/admin/adminBoard")
	public String adminBoard() {
		return "/admin/adminBoard";
	}
}
