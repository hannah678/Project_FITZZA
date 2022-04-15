package com.team.fitzza.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.BoardService;
import com.team.fitzza.vo.BoardVO;

@Controller
public class TodayCodiController {
	@Inject
	BoardService service;
	
	@GetMapping("/board/todayCodi/todayCodiList")
	public ModelAndView dataList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst", service.BoardSelectAll(1));
		mav.setViewName("/board/todayCodi/todayCodiList");
		return mav;
	}
	
	// 글쓰기 폼
		@GetMapping("/board/todayCodi/todayCodiWrite")
		public String reviewWrite() {	
			return "/board/todayCodi/todayCodiWrite";
		}

		@PostMapping("/board/todayCodi/todayCodiWriteOk")
		public ResponseEntity<String> boardWriteOk(BoardVO vo, HttpServletRequest request) {
			vo.setIp(request.getRemoteAddr()); // 접속자 아이피
			vo.setUser_id((String)request.getSession().getAttribute("logId"));	// 글쓴이			
			
			// 파일 업로드에 관련된 multipartRequest객체를 구해야함
			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
			
			String path = request.getSession().getServletContext().getRealPath("/upload/todayCodi"); // 파일업로드를 위한 업로드 위치의 절대주소
			System.out.println("path -> "+path);
			try {
				// 파일 업로드를 처리하기 위해서 request 객체에서 multipart객체를 구하여야 한다.
				MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
				
				//mr에 파일의 수만큼 MultipartFile객체가존재한다
				List<MultipartFile> files = mr.getFiles("filename");
				System.out.println("업로드 파일 수 -> "+files.size());
				
				if(files!=null) {	//if 111
					//첨부파일수 만큼 반복하여 업로드한다.
					for(int i=0; i<files.size(); i++) {	// for 222
						//	1. MultipartFile객체 얻어오기
						MultipartFile mf = files.get(i);
						
						//	2. 업로드한 실제 파일명을 구하기
						String orgFileName = mf.getOriginalFilename();
						System.out.println("orgFileName -> "+ orgFileName );
						
						//	3. rename하기
						if(orgFileName!=null && !orgFileName.equals("")) {	//if 333, 파일명이 존재하면
							File f = new File(path, orgFileName);
							
								for(int renameNum=0;; renameNum++) {	//for 555
									//	확장자와 파일을 분리한다.
									if(renameNum<10) {
										int point = orgFileName.lastIndexOf(".");
										String ext = orgFileName.substring(point+1);
										
										f = new File(path, "0"+renameNum+"."+ext);
											if(!f.exists()) {	//if 666 , 새로 생성된 파일 객체가 없으면
												orgFileName = f.getName();
												break;
											}
									}else {
										int point = orgFileName.lastIndexOf(".");
										String ext = orgFileName.substring(point+1);
										
										f = new File(path, renameNum+"."+ext);
											if(!f.exists()) {	//if 666 , 새로 생성된 파일 객체가 없으면
												orgFileName = f.getName();
												break;	
											}//if 666
									}

									
								}	//for 555
								//	5. 업로드한(새로운파일명) vo에 셋팅
							vo.setFile1(orgFileName);
							try {
								mf.transferTo(f);	// 실제 업로드가 일어나는(발생하는) 시점
								System.out.println(f);
							}catch(Exception ee) {
								ee.printStackTrace();
							}
						}	//if 333
					}// for 222
				}//	if 111
				System.out.println(vo.getFile1());
				//DB등록
				service.BoardInsert(vo);
				String user_id = (String)request.getSession().getAttribute("logId");
				vo.setBoard_num(service.boardNum(user_id));
				service.BoardFileInsert(vo);
				//레코드 추가 성공
				String msg = "<script>alert('오늘의 코디가 등록되었습니다');location.href='/board/todayCodi/todayCodiList';</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
				
			}catch(Exception e) {
				e.printStackTrace();
				//레코드 추가실패
				//파일을지우기
					fileDelete(path, vo.getFile1());
					
				//메세지
				String msg = "<script>alert('글 등록에 실패하였습니다');history.back();</script>";
				//이전페이지로 보내기
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);	//400
			}
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

