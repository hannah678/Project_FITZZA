package com.team.fitzza.service;

import java.util.List;

import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.MemberVO;
import com.team.fitzza.vo.PagingVO;

public interface AdminService {
	//회원관리
	
	//전체 회원 수
	public int CountUser(MemberVO vo);
	//전체 회원 명단
	public List<MemberVO> AllUser(PagingVO vo);	
	//전체 회원 수
	public int CountLeaveUser(MemberVO vo);
	//탈퇴한 회원 명단
	public List<MemberVO> LeaveUser(MemberVO vo);
	//강제탈퇴
	public int forcedBye(MemberVO vo);
	public int memberDel(MemberVO vo);
	//회원 게시물 목록
	public List<MemberVO> UserBoard(MemberVO vo);	
	//회원 댓글 목록
	public List<MemberVO> UserReply(MemberVO vo);	
	//관리자 권한 부여
	public int makeAdmin(MemberVO vo);
	//신고 목록
	public List<BoardVO> reportSelect(BoardVO vo);
	//신고 처리 완료
	public int reportOff(int report_num);
	//신고글 개수
	public int reportCount(BoardVO bvo);
	//미처리 신고 개수
	public int reportNoCount(BoardVO bvo);
	//처리 신고 개수
	public int reportYesCount(BoardVO bvo);
	//중고 게시물 리스트
	public List<BoardVO> adminOldList(BoardVO bvo);
	//전체 개수
	public int allOldList(BoardVO bvo);
	//판매중 개수
	public int saleOldList(BoardVO bvo);
	//예약중 개수
	public int reserveOldList(BoardVO bvo);
	//거래완료 개수
	public int completeOldList(BoardVO bvo);
	//검색
	public List<MemberVO> memberSearch(String searchKey, String string, int start, int end);
}
