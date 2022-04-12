package com.team.fitzza.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.BoardService;
import com.team.fitzza.service.MemberService;
import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.MemberVO;

@RestController
public class MemberController {
	@Inject //서비스 객체 만들기
	MemberService service;
	@Inject
	BoardService Bservice;
	
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
	@GetMapping("member/join")
	public String memberForm() {
		return "member/join"; // member폴더에 memberForm.jsp파일을 뷰로 사용한다.
	}
	
	
	// 회원등록
	@PostMapping("member/joinOk")
	public String memberFormOk(MemberVO vo, Model model) {
		// 회원등록
		int cnt = service.memberInsert(vo);
		
		// 클라이언트 페이지로 insert 결과를 보낸다.
		model.addAttribute("cnt",cnt);
		return "member/joinOk";
	}
	
	//마이페이지로 가기위한 비밀번호 입력 페이지
	@GetMapping("member/pwdCheck")
	public ModelAndView pwdCheck(HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		
		MemberVO vo = service.memberSelect(user_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		
		mav.setViewName("member/pwdCheck");
		return mav;
	}
	
	//정보수정으로 가는 pwdCheckOk
	@PostMapping("member/pwdCheckOk")
	public ModelAndView pwdCheckOk(MemberVO vo, HttpSession session) {
		// session 로그인 아이디 
		vo.setUser_id((String)session.getAttribute("logId"));
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO pvo = service.pwdCheck(vo);
		
		if (pvo.getUser_pwd().equals(vo.getUser_pwd())) {
			mav.setViewName("member/memberEdit");
			System.out.println("맞았습니다");
			System.out.println(pvo.getUser_pwd());
			System.out.println(vo.getUser_pwd());
			
			mav.addObject("vo",service.memberSelect(vo.getUser_id()));
		}else {
			mav.setViewName("redirect:pwdCheck");
			System.out.println("틀렸습니다.");
			System.out.println(pvo.getUser_pwd());
			System.out.println(vo.getUser_pwd());
		}
		
		
		
		return mav;
	}
	
	
	// 회원정보수정 (폼)
	@GetMapping("member/memberEdit")
	public ModelAndView memberEdit(HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		
		MemberVO vo = service.memberSelect(user_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		
		mav.setViewName("member/memberEdit");
		return mav;
	}
	
	// 회원정보수정 (DB)
	@PostMapping("member/memberEditOk")
	public String memberEditOk(MemberVO vo, HttpSession session) {
		// session 로그인 아이디 
		vo.setUser_id((String)session.getAttribute("logId"));
		
		service.memberUpdate(vo);
		
		return "redirect:memberEdit";
	}
	
	//마이페이지
	@GetMapping("member/myPage")
	public ModelAndView mypage(HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		MemberVO vo = service.myPage(user_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("lst1", Bservice.todayWriterSelect(user_id));
		mav.addObject("lst2", Bservice.recommendWriterSelect(user_id));
		mav.addObject("lst3", Bservice.oldWriterSelect(user_id));	
		mav.addObject("lst4", Bservice.reviewWriterSelect(user_id));
		mav.addObject("lst5", Bservice.qnaWriterSelect(user_id));
		mav.addObject("lst6", Bservice.voteWriterSelect(user_id));		
		mav.setViewName("/member/myPage");
		return mav;
	}
	
	//회원 탈퇴
	@GetMapping("member/byeCheck")
	public ModelAndView byeCheck(HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		MemberVO vo = service.memberSelect(user_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("member/byeCheck");
		
		return mav;
	}
	
	@PostMapping("member/byeOk")
	public String byeOk(MemberVO vo, HttpSession session) {
		
		System.out.println("byeOk start!");
		// session 로그인 아이디 
		vo.setUser_id((String)session.getAttribute("logId"));

		System.out.println(vo.getEmail());
		service.selfBye(vo);
		System.out.println(vo.getEmail());
		service.memberBye(vo);
		System.out.println(vo.getEmail());
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 아이디 중복검사
	@PostMapping("/member/memberIdCheck")
	@ResponseBody
	public int idCheck(String user_id) {
		System.out.println(user_id);
		int cnt = service.idCheck(user_id);
		System.out.println(cnt);
		return cnt;
	}
	//닉네임 중복검사
	@PostMapping("/member/memberNickCheck")
	@ResponseBody
	public int nickCheck(String user_nickname) {
		System.out.println(user_nickname);
		int cnt = service.nickCheck(user_nickname);
		System.out.println(cnt);
		return cnt;
	}
	
	
}
