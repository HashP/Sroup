package com.cj.sroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagementController {

	@RequestMapping("/m_main.do")
	public String main(){
		return "management/m_main";
	}
	@RequestMapping("/m_border.do")
	public String border(){
		return "management/m_border";
	}
	@RequestMapping("/m_memberspeak.do")
	public String memberspeak(){
		return "management/m_memberspeak";
	}
	@RequestMapping("/m_album.do")
	public String album(){
		return "management/m_album";
	}
	@RequestMapping("/m_rollbook.do")
	public String rollbook(){
		return "management/m_rollbook";
	}
	@RequestMapping("/m_calendar.do")
	public String calenda(){
		return "management/m_calendar";
	}
}
