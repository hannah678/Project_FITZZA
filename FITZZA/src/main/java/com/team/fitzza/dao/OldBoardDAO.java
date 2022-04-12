package com.team.fitzza.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.fitzza.vo.BoardVO;

@Mapper
@Repository
public interface OldBoardDAO {
	public int oldBoardDetailInsert(BoardVO vo);
	public int oldBoardStateInsert(BoardVO vo);
	public List<BoardVO> oldBoardSelectAll();
	public BoardVO oldBoardView(int board_num);
	public int oldBoardDetailUpdate(BoardVO vo);
	public int oldBoardStateUpdate(BoardVO vo);	

}