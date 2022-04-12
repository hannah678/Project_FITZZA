package com.team.fitzza.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.fitzza.dao.OldBoardDAO;
import com.team.fitzza.vo.BoardVO;

@Service
public class OldBoardServiceImpl implements OldBoardService {

	@Inject
	OldBoardDAO dao;

	@Override
	public List<BoardVO> oldBoardSelectAll() {
		return dao.oldBoardSelectAll();
	}

	@Override
	public BoardVO oldBoardView(int board_num) {
		return dao.oldBoardView(board_num);
	}

	@Override
	public int oldBoardDetailInsert(BoardVO vo) {
		return dao.oldBoardDetailInsert(vo);
	}

	@Override
	public int oldBoardStateInsert(BoardVO vo) {
		return dao.oldBoardStateInsert(vo);
	}

	@Override
	public int oldBoardDetailUpdate(BoardVO vo) {
		return dao.oldBoardDetailUpdate(vo);
	}

	@Override
	public int oldBoardStateUpdate(BoardVO vo) {
		return dao.oldBoardStateUpdate(vo);
	}


	
	

}
