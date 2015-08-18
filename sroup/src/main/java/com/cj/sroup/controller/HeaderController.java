package com.cj.sroup.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cj.sroup.service.StudyService;
import com.cj.sroup.vo.ListVO;

@Controller
public class HeaderController {

	@Autowired
	StudyService service;
	
	@RequestMapping("/header.do")
	public ModelAndView header() {
		ModelAndView mav = new ModelAndView();
		
		List<ListVO> lists = new ArrayList<ListVO>();
		lists = service.getAllStudiesDefault();
		
		mav.addObject("lists", lists);
		mav.setViewName("list/header");
		
		return mav;
	}

}
