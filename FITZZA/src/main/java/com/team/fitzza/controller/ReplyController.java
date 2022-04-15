package com.team.fitzza.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team.fitzza.service.MemberService;
import com.team.fitzza.service.ReplyService;
import com.team.fitzza.vo.ReplyVO;


@RestController
public class ReplyController {
	@Inject
	ReplyService service;
	@Inject
	MemberService Mservice;
	
	// 댓글등록
	@RequestMapping(value="/reply/replyWrite", method=RequestMethod.POST)
	public int replyWrite(ReplyVO vo, HttpSession session) {
		System.out.println("replyWrite START@@");
		vo.setUser_id((String)session.getAttribute("logId"));
		String user_id = vo.getUser_id();
		Mservice.expUp_reply(user_id);
		return service.replyWrite(vo);
	}
	
	// 댓글목록
	@RequestMapping("/reply/replyList")
	public List<ReplyVO> replyList(int board_num) {
		List<ReplyVO> lst = service.replyList(board_num);
		System.out.println(lst.size());
		return lst;
	}
	
	// 댓글수정
	@PostMapping("/reply/replyEditOk")
	public int replyEditOk(ReplyVO vo, HttpSession session) {
		vo.setUser_id((String)session.getAttribute("logId"));
		return service.replyEdit(vo);
	}
	
	// 댓글삭제
	@GetMapping("/reply/replyDelete")
	public int replyDelete(int reply_num, HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		Mservice.expDown_reply(user_id);
		
		return service.replyDel(reply_num, user_id);
	}
	
	
}
