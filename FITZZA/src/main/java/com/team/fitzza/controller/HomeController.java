package com.team.fitzza.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.fitzza.service.BoardService;
import com.team.fitzza.vo.BoardVO;

@Controller
public class HomeController {
	@Inject
	BoardService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(Locale locale, Model model) {
		BoardVO vo = new BoardVO();
        ModelAndView mav = new ModelAndView();
        mav.addObject("codifile1st", service.codifile1st(vo));
        mav.addObject("codifile2nd", service.codifile2nd(vo));
        mav.addObject("codifile3rd", service.codifile3rd(vo));
        mav.setViewName("home");
        return mav;
    }
	//공지 팝업
	@RequestMapping("/notice_popup")
	public String notice_popup() {
		return "/notice_popup";
	}
}
