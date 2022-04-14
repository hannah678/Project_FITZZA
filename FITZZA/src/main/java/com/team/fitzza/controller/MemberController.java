package com.team.fitzza.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.BoardService;
import com.team.fitzza.service.MemberService;
import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.MemberVO;
import com.team.fitzza.vo.PagingVO;

@Controller
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
	            session.setAttribute("logPermission", rVo.getPermission());
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
//		mav.addObject("lst1", Bservice.todayWriterSelect(user_id));
//		mav.addObject("lst2", Bservice.recommendWriterSelect(user_id));
//		mav.addObject("lst3", Bservice.oldWriterSelect(user_id));	
//		mav.addObject("lst4", Bservice.reviewWriterSelect(user_id));
//		mav.addObject("lst5", Bservice.qnaWriterSelect(user_id));
//		mav.addObject("lst6", Bservice.voteWriterSelect(user_id));		
		mav.setViewName("/member/myPage");
		return mav;
	}
	//마이페이지 더보기페이징
	@ResponseBody //Ajax
	@RequestMapping(value = "/member/myPages")
	public List<BoardVO> MoreView(PagingVO pvo, HttpSession session
			, @RequestParam(value="startNum", required=false)String startNum) throws Exception {
		System.out.println("페이징 브이오다"+pvo);
		
		String user_id = (String)session.getAttribute("logId");
		
		
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(5);
		return Bservice.oldWriterSelect(user_id, pvo);
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
	
	//프로필 사진 바꾸기
	@PostMapping("/member/changeProfileImg")
	public ResponseEntity<String> changeProfileImg(MemberVO vo, HttpSession session, HttpServletRequest req) {
		vo.setUser_id((String)session.getAttribute("logId"));
		String path = session.getServletContext().getRealPath("/upload");
			
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		List<String> newUpload = new ArrayList<String>();	// 폼에서 온 파일중 게시물에 없는 파일만 고른 컬렉션
		try {
			//	1. DB에서 파일명 가져오기
			MemberVO dbfileVO = service.getFileName(vo.getUser_id());
			
			//	2. 새로 업로드 하기
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;

			// 3. 새로 업로드된 MultipartFile객체를 얻어오기
			List<MultipartFile> newFileList = mr.getFiles("filename");
			if(newFileList != null) {	// 새로 업로드 되는 파일이 없어도 input file 갯수만큼 
										// 객체가 들어오는듯 함
				for(int i=0; i<newFileList.size(); i++) {
					MultipartFile newMf = newFileList.get(i);
					String newUploadFilename = newMf.getOriginalFilename();
					System.out.println(newUploadFilename);
					// 리네임 작업
					//폼에서 새로 업로드 한 파일이 있을 경우 
					if(newUploadFilename != null && !newUploadFilename.equals("")) {
						File f = new File(path, newUploadFilename);
						if (f.exists()) {
							System.out.println("파일명 있음");
							// 있으면 여기서 rename
							for (int n = 1;; n++) {
								int point = newUploadFilename.lastIndexOf(".");
								String fileNameNoExt = newUploadFilename.substring(0, point);
								String ext = newUploadFilename.substring(point + 1);

								// 새로운 파일명 만들어 존재유무 확인
								String nf = fileNameNoExt + " (" + n + ")." + ext;
								f = new File(path, nf);
								if (!f.exists()) { // 없으면
									System.out.println("파일명 바꿨음");
									newUploadFilename = nf;
									break;
								}
								System.out.println(f);
							} // for
						}
						// 업로드
							newMf.transferTo(f);
							newUpload.add(newUploadFilename);
							System.out.println(newUploadFilename);
							dbfileVO.setProfile_image(newUploadFilename);
					}
				}//for
			}
			dbfileVO.setUser_id(vo.getUser_id());
			// DB update
			service.changeProfileImg(dbfileVO);
			System.out.println(dbfileVO);
			String msg = "<script>location.href='/member/myPage';</script>";

			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			//DB잘못수정했을때
			for(String fname:newUpload) {
				fileDelete(path, fname);
			}
			
			//마이페이지로 이동
			String msg = "<script>";
			msg += "alert('이미지 업로드 실패하였습니다.)";
			msg += "history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		/*
		 * for(String d:fileList) { System.out.println(d); }
		 */
		return entity;		
	}
	// 파일지우기
	public void fileDelete(String p, String f) {
		if(f != null) {	//파일명이 있을때만
			File file = new File(p, f);
			file.delete();
		}
	}
	
}
