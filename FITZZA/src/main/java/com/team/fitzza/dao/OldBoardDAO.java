package com.team.fitzza.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.fitzza.vo.BoardVO;

@Mapper
@Repository
public interface OldBoardDAO {
	public int oldBoardInsert(BoardVO vo);
	public int oldBoardFileInsert(BoardVO vo);
	public int oldBoardCityInsert(BoardVO vo);
	public List<BoardVO> oldBoardSelectAll();
	public BoardVO oldBoardView(int no);
	//파일명 선택
	public BoardVO getFileName(int no);
	public int oldBoardUpdate(BoardVO vo);
	public int oldBoardDelete(int no, String user_id);
}