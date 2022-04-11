package com.team.fitzza.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team.fitzza.service.BoardService;
import com.team.fitzza.vo.BoardVO;

@RestController
public class BoardController {
	@Inject
	BoardService service;
	
	//글 신고
	@PostMapping("/board/reportOk")
	public int reportOk(BoardVO vo, HttpSession session) {
		System.out.println("/board/reportOk START!");
		
		vo.setUser_id((String)session.getAttribute("logId"));// 신고하는 유저의 아이디 = 로그인된 아이디	
		
		System.out.println(vo.getUser_id());
		System.out.println(vo.getBoard_num());
		service.reportInsert(vo);
		
		return service.reportUp(vo);
	}
}