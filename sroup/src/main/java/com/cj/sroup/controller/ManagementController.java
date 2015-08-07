package com.cj.sroup.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.cj.sroup.service.M_boardService;
import com.cj.sroup.service.M_calendarService;
import com.cj.sroup.service.M_commentService;
import com.cj.sroup.service.M_galleryService;
import com.cj.sroup.service.M_noticeService;
import com.cj.sroup.vo.M_boardVO;
import com.cj.sroup.vo.M_calEventVO;
import com.cj.sroup.vo.M_calendarVO;
import com.cj.sroup.vo.M_commentVO;
import com.cj.sroup.vo.M_galleryVO;
import com.cj.sroup.vo.M_noticeVO;


@Controller
public class ManagementController {

	@Autowired
	M_galleryService m_galleryservice;
	@Autowired
	M_boardService m_boardservice;
	@Autowired
	M_commentService m_commentservice;
	@Autowired
	M_calendarService m_calendarservice;
	@Autowired
	M_noticeService m_noticeservice;

	@Autowired
	private MappingJackson2JsonView jsonView;

	//  메뉴 페이지 이동 경로
	@RequestMapping("/m_main.do")
	public ModelAndView main(){
		ModelAndView mav = new ModelAndView();
		List<M_noticeVO> noticeList =	m_noticeservice.getAllNotice();
		mav.addObject("noticeList",noticeList);
		mav.setViewName("management/m_main");

		return mav;
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
	@RequestMapping("/notice_write.do")
	public String notice_write(){
		return "management/notice_write";
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
	@RequestMapping("/notice_writesave.do")
	public String notice_writesave(@RequestParam("title")String title,
			@RequestParam("content")String content){		
		// 차후 작성글 바로 보기로 페이지 변경
		System.out.println(title + content + " 1번");
		M_noticeVO m_notice = new M_noticeVO();
		m_notice.setN_title(title);
		m_notice.setN_content(content);

		m_noticeservice.addNotice(m_notice);

		return "redirect:m_main.do";
	}

	@RequestMapping("/comment_add.do")
	// 차후 작성자 아이디 도 가져와야함 writer
	public String comment_writesave(@RequestParam("content")String content){		
		M_commentVO m_comment = new M_commentVO();			
		m_comment.setC_content(content);

		m_commentservice.addComment(m_comment);
		// 차후 작성글 바로 보기로 페이지 변경
		return "redirect:m_comment.do";
	}
	// 공지사항 글 삭제하는 곳
	@RequestMapping("/notice_del.do")
	@ResponseBody
	public void notice_del(int n_no){	
		m_noticeservice.delNotice(n_no);
	}

	// 캘린더 이벤트 jsonView로 읽어오는 곳
	@RequestMapping("/calEvent.do")	
	@ResponseBody
	public View calEvent(Model model){		
		List<M_calEventVO> eventList = m_calendarservice.getAllEvent();
		System.out.println(eventList.toString());
		model.addAttribute("eventList",eventList);

		return jsonView;
	}

	// 캘린더 이벤트 추가하는 곳
	@RequestMapping("/calEventAdd.do")
	@ResponseBody
	public void calEventAdd(@RequestParam("event_start") String event_start,
			@RequestParam("event_end") String event_end,
			@RequestParam("event_title") String event_title,
			@RequestParam("event_content") String event_content, 
			@RequestParam("event_color") String event_color)throws ParseException{
		SimpleDateFormat sd = new SimpleDateFormat(
				"yyyy-MM-dd hh:mm");


		M_calendarVO m_calendar = new M_calendarVO();
		m_calendar.setEvent_start(sd.parse(event_start));
		m_calendar.setEvent_end(sd.parse(event_end));
		m_calendar.setEvent_title(event_title);;
		m_calendar.setEvent_content(event_content);
		m_calendar.setEvent_color(event_color);

		m_calendarservice.addCalEvent(m_calendar);
			

	}

}
