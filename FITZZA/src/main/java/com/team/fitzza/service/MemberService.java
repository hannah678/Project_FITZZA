package com.team.fitzza.service;

import com.team.fitzza.vo.MemberVO;

public interface MemberService{
	
	int memberInsert(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO memberSelect(String userid);
	public int memberUpdate(MemberVO vo);
	int idCheck(String userid);

}
