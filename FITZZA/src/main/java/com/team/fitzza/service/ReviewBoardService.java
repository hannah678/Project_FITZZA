package com.team.fitzza.service;

import java.util.List;

import com.team.fitzza.vo.BoardVO;

public interface ReviewBoardService {
	public List<BoardVO> reviewBoardSelectAll();
	public BoardVO reviewBoardView(int board_num);	
}
