package com.cj.sroup.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cj.sroup.service.StudyService;
import com.cj.sroup.vo.ListVO;

@Controller
public class ListController {

	@Autowired
	StudyService service;
	
	@RequestMapping("/list.do")
	public ModelAndView list() {
		
		ModelAndView mav = new ModelAndView();
		List<ListVO> lists = service.getAllStudies();
		mav.addObject("lists", lists);
		mav.setViewName("list/list");
		
		return mav;
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
	@RequestMapping("/map.do")
	public void map(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/plain;charset=utf-8;");
		
		String addr = req.getParameter("addr");
		System.out.println(addr);
		URL urlMy=new URL("http://maps.googleapis.com/maps/api/geocode/json?address=%ED%9A%A8%EC%A0%9C%EC%B4%88");
	       URLConnection tc = urlMy.openConnection();
	       BufferedReader in = new BufferedReader(new InputStreamReader(
	               tc.getInputStream()));
	      String line = "";
	      String str;
	       while((str = in.readLine()) != null) {
	          line += str;
	       }
	       
	       System.out.println(line);
	       resp.setContentType("text/html; charset=UTF-8");
	       resp.setCharacterEncoding("UTF-8");
	       resp.getWriter().print(line);
	}
	
}
