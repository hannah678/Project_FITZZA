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
		// TODO Auto-generated method stub
		return dao.oldBoardInsert(vo);
	}

	@Override
	public List<BoardVO> oldBoardSelectAll() {
		// TODO Auto-generated method stub
		return dao.oldBoardSelectAll();
	}

	@Override
	public BoardVO oldBoardView(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO getFileName(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int oldBoardUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int oldBoardDelete(int no, String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int oldBoardFileInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.oldBoardFileInsert(vo);
	}

	@Override
	public int oldBoardCityInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.oldBoardCityInsert(vo);
	}
	
	

}
