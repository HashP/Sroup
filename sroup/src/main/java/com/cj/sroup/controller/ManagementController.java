package com.cj.sroup.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import com.cj.sroup.vo.M_boardReplyVO;
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
	public ModelAndView border(@RequestParam (value="cPage", defaultValue= "1" ) int cPage){
		ModelAndView mav = new ModelAndView();
		
		int start = (cPage - 1) * 20 + 1;	
		int end = cPage * 20;	
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("start", start);
		num.put("end", end);
		List<M_boardVO> boardList =	m_boardservice.getBoard_list(num);
		int b_tot = m_boardservice.getAllBoardNo();
		mav.addObject("boardList",boardList);
		mav.addObject("b_tot", b_tot);
		mav.addObject("cPage",cPage);
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
	public ModelAndView albumList(@RequestParam (value="cPage", defaultValue= "1" ) int cPage){
		ModelAndView mav = new ModelAndView();		
		
		int start = (cPage - 1) * 9 + 1;	
		int end = cPage * 9;	
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("start", start);
		num.put("end", end);
		List<M_galleryVO> galleryList =	m_galleryservice.getGallery_list(num);
		int g_tot =m_galleryservice.getAllGalleryNo();
		mav.addObject("galleryList",galleryList);
		mav.addObject("g_tot", g_tot);			
		mav.addObject("cPage",cPage);
		mav.setViewName("management/m_album");
		return mav;
	}
	@RequestMapping(value="/album_del.do" )
	
	public String delalbum(@RequestParam ("g_no") int g_no,
				@RequestParam (value="cPage", defaultValue= "1")int cPage){
		m_galleryservice.delGallery(g_no);
		
		return "redirect:m_album.do?cPage"+cPage;
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
	@RequestMapping("/board_rewrite.do")
	public ModelAndView board_rewrite(@RequestParam("b_no") int b_no){
		ModelAndView mav = new ModelAndView();
		M_boardVO b_detail =  m_boardservice.getBoardDetail(b_no);		
		mav.addObject("b_detail", b_detail);		
		mav.setViewName("management/board_rewrite");
		return mav;		
	}
	@RequestMapping("/notice_write.do")
	public String notice_write(){
		return "management/notice_write";
	}	
	@RequestMapping("/board_read.do")
	public ModelAndView board_read(@RequestParam("b_no") int b_no){
		ModelAndView mav = new ModelAndView();
		M_boardVO b_detail =  m_boardservice.getBoardDetail(b_no);
		List<M_boardReplyVO> b_reply =m_boardservice.getBoardReply(b_no);
		mav.addObject("b_detail", b_detail);
		mav.addObject("b_reply",b_reply);
		mav.setViewName("management/board_read");
		return mav;
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
	
	@RequestMapping("/detail_album.do")
	@ResponseBody
	public M_galleryVO detail_album(@RequestParam("g_no") int g_no){
		return m_galleryservice.detail_Gallery(g_no);
	}
	
	// 앨범 모달 클릭시 앞 뒤 번호 가져올 값들
	@RequestMapping("/getPrevNext.do")
	@ResponseBody
	public HashMap<String, Integer> getPrevNext(@RequestParam("g_no") int g_no){
		return m_galleryservice.getPrevNext(g_no);
	}
	
	@RequestMapping("/board_writesave.do")
	public String board_writesave(@RequestParam("title")String title,
			@RequestParam("content")String content){
		M_boardVO m_board = new M_boardVO();
		m_board.setB_title(title);
		m_board.setB_content(content);

		m_boardservice.addBoard(m_board);
		//int_b_no=m_boardservice.nowAdd_no(b_writer;)
		// 차후 작성글 바로 보기로 페이지 변경
		return "redirect:m_border.do";
	}
	@RequestMapping("/board_del.do")	
	public String board_del(@RequestParam("b_no")int b_no){					
		m_boardservice.delBoard(b_no);	
		return "redirect:board_read.do?b_no="+b_no;
	}
	@RequestMapping("/board_resave.do")
	public String board_resave(@RequestParam("title")String title,
			@RequestParam("content")String content,
			@RequestParam("b_no") int b_no){
		M_boardVO m_board = new M_boardVO();
		m_board.setB_title(title);
		m_board.setB_content(content);
		m_board.setB_no(b_no);
		
		m_boardservice.reBoard(m_board);
		// 차후 작성글 바로 보기로 페이지 변경
		return "redirect:m_border.do";
	}
	
	// 덧글 등록 삭제 기능 
	@RequestMapping("/boardreply_add.do")	
	public String boardreply_save(@RequestParam("b_no")int b_no,
			@RequestParam("content")String content){
		M_boardReplyVO m_boardreply = new M_boardReplyVO();
		m_boardreply.setB_no(b_no);
		m_boardreply.setRe_content(content);
				
		m_boardservice.addBoardReply(m_boardreply);
		return "redirect:board_read.do?b_no="+b_no;
	}
	@RequestMapping("/boardreply_del.do")	
	public String boardreply_del(@RequestParam("re_no")int re_no, @RequestParam("b_no")int b_no){					
		m_boardservice.delBoardReply(re_no);	
		return "redirect:board_read.do?b_no="+b_no;
	}
	// 덧글 등록 삭제 끝 
	
	
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
	@RequestMapping("/comment_del.do")	
	@ResponseBody
	public void comment_writesave(@RequestParam("c_no")int c_no){					
		m_commentservice.delComment(c_no);			
	}
	
	@RequestMapping("/comment_rewrite.do")	
	@ResponseBody
	public M_commentVO comment_rewrite(@RequestParam("c_no")int c_no,
						@RequestParam("c_content") String c_content){
		
		M_commentVO m_comment = new M_commentVO();
		m_comment.setC_content(c_content);
		m_comment.setC_no(c_no);
		M_commentVO re_comment = m_commentservice.rewriteComment(m_comment);
				
		return re_comment;
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
				"yyyy.MM.dd aa hh시 mm분");
		System.out.println(event_start +"전");
		
		System.out.println(sd.parse(event_start) +"후");
		M_calendarVO m_calendar = new M_calendarVO();
		m_calendar.setEvent_start(sd.parse(event_start));
		m_calendar.setEvent_end(sd.parse(event_end));
		m_calendar.setEvent_title(event_title);;
		m_calendar.setEvent_content(event_content);
		m_calendar.setEvent_color(event_color);

		m_calendarservice.addCalEvent(m_calendar);			

	}
	
	// 캘린더 이벤트 삭제하는 곳
	@RequestMapping("/calEventDel.do")
	@ResponseBody
	public void calEventDel(@RequestParam("calEvent_id") int event_id){				
		m_calendarservice.delCalEvent(event_id);			
		
	}

}
