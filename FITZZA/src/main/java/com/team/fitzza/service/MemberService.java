package com.team.fitzza.service;

import com.team.fitzza.vo.MemberVO;

public interface MemberService{
	
	int memberInsert(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO memberSelect(String user_id);
	public int memberUpdate(MemberVO vo);
	int idCheck(String user_id);

}
