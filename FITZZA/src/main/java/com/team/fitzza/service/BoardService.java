package com.team.fitzza.service;

import java.util.List;

import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.MemberVO;

public interface BoardService {
	public List<BoardVO> boardList();
	public int boardInsert(BoardVO vo);
	public BoardVO boardSelect(int board_num);
	public int boardUpdate(BoardVO vo);
	public int boardDelete(int board_num, String user_id);
    public void hitCount(int board_num);
    public int reportInsert(BoardVO vo);
	public int reportUp(BoardVO vo);
}

