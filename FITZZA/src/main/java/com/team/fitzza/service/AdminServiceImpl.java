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
	public List<MemberVO> LeavedUser(MemberVO vo) {
		return dao.LeavedUser(vo);
	}

	
	
}
