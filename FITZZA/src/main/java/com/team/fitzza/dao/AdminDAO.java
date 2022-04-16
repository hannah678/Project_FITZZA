package com.team.fitzza.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.fitzza.vo.MemberVO;

@Mapper
@Repository
public interface AdminDAO {
	//회원관리
	
	//전체 회원 수
	public int CountUser(MemberVO vo);
	//전체 회원 명단
	public List<MemberVO> AllUser(MemberVO vo);
}
