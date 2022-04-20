package com.team.fitzza.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.fitzza.vo.BoardVO;
import com.team.fitzza.vo.PagingVO;
import com.team.fitzza.vo.ReplyVO;

@Mapper
@Repository
public interface BoardDAO {
	//글등록
	public int BoardInsert(BoardVO vo);
	//파일 업로드 
	public int BoardFileInsert(BoardVO vo);
	//글1개 선택
	public BoardVO boardSelect(int board_num);
	
	public List<BoardVO> BoardSelectAllSE(int type_num, PagingVO pvo);
	public List<BoardVO> BoardSelectAll(int type_num);
	//오늘의코디
	public List<BoardVO> BoardSelectLike(int type_num, String user_id);
	
	public BoardVO BoardView(int board_num);
	
	public int boardNum(String user_id);
	//글수정
	public int BoardUpdate(BoardVO vo);
	public int BoardFileUpdate(BoardVO vo);
	//파일명 선택
	public BoardVO getFileName(int board_num);
	//글삭제
	public int boardDelete(int board_num, String user_id);
	//조회수 증가
    public void hitCount(int board_num);
    //글 신고
    public int reportInsert(BoardVO vo);
    // 신고 누적
 	public int reportUp(BoardVO vo);
 	
 	public int getType_num(int type_num);
 	//마이페이지 글목록
 	public List<BoardVO> todayWriterSelect(String user_id, PagingVO pvo);
	public List<BoardVO> recommendWriterSelect(String user_id, PagingVO pvo);
	public List<BoardVO> oldWriterSelect(String user_id, PagingVO pvo);
	public List<BoardVO> reviewWriterSelect(String user_id, PagingVO pvo);
	public List<BoardVO> qnaWriterSelect(String user_id, PagingVO pvo);
	public List<BoardVO> voteWriterSelect(String user_id, PagingVO pvo);
	public List<ReplyVO> replyWriterSelect(String user_id, PagingVO pvo);
	//마이페이지 총 추천 수
	public int totalLike(String user_id);
	public int LikeCount(BoardVO vo);
	public void LikeInsert(BoardVO vo);
	public void LikeDelete(BoardVO vo);
	
	public int votein(BoardVO vo);
	public int votecnt(int vote_item_order, BoardVO vo);
	
	//검색
	public List<BoardVO> boardSearch(String searchKey, String string, int start, int end, int type_num);
	public List<BoardVO> recommendBoardSelect(int i, PagingVO pvo, String gender_type);
}