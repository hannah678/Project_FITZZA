package com.team.fitzza.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.fitzza.dao.ReplyDAO;

@Service
public class ReplyServiceImpl {
	@Inject
	ReplyDAO dao;
}
