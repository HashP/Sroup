package com.cj.sroup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cj.sroup.service.MyPageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Value("${profile.image.path}")
	private String filepath;
	
	@Autowired
	private MyPageService service;
	
	//회원가입수정
	@RequestMapping("/profileupdate.do")
	public String profileupdate(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		if(loginId == null) {
			return "redirect:/login/login.do";
		}
		
		model.addAttribute("current_page", "profileupdate");
		model.addAttribute("userinfo", service.getUserInfoById(loginId));
		
		filepath = filepath.replace("C:\\Users\\jhta\\git\\sroup\\sroup\\src\\main\\webapp\\", "\\sroup\\");
		
		System.out.println(filepath);
		
		
		model.addAttribute("imgpath", filepath);
		return "mypage/profileupdate";
	}
	
	@RequestMapping("/pwdupdate.do")
	public String pwdupdate(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		if(loginId == null) {
			return "redirect:/login/login.do";
		}
		
		model.addAttribute("current_page", "pwdupdate");
		
		return "mypage/pwdupdate";
	}
	
	
	@RequestMapping("/mystudy.do")
	public String mystudy(@RequestParam(value="cate", defaultValue="create", required=false)String cate, Model model) {
		model.addAttribute("cate", cate);
		model.addAttribute("current_page", cate + "study");
		return "mypage/mystudy";
	}
	
	
	@RequestMapping("/calendar.do")
	public String calendar(Model model) {
		model.addAttribute("current_page", "studycalendar");
		return "mypage/calendar";
	}
	
	
	
	@RequestMapping("/finished-study.do")
	public String finished(Model model) {
		model.addAttribute("current_page", "finished-study");
		return "mypage/finished-study";
	}

}
