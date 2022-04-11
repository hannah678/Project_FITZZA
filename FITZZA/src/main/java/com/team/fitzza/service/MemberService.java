package com.team.fitzza.service;

import com.team.fitzza.vo.MemberVO;

public interface MemberService{
	
	public int memberInsert(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO memberSelect(String user_id);
	public int memberUpdate(MemberVO vo);
	public int idCheck(String user_id);
	public int nickCheck(String user_nickname);
	public MemberVO pwdCheck(MemberVO vo);
	public int memberBye(MemberVO vo);
	public int selfBye(MemberVO vo);
	public MemberVO myPage(String user_id);

}
