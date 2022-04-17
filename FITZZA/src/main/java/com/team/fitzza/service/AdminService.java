package com.team.fitzza.service;

import java.util.List;

import com.team.fitzza.vo.MemberVO;

public interface AdminService {
	//회원관리
	
	//전체 회원 수
	public int CountUser(MemberVO vo);
	//전체 회원 명단
	public List<MemberVO> AllUser(MemberVO vo);
	//탈퇴한 회원 명단
	public List<MemberVO> LeavedUser(MemberVO vo);
}
