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
	public int oldBoardInsert(BoardVO vo) {
		return dao.oldBoardInsert(vo);
	}

	@Override
	public List<BoardVO> oldBoardSelectAll() {
		return dao.oldBoardSelectAll();
	}

	@Override
	public BoardVO oldBoardView(int board_num) {
		return dao.oldBoardView(board_num);
	}

	@Override
	public BoardVO getFileName(int board_num) {
		return dao.getFileName(board_num);
	}

	@Override
	public int oldBoardUpdate(BoardVO vo) {
		return dao.oldBoardUpdate(vo);
	}

	@Override
	public int oldBoardDelete(int board_num, String user_id) {
		return dao.oldBoardDelete(board_num, user_id);
	}

	@Override
	public int oldBoardFileInsert(BoardVO vo) {
		return dao.oldBoardFileInsert(vo);
	}

	@Override
	public int oldBoardDetailInsert(BoardVO vo) {
		return dao.oldBoardDetailInsert(vo);
	}

	@Override
	public int boardNum(String user_id) {
		return dao.boardNum(user_id);
	}

	@Override
	public int oldBoardStateInsert(BoardVO vo) {
		return dao.oldBoardStateInsert(vo);
	}

	@Override
	public int oldBoardDetailUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.oldBoardDetailUpdate(vo);
	}

	@Override
	public int oldBoardFileUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.oldBoardFileUpdate(vo);
	}

	@Override
	public int oldBoardStateUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.oldBoardStateUpdate(vo);
	}


	
	

}
