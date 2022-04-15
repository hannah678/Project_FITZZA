package com.team.fitzza.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.fitzza.dao.ReviewBoardDAO;
import com.team.fitzza.vo.BoardVO;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

	@Inject
	ReviewBoardDAO dao;

	@Override
	public List<BoardVO> reviewBoardSelectAll() {
		return dao.reviewBoardSelectAll();
	}

	@Override
	public BoardVO reviewBoardView(int board_num) {
		return dao.reviewBoardView(board_num);
	}
}
