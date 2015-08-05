package com.cj.sroup.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cj.sroup.service.M_boardService;
import com.cj.sroup.service.M_commentService;
import com.cj.sroup.service.M_galleryService;
import com.cj.sroup.vo.M_boardVO;
import com.cj.sroup.vo.M_commentVO;
import com.cj.sroup.vo.M_galleryVO;


@Controller
public class ManagementController {
	
	@Autowired
	M_galleryService m_galleryservice;
	@Autowired
	M_boardService m_boardservice;
	@Autowired
	M_commentService m_commentservice;
	
	//  메뉴 페이지 이동 경로
	@RequestMapping("/m_main.do")
	public String main(){
		return "management/m_main";
	} 
	@RequestMapping("/m_border.do")
	public ModelAndView border(){
		ModelAndView mav = new ModelAndView();
		List<M_boardVO> boardList =	m_boardservice.getAllBoard();
		mav.addObject("boardList",boardList);
		mav.setViewName("management/m_border");
		
		return mav;
	}
	@RequestMapping("/m_comment.do")
	public ModelAndView memberspeak(){
		ModelAndView mav = new ModelAndView();
		List<M_commentVO> commentList = m_commentservice.getAllComment();
		mav.addObject("commentList",commentList);		
		mav.setViewName("management/m_comment");
		
		return mav;		
	}
	@RequestMapping(value="/m_album.do", method=RequestMethod.GET)	
	public ModelAndView albumList(){
		ModelAndView mav = new ModelAndView();
		List<M_galleryVO> galleryList = m_galleryservice.getAllGallery();
		mav.addObject("galleryList",galleryList);		
		mav.setViewName("management/m_album");
		return mav;
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
	
	

	// 게시글 등록시 이동 경로
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
	@RequestMapping("/board_writesave.do")
	public String board_writesave(@RequestParam("title")String title,
								@RequestParam("content")String content){
		M_boardVO m_board = new M_boardVO();
		m_board.setB_title(title);
		m_board.setB_content(content);
		
		m_boardservice.addBoard(m_board);
		// 차후 작성글 바로 보기로 페이지 변경
		return "redirect:m_border.do";
	}
	
	@RequestMapping("/comment_add.do")
	// 차후 작성자 아이디 도 가져와야함 writer
	public String comment_writesave(@RequestParam("content")String content){		
		M_commentVO m_comment = new M_commentVO();		
		System.out.println(content);
		m_comment.setC_content(content);
		
		m_commentservice.addComment(m_comment);
		// 차후 작성글 바로 보기로 페이지 변경
		return "redirect:m_comment.do";
	}
	
	
	
}
