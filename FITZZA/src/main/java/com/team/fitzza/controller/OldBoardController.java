package com.team.fitzza.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.nio.file.spi.FileSystemProvider;
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
import com.team.fitzza.service.OldBoardService;
import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.PagingVO;

@Controller
public class OldBoardController {
	
	@Inject
	OldBoardService service;
	
	@Inject
	BoardService Bservice;
	
	@Inject
	MemberService Mservice;
	
	@GetMapping("/board/old/oldList")
	public ModelAndView dataList() {
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("/board/old/oldList");
		return mav;
	}
	
	@GetMapping("/board/old/search")
	   public ModelAndView search(String searchKey, String searchWord) {
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("/board/old/oldList");
	      return mav;
	   }
	
	@ResponseBody //Ajax
	@RequestMapping(value = "/board/old/oldLists")
	public List<BoardVO> newsMoreView(PagingVO pvo, Model model
			, @RequestParam(value="startNum", required=false)String startNum) throws Exception {
		System.out.println("페이징 브이오다"+pvo);
//		startNum="5";
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(5);
		return service.oldBoardSelectAll(pvo);
	}
	@ResponseBody //Ajax
	@RequestMapping(value = "/board/old/searchLists")
	public List<BoardVO> searchMoreView(@RequestParam(value="startNum", required=false)String startNum,
			String searchKey, String searchWord) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 5;
		System.out.println("searchKey -> "+searchKey);
		System.out.println("searchWord -> "+searchWord);
		return service.oldBoardSearch(searchKey, "%"+searchWord+"%", start, end);
	}
	
	
	// 글쓰기 폼
	@GetMapping("/board/old/oldWrite")
	public String oldWrite() {
		
		return "/board/old/oldWrite";
	}

	@PostMapping("/board/old/oldWriteOk")
	public ResponseEntity<String> boardWriteOk(BoardVO vo, HttpServletRequest request) {
		System.out.println("oldWriteOk START");
		// vo : subject, content는 request가 됨.
		vo.setIp(request.getRemoteAddr()); // 접속자 아이피
		vo.setUser_id((String)request.getSession().getAttribute("logId"));	// 글쓴이
		
		// 파일 업로드에 관련된 multipartRequest객체를 구해야함
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		
		String path = request.getSession().getServletContext().getRealPath("/upload"); // 파일업로드를 위한 업로드 위치의 절대주소
		System.out.println("path -> "+path);
		try {
			// 파일 업로드를 처리하기 위해서 request 객체에서 multipart객체를 구하여야 한다.
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			//mr에 파일의 수만큼 MultipartFile객체가존재한다
			List<MultipartFile> files = mr.getFiles("filename");
			System.out.println("업로드 파일 수 -> "+files.size());
			
			if(files!=null) {	//if 111
				int cnt = 1;	// 4번에서 업로드 순서에 따라 filename1, filename2 파일명을 대입하기 위한 변수
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
						
						//	파일이 존재하는 지 확인	true:파일이 존재/	false:파일 없음
						if(f.exists()) {	//if 444
							for(int renameNum=1;; renameNum++) {	//for 555
								//	확장자와 파일을 분리한다.
								int point = orgFileName.lastIndexOf(".");
								String fileName = orgFileName.substring(0, point);
								String ext = orgFileName.substring(point+1);
								
								f = new File(path, fileName+" ("+renameNum+")."+ext);
								if(!f.exists()) {	//if 666 , 새로 생성된 파일 객체가 없으면
									orgFileName = f.getName();
									break;
								}	//if 666
								
							}	//for 555
							
						}	//if 444
						//	4. 파일 업로드 구현
						try {
							mf.transferTo(f);	// 실제 업로드가 일어나는(발생하는) 시점
							System.out.println(f);
						}catch(Exception ee) {
							ee.printStackTrace();
						}
						
						//	5. 업로드한(새로운파일명) vo에 셋팅
						if(cnt==1) vo.setFile1(orgFileName);
						if(cnt==2) vo.setFile2(orgFileName);
						if(cnt==3) vo.setFile3(orgFileName);
						if(cnt==4) vo.setFile4(orgFileName);
						if(cnt==5) vo.setFile5(orgFileName);
						cnt++;
					}	//if 333
					
				}// for 222
				
			}//	if 111
			System.out.println(vo.getFile1());
			System.out.println(vo.getFile2());
			System.out.println(vo.getFile3());
			System.out.println(vo.getFile4());
			System.out.println(vo.getFile5());
			//DB등록
			Bservice.BoardInsert(vo);
			String user_id = (String)request.getSession().getAttribute("logId");
			vo.setBoard_num(Bservice.boardNum(user_id));
			service.oldBoardDetailInsert(vo);
			Bservice.BoardFileInsert(vo);
			service.oldBoardStateInsert(vo);
			Mservice.expUp_board(user_id);
			//레코드 추가 성공
			String msg = "<script>alert('자료실에 글이 등록되었습니다');location.href='/board/old/oldList';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			
		}catch(Exception e) {
			e.printStackTrace();
			//레코드 추가실패
			//파일을지우기
				fileDelete(path, vo.getFile1());
				fileDelete(path, vo.getFile2());
				fileDelete(path, vo.getFile3());
				fileDelete(path, vo.getFile4());
				fileDelete(path, vo.getFile5());
				
			//메세지
			String msg = "<script>alert('자료실 글 등록에 실패하였습니다');history.back();</script>";
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
	
	//글 내용보기
	@GetMapping("/board/old/oldView")
	public ModelAndView oldBoardView(int board_num) {
		ModelAndView mav = new ModelAndView();
		System.out.println("조회수 증가!");
		Bservice.hitCount(board_num); //조회수 증가
		mav.addObject("vo", service.oldBoardView(board_num));
		mav.setViewName("/board/old/oldView");
		return mav;
	}
	
	//글 수정폼
	@GetMapping("/board/old/oldEdit")
	public ModelAndView oldEdit(int board_num) {
		ModelAndView mav = new ModelAndView();
		BoardVO vo =service.oldBoardView(board_num);
		mav.addObject("vo", vo);
		mav.setViewName("/board/old/oldEdit");
		return mav;
	}
	
	//수정(DB)
	@PostMapping("/board/old/oldEditOk")
	public ResponseEntity<String> oldEditOk(BoardVO vo, HttpSession session, HttpServletRequest req) {
		System.out.println("oldEditOk START!!!");
		vo.setUser_id((String)session.getAttribute("logId"));
		String path = session.getServletContext().getRealPath("/upload");
		
			
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		List<String> fileList = new ArrayList<String>();	// 새로 DB에 업데이트 할 파일명 정리하는 컬렉션
		List<String> newUpload = new ArrayList<String>();	// 폼에서 온 파일중 게시물에 없는 파일만 고른 컬렉션
		try {
			//	1. DB에서 파일명 가져오기
			BoardVO dbfileVO = Bservice.getFileName(vo.getBoard_num());
			
			//	2. 새로 업로드 하기
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;

			// 3. 새로 업로드된 MultipartFile객체를 얻어오기
			List<MultipartFile> newFileList = mr.getFiles("filename");
			if(newFileList != null) {	// 새로 업로드 되는 파일이 없어도 input file 갯수만큼 
										// 객체가 들어오는듯 함
				for(int i=0; i<newFileList.size(); i++) {
					MultipartFile newMf = newFileList.get(i);
					String newUploadFilename = newMf.getOriginalFilename();
					System.out.println((i+1)+"번째 파일 -> "+newUploadFilename);
					
					//-------------------------------------------
					// input type file에는 value 설정 불가
					//-------------------------------------------
					
					// 리네임 작업
					//폼에서 새로 업로드 한 파일이 있을 경우 
					if(newUploadFilename != null && !newUploadFilename.equals("")) {
						
						File f = new File(path, newUploadFilename);
						if (f.exists()) {
							// 있으면 여기서 rename
							for (int n = 1;; n++) {
								int point = newUploadFilename.lastIndexOf(".");
								String fileNameNoExt = newUploadFilename.substring(0, point);
								String ext = newUploadFilename.substring(point + 1);

								// 새로운 파일명 만들어 존재유무 확인
								String nf = fileNameNoExt + " (" + n + ")." + ext;
								f = new File(path, nf);
								if (!f.exists()) { // 없으면
									newUploadFilename = nf;
									break;
								}
							} // for
						}
						// 업로드
						try {
							newMf.transferTo(f);
							newUpload.add(newUploadFilename);
						} catch (Exception ee) {}
						
						if(i==0) {
							if(dbfileVO.getFile1()!=null) {
								fileDelete(path, dbfileVO.getFile1());
							}
							dbfileVO.setFile1(newUploadFilename);
						}
						if(i==1) {
							if(dbfileVO.getFile2()!=null) {
								fileDelete(path, dbfileVO.getFile2());
							}
							dbfileVO.setFile2(newUploadFilename);
						}
						if(i==2) {
							if(dbfileVO.getFile3()!=null) {
								fileDelete(path, dbfileVO.getFile3());
							}
							dbfileVO.setFile3(newUploadFilename);
						}
						if(i==3) {
							if(dbfileVO.getFile4()!=null) {
								fileDelete(path, dbfileVO.getFile4());
							}
							dbfileVO.setFile4(newUploadFilename);
						}
						if(i==4) {
							if(dbfileVO.getFile5()!=null) {
								fileDelete(path, dbfileVO.getFile5());
							}
							dbfileVO.setFile5(newUploadFilename);
						}
						
						
						//fileList.add(newUploadFilename);	//db에 등록할 파일명에 추가
						//newUpload.add(newUploadFilename);	//새로 업로드 목록 추가		
					}else {
						//폼에서 업로드한 파일이 없을 경우 원래 파일명 그대로 다시 insert
						//null도 다시 insert
						//(폼에 input file 태그가 있다면 업로드 하지 않아도 빈 값이 반드시 들어옴)
						
					}
				}//for
			}
			dbfileVO.setBoard_num(vo.getBoard_num());
			// DB update
			Bservice.BoardUpdate(vo);
			service.oldBoardDetailUpdate(vo);
			Bservice.BoardFileUpdate(dbfileVO);
			service.oldBoardStateUpdate(vo);	
			
			// 글 내용보기로 이동
			String msg = "<script>alert('자료실 글이 수정되었습니다.\\n글내용보기로 이동합니다');";
			msg += "location.href='/board/old/oldView?board_num="+vo.getBoard_num()+"';</script>";
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			//DB잘못수정했을때
			for(String fname:newUpload) {
				fileDelete(path, fname);
			}
			
			//수정페이지로 이동
			String msg = "<script>";
			msg += "alert('글 수정 실패하였습니다'\\n수정폼으로 이동합니다)";
			msg += "history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		/*
		 * for(String d:fileList) { System.out.println(d); }
		 */
		return entity;		
	}

	
	
	
	
}