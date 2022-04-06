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
	public MemberVO pwdCheck(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.pwdCheck(vo);
	}

	@Override
	public int memberBye(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.memberBye(vo);
	}

	@Override
	public int selfBye(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.selfBye(vo);
	}

}
