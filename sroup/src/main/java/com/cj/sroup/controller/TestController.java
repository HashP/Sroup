package com.cj.sroup.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.cj.sroup.service.M_rollbookService;
import com.cj.sroup.vo.M_RollbookVO;
import com.cj.sroup.vo.UserInfoVO;

@Controller
public class TestController{
	
	@Autowired
	private M_rollbookService rollbookService;
	@Autowired
	private MappingJackson2JsonView jsonView;
	private Logger logger= Logger.getLogger(TestController.class);
	
	@RequestMapping("/template.do")
	public String test() {
		return "template";
	}
	
	@RequestMapping("/testrollbook.do")
	public String testRollBook(Model model) {
		int studyNo = 3;
		model.addAttribute("studyNo", studyNo);
		
		List<UserInfoVO> memberList = rollbookService.getMemberListByStudyno(studyNo);
		model.addAttribute("memberList", memberList);
		
		return "test/testrollbook.jsp";
	}
		
	@RequestMapping("/getSchedules.do")
	public View getSchedules(Model model,@RequestParam("studyNo")int studyNo) {
//		int studyNo = 3;		///이건 나중에 GET으로 받아올 값
		
		List<String> scheduleList = rollbookService.getSchedulesByStudyno(studyNo);
		model.addAttribute("scheduleList", scheduleList);
		logger.info("scheduleList: " + scheduleList);

		return jsonView;
	}
	
	@RequestMapping("/getAttendCounts.do")
	public View getAttendCountByStudyno(Model model,@RequestParam("studyNo")int studyNo) {
		HashMap<String, HashMap<String, Object>> attendCounts = rollbookService.getAttendCountByStudyno(studyNo);
		model.addAttribute("attendCounts", attendCounts);
		logger.info("attendCounts: " + attendCounts);
		return jsonView;
	}
	
	@RequestMapping("/getRollbookByDate.do")
	public View getRollbookByDate(Model model, @RequestParam("studyNo")int studyNo, @RequestParam("date")String date) throws ParseException {
		HashMap<String, M_RollbookVO> rollbook = rollbookService.getAttendByDay(studyNo, date);	//date must be pattern 'yyyy-mm-dd';
		model.addAttribute("rollbook", rollbook);
		logger.info("rollbook: " + rollbook);
		return jsonView;
	}
	
}
