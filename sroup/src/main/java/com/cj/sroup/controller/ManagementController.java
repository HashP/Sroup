package com.cj.sroup.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cj.sroup.service.M_galleryService;
import com.cj.sroup.vo.M_galleryVO;




@Controller
public class ManagementController {
	@Autowired
	M_galleryService m_galleryservice;
	
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
	
	@RequestMapping(value="/m_album.do", method=RequestMethod.GET)	
	public ModelAndView albumList(){
		ModelAndView mav = new ModelAndView();
		List<M_galleryVO> galleryList = m_galleryservice.getAllGallery();
		mav.addObject("galleryList",galleryList);
		mav.setViewName("management/m_album");
		return mav;
	}
	
	@RequestMapping(value="/m_album.do", method=RequestMethod.POST)	
	public String albumAdd(@RequestParam("title")String title,
						@RequestParam("contents")String contents,
						@RequestParam("albumphoto")MultipartFile photofile){
		
		M_galleryVO m_gallery = new M_galleryVO();
		String photoname = m_galleryservice.m_albumImageUpload(photofile);
		System.out.println(photoname);
		m_gallery.setG_title(title);
		m_gallery.setG_content(contents);
		m_gallery.setImageName(photoname);
		
		m_galleryservice.addGallery(m_gallery);
		return "redirect:m_album.do";
	}
	@RequestMapping("/m_rollbook.do")
	public String rollbook(){
		return "management/m_rollbook";
	}
	@RequestMapping("/m_calendar.do")
	public String calenda(){
		return "management/m_calendar";
	}
	@RequestMapping("/board_write.do")
	public String board_write(){
		return "management/board_write";
	}
	
	
	
}
