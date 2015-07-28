package com.cj.sroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HeaderController {
	
	@RequestMapping("/header.do")
	public String header() {
		return "header.jsp";
	}

}
