package com.team.fitzza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class VoteController {
	@GetMapping("/board/vote/voteList")
	public String voteList() {
		
		return "/board/vote/voteList";
	}
	
}
