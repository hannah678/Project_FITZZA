package com.team.fitzza.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.fitzza.dao.AdminDAO;
import com.team.fitzza.vo.BoardVO;
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

	@Override
	public int memberDel(MemberVO vo) {
		return dao.memberDel(vo);
	}

	@Override
	public List<BoardVO> reportSelect(BoardVO vo) {
		return dao.reportSelect(vo);
	}

	@Override
	public int reportOff(int report_num) {
		return dao.reportOff(report_num);
	}

	@Override
	public int reportCount(BoardVO bvo) {
		return dao.reportCount(bvo);
	}

	@Override
	public int reportNoCount(BoardVO bvo) {
		return dao.reportNoCount(bvo);
	}

	@Override
	public int reportYesCount(BoardVO bvo) {
		return dao.reportYesCount(bvo);
	}

	@Override
	public List<BoardVO> adminOldList(BoardVO bvo) {
		return dao.adminOldList(bvo);
	}

	@Override
	public int saleOldList(BoardVO bvo) {
		return dao.saleOldList(bvo);
	}

	@Override
	public int reserveOldList(BoardVO bvo) {
		return dao.reserveOldList(bvo);
	}

	@Override
	public int completeOldList(BoardVO bvo) {
		return dao.completeOldList(bvo);
	}

	@Override
	public int allOldList(BoardVO bvo) {
		return dao.allOldList(bvo);
	}

	
	
}
