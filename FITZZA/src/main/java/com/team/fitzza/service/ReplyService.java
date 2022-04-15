package com.team.fitzza.service;

import java.util.List;

import com.team.fitzza.vo.ReplyVO;

public interface ReplyService {
	// 댓글등록
		public int replyWrite(ReplyVO vo);

		// 댓글목록
		public List<ReplyVO> replyList(int board_num);

		// 댓글수정
		public int replyEdit(ReplyVO vo);

		// 댓글삭제
		public int replyDel(int reply_num, String user_id);
}
