package com.team.fitzza.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.MemberService;
import com.team.fitzza.vo.MemberVO;

@Controller
public class MemberController {
	@Inject //서비스 객체 만들기
	MemberService service;
	
	@GetMapping("/member/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	
	@PostMapping("/member/loginOk")
	public ResponseEntity<String> loginOk(MemberVO vo, HttpSession session){
		System.out.println("MeberController:::loginOk START!");
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type","text/html; charset=utf-8");
		//예외처리
	      try {
	         MemberVO rVo = service.loginCheck(vo);
	         if(rVo !=null) { //로그인 성공
	            session.setAttribute("logId", rVo.getUser_id());
	            session.setAttribute("logNickName", rVo.getUser_nickname());
	            session.setAttribute("logStatus", "Y");
	            
	            String msg = "<script>location.href='/';</script>";
	            entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
	            System.out.println("userid : " + rVo.getUser_id());
	            System.out.println("userpwd : " + rVo.getUser_pwd());
	         }else { //로그인 실패
	            throw new Exception(); //예외처리로 보내기
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	         //로그인 실패
	         //다시 로그인폼으로 보내기
	         String msg="<script>alert('로그인 실패하였습니다.'); history.go(-1);</script>";
	         entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
	      }
	      return entity;
	   }
	   @GetMapping("/member/logout")
	   public ModelAndView logout(HttpSession session) {
	      //세션제거 = 로그아웃
	      //새로운 세션이 할당된다.
	      session.invalidate();
	      
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("redirect:/");
	      return mav;
	   }
	
}
