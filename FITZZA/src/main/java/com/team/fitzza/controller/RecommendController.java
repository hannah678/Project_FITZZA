package com.team.fitzza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class RecommendController {
	@GetMapping("/board/recommend/recommendList")
	public String voteList() {
		
		return "/board/recommend/recommendList";
	}
	
}
