package com.team.fitzza.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.BoardService;
import com.team.fitzza.vo.BoardVO;

@Controller
public class VoteLikeController {
	@Inject
	BoardService service;
	
	
	@ResponseBody //Ajax
	@RequestMapping(value = "/board/Like", method=RequestMethod.POST)
	public Map<String, Object> Like(HttpSession session, @RequestParam("board_num") int board_num) throws Exception {
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
		Map<String, Object> retVal = new HashMap<String, Object>();
        
        //성공했다고 처리
        retVal.put("cnt", cnt);
        retVal.put("like_num", service.OneBoardSelectLike(board_num));
        
		return retVal;
	}
}
