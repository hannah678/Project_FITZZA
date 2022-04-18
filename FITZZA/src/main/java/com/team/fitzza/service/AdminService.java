package com.team.fitzza.service;

import java.util.List;

import com.team.fitzza.vo.MemberVO;

public interface AdminService {
	//회원관리
	
	//전체 회원 수
	public int CountUser(MemberVO vo);
	//전체 회원 명단
	public List<MemberVO> AllUser(MemberVO vo);
	//전체 회원 수
	public int CountLeaveUser(MemberVO vo);
	//탈퇴한 회원 명단
	public List<MemberVO> LeaveUser(MemberVO vo);
	//강제탈퇴
	public int forcedBye(MemberVO vo);
	//회원 게시물 목록
	public List<MemberVO> UserBoard(MemberVO vo);	
	//회원 댓글 목록
	public List<MemberVO> UserReply(MemberVO vo);	
	//관리자 권한 부여
	public int makeAdmin(MemberVO vo);
}
