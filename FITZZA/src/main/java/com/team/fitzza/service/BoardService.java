package com.team.fitzza.service;

import java.util.List;

import com.team.fitzza.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> boardList();
	public int boardInsert(BoardVO vo);
	public BoardVO boardSelect(int board_num);
	public int boardUpdate(BoardVO vo);
	public int boardDelete(int board_num, String user_id);
    public void hitCount(int board_num);
    public int reportInsert(BoardVO vo);
	public int reportUp(BoardVO vo);
	public int getType_num(int type_num);
	public List<BoardVO> todayWriterSelect(String user_id);
	public List<BoardVO> recommendWriterSelect(String user_id);
	public List<BoardVO> oldWriterSelect(String user_id);
	public List<BoardVO> reviewWriterSelect(String user_id);
	public List<BoardVO> qnaWriterSelect(String user_id);
	public List<BoardVO> voteWriterSelect(String user_id);
}

