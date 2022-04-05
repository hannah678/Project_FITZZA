package com.team.fitzza.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.BoardService;
import com.team.fitzza.vo.BoardVO;

@RestController
public class BoardController {
	@Inject
	BoardService service;
	
	//글목록
	@GetMapping("/board/boardList")
	public ModelAndView allSelect() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst", service.boardList());
		mav.setViewName("board/boardList");
		return mav;
	}
	
	//글등록 폼
	@GetMapping("/board/boardWrite")
	public ModelAndView boardWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/boardWrite");
		return mav;
	}
	
	//글등록
	@PostMapping("/board/boardWriteOk")
	public ResponseEntity<String> boardWriteOk(BoardVO vo, HttpServletRequest request){
		vo.setUser_id((String)request.getSession().getAttribute("logId"));
		vo.setIp(request.getRemoteAddr());
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html",Charset.forName("UTF-8")));
		
		try {
			//글 등록
			service.boardInsert(vo);
			
			//글 목록으로 이동
			String msg = "<script>alert('글이 등록되었습니다.');location.href='/board/boardList';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			//글등록 실패
			//글등록폼으로 이동
			String msg = "<script>alert('글등록 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//글내용보기
	@RequestMapping("/board/boardView")
	public ModelAndView boardView(@RequestParam("board_num") int board_num) {
		ModelAndView mav = new ModelAndView();
		service.hitCount(board_num); //조회수 증가
		mav.addObject("vo", service.boardSelect(board_num));
		mav.setViewName("board/boardView");
		return mav;
	}
	
	//글수정 폼
	@GetMapping("/board/boardEdit")
	public ModelAndView boardEdit(int board_num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", service.boardSelect(board_num));
		mav.setViewName("board/boardEdit");
		return mav;
	}
	//글수정
	@PostMapping("/board/boardEditOk")
	public ResponseEntity<String> boardEditOk(BoardVO vo, HttpSession session) {
		vo.setUser_id((String)session.getAttribute("logId"));
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "text/html; charset=UTF-8");
		try {
			service.boardUpdate(vo);
			
			String msg = "<script>alert('글이 수정되었습니다.');"
					+ "location.href='/board/boardView?board_num="+vo.getBoard_num()+"';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('글수정 실패하였습니다.'); history.go(-1);</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//글삭제
	@GetMapping("/board/boardDel")
	public ModelAndView boardDel(int board_num, HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		ModelAndView mav = new ModelAndView();
		int result = service.boardDelete(board_num, user_id);
		if(result>0) { //삭제
			mav.setViewName("redirect:boardList");
		}else { //삭제안됨
			mav.addObject("board_num", board_num);
			mav.setViewName("redirect:boardView");
		}
		return mav;
	}
}