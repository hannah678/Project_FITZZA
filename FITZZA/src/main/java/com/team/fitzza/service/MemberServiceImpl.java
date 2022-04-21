package com.team.fitzza.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.fitzza.dao.MemberDAO;
import com.team.fitzza.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject
	MemberDAO dao;
	
	@Override
	public int memberInsert(MemberVO vo) {
		return dao.memberInsert(vo);
	}

	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return dao.loginCheck(vo);
	}

	@Override
	public MemberVO memberSelect(String user_id) {
		return dao.memberSelect(user_id);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		return dao.memberUpdate(vo);
	}

	@Override
	public int idCheck(String user_id) {
		return dao.idCheck(user_id);
	}
	
	@Override
	public int nickCheck(String user_nickname) {
		return dao.nickCheck(user_nickname);
	}

	@Override
	public MemberVO pwdCheck(MemberVO vo) {
		return dao.pwdCheck(vo);
	}

	@Override
	public int memberBye(MemberVO vo) {
		return dao.memberBye(vo);
	}

	@Override
	public int selfBye(MemberVO vo) {
		return dao.selfBye(vo);
	}

	@Override
	public MemberVO myPage(String user_id) {
		return dao.myPage(user_id);
	}

	@Override
	public int expUp_board(String user_id) {
		return dao.expUp_board(user_id);
	}

	@Override
	public int expUp_reply(String user_id) {
		return dao.expUp_reply(user_id);
	}
	
	@Override
	public int expDown_board(String user_id) {
		return dao.expDown_board(user_id);
	}
	
	@Override
	public int expDown_reply(String user_id) {
		return dao.expDown_reply(user_id);
	}

	@Override
	public MemberVO getFileName(String user_id) {
		return dao.getFileName(user_id);
	}

	@Override
	public int changeProfileImg(MemberVO vo) {
		return dao.changeProfileImg(vo);
	}

	@Override
	public int Isforced(String email) {
		return dao.Isforced(email);
	}
}
