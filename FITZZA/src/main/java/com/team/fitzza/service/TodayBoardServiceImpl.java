package com.team.fitzza.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.fitzza.dao.TodayBoardDAO;

@Service
public class TodayBoardServiceImpl  implements TodayBoardService{
	@Inject
	TodayBoardDAO dao;
}
