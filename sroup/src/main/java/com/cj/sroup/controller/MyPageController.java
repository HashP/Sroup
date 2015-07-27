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
	public String profileupdate() {
		
		return "mypage/profileupdate";
	}
	
	@RequestMapping("/pwdupdate.do")
	public String pwdupdate() {
		return "mypage/pwdupdate";
	}
	
	
	@RequestMapping("/mystudy.do")
	public String mystudy(@RequestParam(value="cate", defaultValue="create", required=false)String cate, Model model) {
		model.addAttribute("cate", cate);
		return "mypage/mystudy";
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/finished-study.do")
	public String finished() {
		return "mypage/finished-study";
	}

}
