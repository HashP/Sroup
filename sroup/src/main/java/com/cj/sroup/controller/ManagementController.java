package com.cj.sroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagementController {

	@RequestMapping("/m_main.do")
	public String main(){
		return "m_main.jsp";
	}
	@RequestMapping("/m_border.do")
	public String border(){
		return "m_border.jsp";
	}
	@RequestMapping("/m_memberspeak.do")
	public String memberspeak(){
		return "m_memberspeak.jsp";
	}
}
