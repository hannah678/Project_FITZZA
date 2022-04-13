package com.team.fitzza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping("/admin/adminHome")
	public String adminHome() {
		return "/admin/adminHome";
	}
	
}
