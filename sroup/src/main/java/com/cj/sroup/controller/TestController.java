package com.cj.sroup.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.cj.sroup.service.M_rollbookService;

@Controller
public class TestController{
	
	@Autowired
	M_rollbookService rollbookService;
	@Autowired
	MappingJackson2JsonView jsonView;
	
	@RequestMapping("/template.do")
	public String test() {
		return "template";
	}
	
	@RequestMapping("/testrollbook.do")
	public String testRollBook() {
		
		return "test/testrollbook.jsp";
	}
	
	
	@RequestMapping("/getSchedules.do")
	public View getSchedules(Model model) {
		int studyNo = 3;		///이건 나중에 GET으로 받아올 값
		
		List<String> scheduleList = rollbookService.getSchedulesByStudyno(studyNo);
		model.addAttribute("scheduleList", scheduleList);
		System.out.println(scheduleList);

		return jsonView;
	}
}
