package com.cj.sroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController{
	
	
	@RequestMapping("/template.do")
	public String test() {
		return "template";
	}
}
