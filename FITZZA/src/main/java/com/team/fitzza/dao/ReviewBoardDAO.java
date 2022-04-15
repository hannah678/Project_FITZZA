package com.team.fitzza.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.fitzza.vo.BoardVO;

@Mapper
@Repository
public interface ReviewBoardDAO {
	public List<BoardVO> reviewBoardSelectAll();
	public BoardVO reviewBoardView(int board_num);
}