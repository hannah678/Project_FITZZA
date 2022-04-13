package com.team.fitzza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TodayCodiController {
	
	@GetMapping("/board/todayCodi/todayCodiList")
	public String todayCodiList() {
		return "/board/todayCodi/todayCodiList";
	}
	@GetMapping("/board/todayCodi/todayCodiWrite")
	public String todayCodiWrite() {
		return "/board/todayCodi/todayCodiWrite";
	}
	
	
}
