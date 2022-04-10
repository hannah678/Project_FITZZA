package com.team.fitzza.service;

import java.util.List;

import com.team.fitzza.vo.BoardVO;

public interface OldBoardService {
	
	public int oldBoardInsert(BoardVO vo);
	public int oldBoardFileInsert(BoardVO vo);
	public int oldBoardDetailInsert(BoardVO vo);
	public int oldBoardStateInsert(BoardVO vo);
	public List<BoardVO> oldBoardSelectAll();
	public BoardVO oldBoardView(int board_num);
	//파일명 선택
	public BoardVO getFileName(int board_num);
	public int oldBoardUpdate(BoardVO vo);
	public int oldBoardDelete(int board_num, String user_id);
	public int boardNum(String user_id);
}
