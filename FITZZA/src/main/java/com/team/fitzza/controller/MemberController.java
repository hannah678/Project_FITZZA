package com.team.fitzza.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import com.team.fitzza.vo.ReplyVO;

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
	
	//메일 인증코드 발송
	@PostMapping("/member/mailAuth")
	@ResponseBody
	public String sendMail(String mail) throws Exception {
		String authcode = "";
		Random random = new Random();

		authcode += random.nextInt(9000) + 1000;
		
		Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", "smtp.naver.com");
        p.put("mail.smtp.auth","true");
        p.put("mail.smtp.port", "587");
           
        String id = "메일주소"; //보내는 사람 메일주소
		String pwd = "비밀번호"; //보내는 사람 비밀번호
		
        Authenticator auth = new Authenticator() {
        	public PasswordAuthentication getPasswordAuthentication() {
    	        return new PasswordAuthentication(id, pwd);
    	    }
		};
        //session 생성 및  MimeMessage생성
        Session session = Session.getInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
         
        try{
            //메일 전송시간
            msg.setSentDate(new Date());
            
            //보내는 사람
            InternetAddress from = new InternetAddress(id);
            msg.setFrom(from);
            
            //받는 사람
            InternetAddress to = new InternetAddress(mail);
            msg.setRecipient(Message.RecipientType.TO, to);
            //제목
            msg.setSubject("FITZZA에 오신것을 환영합니다! 가입 완료를 위해서 인증코드를 입력해 주세요", "UTF-8");
            //내용
            msg.setText("인증코드는 ["+authcode+"] 입니다", "UTF-8");
            //헤더
            msg.setHeader("content-Type", "text/html");
            //메일보내기
            javax.mail.Transport.send(msg, msg.getAllRecipients());
             
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }catch (Exception msg_e) {
            msg_e.printStackTrace();
        }
		
		return authcode;
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
	
	//마이페이지 프로필
	@GetMapping("member/myPage")
	public ModelAndView mypage(HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		MemberVO vo = service.myPage(user_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("/member/myPage");
		return mav;
	}
	//마이페이지 더보기페이징(1)
	@ResponseBody //Ajax
	@RequestMapping(value = "/member/myPage01")
	public List<BoardVO> MoreView01(PagingVO pvo, HttpSession session, @RequestParam(value="startNum01", required=false)String startNum01) throws Exception {
		String user_id = (String)session.getAttribute("logId");
		pvo.setStart(Integer.parseInt(startNum01));
		pvo.setEnd(5);
		return Bservice.todayWriterSelect(user_id, pvo);
	}
	//마이페이지 더보기페이징(2)
	@ResponseBody //Ajax
	@RequestMapping(value = "/member/myPage02")
	public List<BoardVO> MoreView02(PagingVO pvo, HttpSession session, @RequestParam(value="startNum02", required=false)String startNum02) throws Exception {			
		String user_id = (String)session.getAttribute("logId");
		pvo.setStart(Integer.parseInt(startNum02));
		pvo.setEnd(5);
		return Bservice.recommendWriterSelect(user_id, pvo);
	}
	//마이페이지 더보기페이징(3)
	@ResponseBody //Ajax
	@RequestMapping(value = "/member/myPage03")
	public List<BoardVO> MoreView03(PagingVO pvo, HttpSession session, @RequestParam(value="startNum03", required=false)String startNum03) throws Exception {
		String user_id = (String)session.getAttribute("logId");
		pvo.setStart(Integer.parseInt(startNum03));
		pvo.setEnd(5);
		return Bservice.oldWriterSelect(user_id, pvo);
	}
	//마이페이지 더보기페이징(4)
	@ResponseBody //Ajax
	@RequestMapping(value = "/member/myPage04")
	public List<BoardVO> MoreView04(PagingVO pvo, HttpSession session, @RequestParam(value="startNum04", required=false)String startNum04) throws Exception {
		String user_id = (String)session.getAttribute("logId");
		pvo.setStart(Integer.parseInt(startNum04));
		pvo.setEnd(5);
		return Bservice.oldWriterSelect(user_id, pvo);
	}
	//마이페이지 더보기페이징(5)
	@ResponseBody //Ajax
	@RequestMapping(value = "/member/myPage05")
	public List<BoardVO> MoreView05(PagingVO pvo, HttpSession session, @RequestParam(value="startNum05", required=false)String startNum05) throws Exception {
		String user_id = (String)session.getAttribute("logId");
		pvo.setStart(Integer.parseInt(startNum05));
		pvo.setEnd(5);
		return Bservice.qnaWriterSelect(user_id, pvo);
	}
	//마이페이지 더보기페이징(6)
	@ResponseBody //Ajax
	@RequestMapping(value = "/member/myPage06")
	public List<BoardVO> MoreView06(PagingVO pvo, HttpSession session, @RequestParam(value="startNum06", required=false)String startNum06) throws Exception {
		String user_id = (String)session.getAttribute("logId");
		pvo.setStart(Integer.parseInt(startNum06));
		pvo.setEnd(5);
		return Bservice.voteWriterSelect(user_id, pvo);
	}
	//마이페이지 댓글
		@ResponseBody //Ajax
		@RequestMapping(value = "/member/myPage07")
		public List<ReplyVO> mypageReplyView(PagingVO pvo, HttpSession session
				, @RequestParam(value="startNum07", required=false)String startNum07) throws Exception {
			System.out.println("댓글페이징");
			String user_id = (String)session.getAttribute("logId");
			
			pvo.setStart(Integer.parseInt(startNum07));
			pvo.setEnd(5);
			return Bservice.replyWriterSelect(user_id, pvo);
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
