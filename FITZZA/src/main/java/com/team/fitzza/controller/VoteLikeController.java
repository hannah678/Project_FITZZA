package com.team.fitzza.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.BoardService;
import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.PagingVO;

@Controller
public class VoteLikeController {
	@Inject
	BoardService service;
	
	
	@ResponseBody //Ajax
	@RequestMapping(value = "/board/Like")
	public int Like(BoardVO vo, @RequestParam String user_id, @RequestParam String board_num) throws Exception {
		int cnt = service.LikeCount(vo);
		
		if(cnt==0) {
			service.LikeInsert(vo);
			service.LikeUpdate(vo);
		}else {
			service.LikeDelete(vo);
		}
		return cnt;
	}
}
