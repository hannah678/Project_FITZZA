package com.team.fitzza.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.fitzza.dao.AdminDAO;
import com.team.fitzza.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Inject
	AdminDAO dao;

	@Override
	public int CountUser(MemberVO vo) {
		return dao.CountUser(vo);
	}

	@Override
	public List<MemberVO> AllUser(MemberVO vo) {
		return dao.AllUser(vo);
	}

	@Override
	public List<MemberVO> LeaveUser(MemberVO vo) {
		return dao.LeaveUser(vo);
	}

	@Override
	public int CountLeaveUser(MemberVO vo) {
		return dao.CountLeaveUser(vo);
	}

	@Override
	public int forcedBye(MemberVO vo) {
		return dao.forcedBye(vo);
	}

	@Override
	public List<MemberVO> UserBoard(MemberVO vo) {
		return dao.UserBoard(vo);
	}

	@Override
	public List<MemberVO> UserReply(MemberVO vo) {
		return dao.UserReply(vo);
	}

	@Override
	public int makeAdmin(MemberVO vo) {
		return dao.makeAdmin(vo);
	}

	
	
}
