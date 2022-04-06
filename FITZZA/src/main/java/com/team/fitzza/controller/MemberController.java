package com.team.fitzza.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.MemberService;
import com.team.fitzza.vo.MemberVO;

@Controller
public class MemberController {
	@Inject //서비스 객체 만들기
	MemberService service;
	
	//로그인폼으로 이동
	@GetMapping("/member/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	
	//로그인
	@PostMapping("/member/loginOk")
	public ResponseEntity<String> loginOk(MemberVO vo, HttpSession session){
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
	
	//로그아웃
	@GetMapping("/member/logout")
	public ModelAndView logout(HttpSession session) {
	   //세션제거 = 로그아웃
	   //새로운 세션이 할당된다.
	   session.invalidate();
	      
	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("redirect:/");
	   return mav;
	}
	
	//회원가입폼으로 이동하는 매핑
	@GetMapping("memberForm")
	public String memberForm() {
		return "member/memberForm"; // member폴더에 memberForm.jsp파일을 뷰로 사용한다.
	}
	
	
	// 회원등록
	@PostMapping("memberOk")
	public String memberFormOk(MemberVO vo, Model model) {
		// 회원등록
		int cnt = service.memberInsert(vo);
		
		// 클라이언트 페이지로 insert 결과를 보낸다.
		model.addAttribute("cnt",cnt);
		return "member/memberResult";
	}
	
	// 회원정보수정 (폼)
	@GetMapping("memberEdit")
	public ModelAndView memberEdit(HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		
		MemberVO vo = service.memberSelect(user_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		
		mav.setViewName("member/memberEdit");
		return mav;
	}
	
	// 회원정보수정 (DB)
	@PostMapping("memberEditOk")
	public ModelAndView memberEditOk(MemberVO vo, HttpSession session) {
		// session 로그인 아이디 
		vo.setUser_id((String)session.getAttribute("logId"));
		
		service.memberUpdate(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:memberEdit");
		return mav;
	}
	
	// 아이디 중복검사
	@PostMapping("memberIdCheck")
	@ResponseBody
	public int idCheck(String user_id) {
		System.out.println(user_id);
		int cnt = service.idCheck(user_id);
		System.out.println(cnt);
		return cnt;
	}
}
