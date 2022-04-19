package com.team.fitzza.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.PagingVO;


@Controller
public class RecommendController {
	@Autowired
	BoardService service;
	
	@GetMapping("/board/recommend/recommendList")
	public String recommendBoardList() {
		
		return "/board/recommend/recommendList";
	}
	
	// 글쓰기 폼
	@GetMapping("/board/recommend/recommendWrite")
	public String recommendWrite() {
		
		return "/board/recommend/recommendWrite";
	}
	
	@ResponseBody //Ajax
	@RequestMapping(value = "/board/recommend/recommendLists")
	public List<BoardVO> recommendMoreView(PagingVO pvo, Model model
			, @RequestParam(value="startNum", required=false)String startNum) throws Exception {
		System.out.println("recommendMoreView START:::");
		System.out.println(Integer.parseInt(startNum));
		//startNum="5";
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(4);
		return service.BoardSelectAllSE(2,pvo);
	}
	
	//검색 기능
	@GetMapping("/board/recommend/search")
	public ModelAndView search(String searchKey, String searchWord) {
		System.out.println("search START!!!");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/recommend/recommendList");
		return mav;
	}
	
	@ResponseBody //Ajax
	@RequestMapping(value = "/board/recommend/searchLists")
	public List<BoardVO> searchMoreView(@RequestParam(value="startNum", required=false)String startNum,
			String searchKey, String searchWord) throws Exception {
		System.out.println("searchMoreView START!!!");
		int start = Integer.parseInt(startNum);
		int end = 5;
		System.out.println("searchKey -> "+searchKey);
		System.out.println("searchWord -> "+searchWord);
		return service.boardSearch(searchKey, "%"+searchWord+"%", start, end, 2);
	}
	
