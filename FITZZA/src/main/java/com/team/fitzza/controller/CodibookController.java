package com.team.fitzza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CodibookController {
	
	@GetMapping("/board/codibook/codibookList")
	public String codibookt() {		
		return "/board/codibook/codibookList";
	}

	  
}

