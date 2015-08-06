package com.cj.sroup.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cj.sroup.service.StudyService;
import com.cj.sroup.vo.ListVO;

@Controller
public class ListController {

	@Autowired
	StudyService service;
	
	@RequestMapping("/list.do")
	public ModelAndView list() {
		
		ModelAndView mav = new ModelAndView();
		List<ListVO> lists = service.getAllStudies();
		mav.addObject("lists", lists);
		mav.setViewName("list/list");
		
		return mav;
	}
	@RequestMapping("/detail.do")
	public String detail() {
		return "list/detail";
	}
	@RequestMapping("/add.do")
	public String add() {
		return "list/add";
	}
	@RequestMapping("/upload.do")
	public String upload() {
		return "list/upload";
	}
	
	
}
