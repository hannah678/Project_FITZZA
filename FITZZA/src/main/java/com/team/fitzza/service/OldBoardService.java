package com.team.fitzza.service;

import java.util.List;

import com.team.fitzza.vo.BoardVO;

public interface OldBoardService {
	public int oldBoardDetailInsert(BoardVO vo);
	public int oldBoardStateInsert(BoardVO vo);
	public List<BoardVO> oldBoardSelectAll();
	public BoardVO oldBoardView(int board_num);
	public int oldBoardDetailUpdate(BoardVO vo);
	public int oldBoardStateUpdate(BoardVO vo);
}