	@PostMapping("/board/recommend/recommendWriteOk")
	public ResponseEntity<String> boardWriteOk(BoardVO vo, HttpServletRequest request) {
		System.out.println("recommendWriteOk START");
		vo.setIp(request.getRemoteAddr()); // 접속자 아이피
		vo.setUser_id((String)request.getSession().getAttribute("logId"));	// 글쓴이
		
		
		// 파일 업로드에 관련된 multipartRequest객체를 구해야함
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		
		String path = request.getSession().getServletContext().getRealPath("/upload"); // 파일업로드를 위한 업로드 위치의 절대주소
		System.out.println("path -> "+path);
		try {
			System.out.println("try문");
			// 파일 업로드를 처리하기 위해서 request 객체에서 multipart객체를 구하여야 한다.
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			System.out.println("11121313131");
			System.out.println(mr);
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
			service.BoardInsert(vo);
			String user_id = (String)request.getSession().getAttribute("logId");
			vo.setBoard_num(service.boardNum(user_id));
			service.BoardFileInsert(vo);
			//레코드 추가 성공
			String msg = "<script>alert('자료실에 글이 등록되었습니다');location.href='/board/recommend/recommendList';</script>";
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
	
	//글 내용보기
	@GetMapping("/board/recommend/recommendView")
	public ModelAndView recommendBoardView(int board_num) {
		ModelAndView mav = new ModelAndView();
		System.out.println("조회수 증가!");
		service.hitCount(board_num); //조회수 증가
		mav.addObject("vo", service.BoardView(board_num));
		mav.setViewName("/board/recommend/recommendView");
		return mav;
	}
	
	//글 수정폼
	@GetMapping("/board/recommend/recommendEdit")
	public ModelAndView reviewEdit(int board_num) {
		ModelAndView mav = new ModelAndView();
		BoardVO vo =service.BoardView(board_num);
//				// DB에 첨부된 파일의 수를 구한다.
//				int fileCount =1;	//첫번째 첨부파일은 무조건 있음
//				if(vo.getFile2()!=null) {	// 두 번째 첨부파일 있으면 1증가
//					fileCount++;
//				}
//				mav.addObject("fileCount", fileCount);
		mav.addObject("vo", vo);
		mav.setViewName("/board/recommend/recommendEdit");
		return mav;
	}
	
	//수정(DB)
	@PostMapping("/board/recommend/recommendEditOk")
	public ResponseEntity<String> reviewEditOk(BoardVO vo, HttpSession session, HttpServletRequest req) {
		System.out.println("recommendEditOk START!!!");
		vo.setUser_id((String)session.getAttribute("logId"));
		String path = session.getServletContext().getRealPath("/upload");
		
			
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		List<String> fileList = new ArrayList<String>();	// 새로 DB에 업데이트 할 파일명 정리하는 컬렉션
		List<String> newUpload = new ArrayList<String>();	// 폼에서 온 파일중 게시물에 없는 파일만 고른 컬렉션
		try {
			//	1. DB에서 파일명 가져오기
			BoardVO dbfileVO = service.getFileName(vo.getBoard_num());
			fileList.add(dbfileVO.getFile1());
		
			//	2. 삭제된 파일이 있을 경우 List에서 같은 파일명을 지운다.
//					if(vo.getDelFile() != null) {		// null은 삭제파일이 없다
//						for(String delFile : vo.getDelFile()) {
//							fileList.remove(delFile);
//						}
//					}
			
			//	3. 새로 업로드 하기
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			
			// 새로 업로드된 MultipartFile객체를 얻어오기
			List<MultipartFile> newFileList = mr.getFiles("filename");
			if(newFileList != null) {	// 새로 업로드 된 파일이 있으면
				for(int i=0; i<newFileList.size(); i++) {
					MultipartFile newMf = newFileList.get(i);
					String newUploadFilename = newMf.getOriginalFilename();
					System.out.println((i+1)+"번째 파일 -> "+newUploadFilename);
					// 리네임 작업
					if(newUploadFilename != null && !newUploadFilename.equals("")) {
						File f = new File(path, newUploadFilename);
						if(fileList.contains(newUploadFilename)) {
							//이미 해당 글에 업로드 된 파일이라면 리네임이나 업로드하지 않음
						}else {
							//해당 글에는 없지만 이미 업로드 된 파일이라면
							//리네임 후 업로드
							if(f.exists()) {
								//있으면 여기서 rename
								for(int n=1;;n++) {
									int point = newUploadFilename.lastIndexOf(".");
									String fileNameNoExt = newUploadFilename.substring(0, point);
									String ext = newUploadFilename.substring(point+1);
									
									//새로운 파일명 만들어 존재유무 확인
									String nf = fileNameNoExt+ " ("+n+")."+ext;
									f = new File(path, nf);
									if(!f.exists()) {	//없으면
										newUploadFilename = nf;
										break;
									}
								}//for
							}
							//업로드
							try {
								newMf.transferTo(f);
							}catch(Exception ee) {}
						}
						
						//fileList.add(newUploadFilename);	//db에 등록할 파일명에 추가
						newUpload.add(newUploadFilename);	//새로 업로드 목록 추가		
					}
				}//for
			}//if
			else {
			}
			
			// fileList에 있는 DB에 등록할 파일명을 filename1, filename2에 셋팅
			for(int k=0; k<newUpload.size(); k++) {
				if(k==0) vo.setFile1(newUpload.get(k));
				if(k==1) vo.setFile2(newUpload.get(k));
				if(k==2) vo.setFile3(newUpload.get(k));
				if(k==3) vo.setFile4(newUpload.get(k));
				if(k==4) vo.setFile5(newUpload.get(k));
			}
			
			// DB update
			service.BoardUpdate(vo);
			service.BoardFileUpdate(vo);
			
			//				// DB수정되었을 때
//					if(vo.getDelFile()!=null) {
//						for(String fname:vo.getDelFile()) {
//							fileDelete(path, fname);
//						}
//					}			
			
			// 글 내용보기로 이동
			String msg = "<script>alert('오늘의 추천 글이 수정되었습니다.\\n글내용보기로 이동합니다');";
			msg += "location.href='/board/recommend/recommendView?board_num="+vo.getBoard_num()+"';</script>";
			
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
