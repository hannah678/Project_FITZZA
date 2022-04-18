package com.team.fitzza.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.fitzza.service.BoardService;
import com.team.fitzza.vo.BoardVO;

@Controller
public class VoteLikeController {
	@Inject
	BoardService service;
	
	
	@ResponseBody //Ajax
	@RequestMapping(value = "/board/Like", method=RequestMethod.POST)
	public int Like(HttpSession session, @RequestParam("board_num") int board_num) throws Exception {
		BoardVO vo = new BoardVO();
		vo.setUser_id((String)session.getAttribute("logId"));
		vo.setBoard_num(board_num);
		
		int cnt = service.LikeCount(vo);
		System.out.println(cnt);
		if(cnt==0) {
			service.LikeInsert(vo);
		}else {
			service.LikeDelete(vo);
		}
		return cnt;
	}
}
