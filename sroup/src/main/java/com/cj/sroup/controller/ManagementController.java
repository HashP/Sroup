package com.cj.sroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagementController {

	@RequestMapping("/m_main.do")
	public String main(){
		return "m_main.jsp";
	}
}
