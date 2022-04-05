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
		// TODO Auto-generated method stub
		return dao.memberInsert(vo);
	}

	@Override
	public MemberVO loginCheck(MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO memberSelect(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int idCheck(String userid) {
		// TODO Auto-generated method stub
		return 0;
	}

}
