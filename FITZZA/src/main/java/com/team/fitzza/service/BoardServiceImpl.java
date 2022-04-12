package com.team.fitzza.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.fitzza.dao.BoardDAO;
import com.team.fitzza.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	BoardDAO dao;

	@Override
	public List<BoardVO> boardList() {
		return dao.boardList();
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return dao.boardInsert(vo);
	}

	@Override
	public BoardVO boardSelect(int board_num) {
		return dao.boardSelect(board_num);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return dao.boardUpdate(vo);
	}

	@Override
	public int boardDelete(int board_num, String user_id) {
		return dao.boardDelete(board_num, user_id);
	}

	@Override
	public void hitCount(int board_num) {
		dao.hitCount(board_num);
	}

	@Override
	public int reportInsert(BoardVO vo) {
		return dao.reportInsert(vo);
	}

	@Override
	public int reportUp(BoardVO vo) {
		return dao.reportUp(vo);
	}

	@Override
	public int getType_num(int type_num) {
		return dao.getType_num(type_num);
	}

	@Override
	public List<BoardVO> todayWriterSelect(String user_id) {
		return dao.todayWriterSelect(user_id);
	}

	@Override
	public List<BoardVO> recommendWriterSelect(String user_id) {
		return dao.recommendWriterSelect(user_id);
	}

	@Override
	public List<BoardVO> oldWriterSelect(String user_id) {
		return dao.oldWriterSelect(user_id);
	}

	@Override
	public List<BoardVO> reviewWriterSelect(String user_id) {
		return dao.reviewWriterSelect(user_id);
	}

	@Override
	public List<BoardVO> qnaWriterSelect(String user_id) {
		return dao.qnaWriterSelect(user_id);
	}

	@Override
	public List<BoardVO> voteWriterSelect(String user_id) {
		return dao.voteWriterSelect(user_id);
	}
	
}