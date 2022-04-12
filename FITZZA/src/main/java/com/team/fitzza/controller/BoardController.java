package com.team.fitzza.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team.fitzza.service.BoardService;
import com.team.fitzza.service.OldBoardService;
import com.team.fitzza.vo.BoardVO;

@RestController
public class BoardController {
	@Inject
	BoardService service;
	@Inject
	OldBoardService oldService;
	
	
	//글 신고
	@PostMapping("/board/reportOk")
	public int reportOk(BoardVO vo, HttpSession session) {
		System.out.println("/board/reportOk START!");
		
		vo.setUser_id((String)session.getAttribute("logId"));// 신고하는 유저의 아이디 = 로그인된 아이디	
		
		System.out.println(vo.getUser_id());
		System.out.println(vo.getBoard_num());
		service.reportInsert(vo);
		
		return service.reportUp(vo);
	}
	
	@GetMapping("/board/boardDelete")
	public ResponseEntity<String> boardDelete(int board_num, HttpSession session) {
		
		String user_id = (String)session.getAttribute("logId");
		
		String path = session.getServletContext().getRealPath("/upload");
		
		int type_num = service.getType_num(board_num); //3
		System.out.println(type_num);
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			// 1. 삭제할 레코드의 파일명 얻어오기
			BoardVO dbFileVO = oldService.getFileName(board_num);
			
			// 2. 레코드 삭제
			service.boardDelete(board_num, user_id);
			
			// 3. 파일 삭제
			fileDelete(path, dbFileVO.getFile1());	//첫번째지우고
			//두번째는 있을 때만, 널이 아니면
			if(dbFileVO.getFile2()!=null) {	//이름지운다
				fileDelete(path, dbFileVO.getFile2());
			}else if(dbFileVO.getFile3()!=null) {	//이름지운다
				fileDelete(path, dbFileVO.getFile3());
			}else if(dbFileVO.getFile4()!=null) {	//이름지운다
				fileDelete(path, dbFileVO.getFile4());
			}else if(dbFileVO.getFile5()!=null) {	//이름지운다
				fileDelete(path, dbFileVO.getFile5());
			}
			//	데이터는 안보내도 된다. 매개변수x
			String msg = "<script>alert('글이 삭제되었습니다');";
					if(type_num==1) {
						msg += "location.href='/board/todayCodi/todayCodiList';</script>";
					}else if(type_num==2) {
						msg += "location.href='/board/recommend/recommendList';</script>";
					}else if(type_num==3) {
						msg += "location.href='/board/old/oldList';</script>";
					}else if(type_num==4) {
						msg += "location.href='/board/review/reviewList';</script>";
					}else if(type_num==5) {
						msg += "location.href='/board/qna/qnaList';</script>";
					}else if(type_num==6) {
						msg += "location.href='/board/vote/voteList';</script>";
					}
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			
			String msg = "<script>alert('글 삭제에 실패하였습니다\\n글 내용보기로 이동합니다');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}

	private void fileDelete(String path, String file1) {
		// TODO Auto-generated method stub
		
	}
}