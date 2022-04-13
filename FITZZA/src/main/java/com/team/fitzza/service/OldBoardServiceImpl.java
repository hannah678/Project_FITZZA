package com.team.fitzza.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.fitzza.dao.OldBoardDAO;
import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.PagingVO;

@Service
public class OldBoardServiceImpl implements OldBoardService {

	@Inject
	OldBoardDAO dao;

	@Override
	public List<BoardVO> oldBoardSelectAll(PagingVO pvo) {
		// TODO Auto-generated method stub
		return dao.oldBoardSelectAll(pvo);
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


	@Override
	public List<BoardVO> oldBoardSearch(String searchKey, String string, int start, int end) {
		// TODO Auto-generated method stub
		return dao.oldBoardSearch(searchKey, string, start, end);
	}

	@Override
	public List<BoardVO> oldBoardSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}






	
	

}
