package com.cj.sroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ListController {

	@RequestMapping("/list.do")
	public String list() {
		return "list/list";
	}
	@RequestMapping("/detail.do")
	public String detail() {
		return "list/detail";
	}
	@RequestMapping("/add.do")
	public String add() {
		return "list/add";
	}
	@RequestMapping("/upload.do")
	public String upload() {
		return "list/upload";
	}
}
