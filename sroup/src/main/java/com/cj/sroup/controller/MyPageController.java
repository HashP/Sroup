package com.cj.sroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
