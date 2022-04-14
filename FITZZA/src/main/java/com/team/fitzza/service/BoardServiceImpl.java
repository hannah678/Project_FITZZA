package com.team.fitzza.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.fitzza.dao.BoardDAO;
import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.PagingVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	BoardDAO dao;

	@Override
	public int BoardInsert(BoardVO vo) {
		return dao.BoardInsert(vo);
	}

	@Override
	public BoardVO boardSelect(int board_num) {
		return dao.boardSelect(board_num);
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
	public BoardVO getFileName(int board_num) {
		return dao.getFileName(board_num);
	}

	@Override
	public int BoardUpdate(BoardVO vo) {
		return dao.BoardUpdate(vo);
	}

	@Override
	public int BoardFileUpdate(BoardVO vo) {
		return dao.BoardFileUpdate(vo);
	}

	@Override
	public int BoardFileInsert(BoardVO vo) {
		return dao.BoardFileInsert(vo);
	}

	@Override
	public int boardNum(String user_id) {
		return dao.boardNum(user_id);
	}

	@Override
	public List<BoardVO> todayWriterSelect(String user_id, PagingVO pvo) {
		return dao.todayWriterSelect(user_id, pvo);
	}

	@Override
	public List<BoardVO> recommendWriterSelect(String user_id, PagingVO pvo) {
		return dao.recommendWriterSelect(user_id, pvo);
	}

	@Override
	public List<BoardVO> oldWriterSelect(String user_id, PagingVO pvo) {
		return dao.oldWriterSelect(user_id, pvo);
	}

	@Override
	public List<BoardVO> reviewWriterSelect(String user_id, PagingVO pvo) {
		return dao.reviewWriterSelect(user_id, pvo);
	}

	@Override
	public List<BoardVO> qnaWriterSelect(String user_id, PagingVO pvo) {
		return dao.qnaWriterSelect(user_id, pvo);
	}

	@Override
	public List<BoardVO> voteWriterSelect(String user_id, PagingVO pvo) {
		return dao.voteWriterSelect(user_id, pvo);
	}
	
}