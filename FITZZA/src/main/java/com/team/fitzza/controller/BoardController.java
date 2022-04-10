package com.team.fitzza.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	@RequestMapping(value="/board/reportOk", method= {RequestMethod.POST})
	public int writeOk(@RequestParam BoardVO vo, HttpSession session) {
		vo.setUser_id((String)session.getAttribute("logId"));// 신고하는 유저의 아이디 = 로그인된 아이디	
		
		System.out.println(vo.getUser_id());
		System.out.println(vo.getBoard_num());
		
		return service.reportInsert(vo);
	}
}