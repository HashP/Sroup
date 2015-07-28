package com.cj.sroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	//회원가입수정
	@RequestMapping("/profileupdate.do")
	public String profileupdate(Model model) {
		model.addAttribute("current_page", "profileupdate");
		return "mypage/profileupdate";
	}
	
	@RequestMapping("/pwdupdate.do")
	public String pwdupdate(Model model) {
		model.addAttribute("current_page", "pwdupdate");
		return "mypage/pwdupdate";
	}
	
	
	@RequestMapping("/mystudy.do")
	public String mystudy(@RequestParam(value="cate", defaultValue="create", required=false)String cate, Model model) {
		model.addAttribute("cate", cate);
		model.addAttribute("current_page", cate + "study");
		return "mypage/mystudy";
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/finished-study.do")
	public String finished(Model model) {
		model.addAttribute("current_page", "finished-study");
		return "mypage/finished-study";
	}

}
