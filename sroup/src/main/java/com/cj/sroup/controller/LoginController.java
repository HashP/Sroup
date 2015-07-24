package com.cj.sroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
 
	
	@RequestMapping("/login.do")
	public String login() {
		return "login/login";
	}
	
	@RequestMapping("/signup.do")
	public String signup() {
		return "login/signup";
	}
	
}
