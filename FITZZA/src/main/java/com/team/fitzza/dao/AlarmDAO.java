package com.team.fitzza.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.fitzza.vo.BoardVO;

@Mapper
@Repository
public interface AlarmDAO {
	public BoardVO replyReceiverInfo(int board_num);
}
