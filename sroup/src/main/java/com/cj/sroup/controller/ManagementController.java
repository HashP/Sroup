package com.cj.sroup.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;






import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.cj.sroup.service.M_firstService;
import com.cj.sroup.service.M_galleryService;
import com.cj.sroup.service.M_noticeService;
import com.cj.sroup.service.M_rollbookService;
import com.cj.sroup.view.ExcelView;
import com.cj.sroup.vo.E_rollbookVO;
import com.cj.sroup.vo.M_RollbookVO;
import com.cj.sroup.vo.M_boardReplyVO;
import com.cj.sroup.vo.M_boardVO;
import com.cj.sroup.vo.M_calEventVO;
import com.cj.sroup.vo.M_calendarVO;
import com.cj.sroup.vo.M_commentVO;
import com.cj.sroup.vo.M_galleryVO;
import com.cj.sroup.vo.M_noticeVO;
import com.cj.sroup.vo.UserInfoVO;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;


@Controller
@RequestMapping("/m_study/{study_address}")
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
	M_firstService m_firstservice;
	@Autowired
	private M_rollbookService rollbookService;
	@Autowired
	private ExcelView excelView;
	
	private Logger logger= Logger.getLogger(TestController.class);
	@Autowired
	private MappingJackson2JsonView jsonView;	
	
	// 카페 회원 여부 검사
	@RequestMapping("/checkuser")
	@ResponseBody
	public String checkuser(HttpSession session, @PathVariable("study_address") String study_address){
		int study_no = m_firstservice.get_studyNo(study_address);
		String login_id = (String) session.getAttribute("LOGIN_ID");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("study_no", new Integer(study_no).toString());
		map.put("login_id", login_id);
		
		String check = m_firstservice.check_cafeuser(map);
		if(check==null){
			System.out.println("check : "+check);
			return "false";
		} else {
			System.out.println("check : "+check);
			return "true";
		}
		
	}
	
	//  메뉴 페이지 이동 경로
	@RequestMapping("/m_main.do")
	public ModelAndView main(@PathVariable("study_address") String study_address){
		int study_no = m_firstservice.get_studyNo(study_address);	
		String admin = m_firstservice.get_Admin(study_no);
		ModelAndView mav = new ModelAndView();
		List<M_noticeVO> noticeList = m_noticeservice.getAllNotice(study_no);
		mav.addObject("noticeList",noticeList);
		mav.addObject("admin",admin);
		mav.setViewName("management/m_main");

		return mav;
	} 
	
	@RequestMapping("/m_border.do")
	public ModelAndView border(@PathVariable("study_address") String study_address,
						@RequestParam (value="cPage", defaultValue= "1" ) int cPage){
		
		int study_no = m_firstservice.get_studyNo(study_address);
		
		ModelAndView mav = new ModelAndView();
		
		int start = (cPage - 1) * 20 + 1;	
		int end = cPage * 20;	
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("study_no", study_no);
		num.put("start", start);
		num.put("end", end);
		List<M_boardVO> boardList =	m_boardservice.getBoard_list(num);
		int b_tot = m_boardservice.getAllBoardNo(study_no);
		mav.addObject("boardList",boardList);
		mav.addObject("b_tot", b_tot);
		mav.addObject("cPage",cPage);
		mav.setViewName("management/m_border");

		return mav;
	}
	
	@RequestMapping("/m_comment.do")
	public ModelAndView memberspeak(@PathVariable("study_address") String study_address){		
		int study_no = m_firstservice.get_studyNo(study_address);
		String admin = m_firstservice.get_Admin(study_no);
		
		ModelAndView mav = new ModelAndView();
		
		List<M_commentVO> commentList = m_commentservice.getAllComment(study_no);
		mav.addObject("commentList",commentList);		
		mav.addObject("admin",admin);		
		mav.setViewName("management/m_comment");

		return mav;		
	}
	
	@RequestMapping("/comment_selectday.do")
	@ResponseBody
	public HashMap<String,List<M_commentVO>> memberspeak_selectDay(@PathVariable("study_address") String study_address, 
															@RequestParam("selectDate") Date day){
		int study_no = m_firstservice.get_studyNo(study_address);
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String selectDate=sd.format(day);
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("selectDate", selectDate);
		param.put("study_no", Integer.toString(study_no));
		HashMap<String,List<M_commentVO>> map = new HashMap<String,List<M_commentVO>>();
		if(m_commentservice.getdateComment(param)==null){
			return null;
		}		
		List<M_commentVO> commentList = m_commentservice.getdateComment(param);
		
		map.put("commentList", commentList);
		

		return map;		
	}
	@RequestMapping(value="/m_album.do", method=RequestMethod.GET)	
	public ModelAndView albumList(@PathVariable("study_address") String study_address,
			@RequestParam (value="cPage", defaultValue= "1" ) int cPage){
		
		int study_no = m_firstservice.get_studyNo(study_address);
		String admin = m_firstservice.get_Admin(study_no);
		ModelAndView mav = new ModelAndView();		
		
		int start = (cPage - 1) * 9 + 1;	
		int end = cPage * 9;	
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("start", start);
		num.put("end", end);
		num.put("study_no", study_no);
		List<M_galleryVO> galleryList =	m_galleryservice.getGallery_list(num);
		int g_tot =m_galleryservice.getAllGalleryNo(study_no);
		mav.addObject("galleryList",galleryList);
		mav.addObject("g_tot", g_tot);			
		mav.addObject("cPage",cPage);
		mav.addObject("admin",admin);
		mav.setViewName("management/m_album");
		return mav;
	}
	@RequestMapping(value="/album_del.do" )	
	public String delalbum(@RequestParam ("g_no") int g_no,
				@RequestParam (value="cPage", defaultValue= "1")int cPage){
		m_galleryservice.delGallery(g_no);
		
		return "redirect:m_album.do?cPage"+cPage;
	}
	@RequestMapping(value="/album_rewrite.do")	
	public String re_album(@RequestParam (value="cPage", defaultValue= "1")int cPage,
						@RequestParam ("g_no") int g_no,
						@RequestParam("re_title")String title,
						@RequestParam("re_contents")String contents,
						@RequestParam(value="albumphoto2", required = false)MultipartFile photofile,
						@RequestParam(value="photoname", required = false)String now_photoname
						){
		String photoname;		
		photoname = m_galleryservice.m_albumImageUpload(photofile);
		contents=contents.replaceAll("&", "&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;");
		if(photoname==null){			
			photoname=now_photoname;
		}
		M_galleryVO m_gallery = new M_galleryVO();		
		System.out.println(photoname);
		m_gallery.setG_no(g_no);
		m_gallery.setG_title(title);
		m_gallery.setG_content(contents);
		m_gallery.setImageName(photoname);		
		
		m_galleryservice.reGallery(m_gallery);
		
		return "redirect:m_album.do?cPage"+cPage;
	}
	
	@RequestMapping("/m_rollbook.do")
	public String rollbook(){
		return "management/m_rollbook";
	}
	@RequestMapping("/m_calendar.do")
	public String calendar(){
		return "management/m_calendar";
	}
	@RequestMapping("/board_write.do")
	public String board_write(){
		return "management/board_write";
	}
	@RequestMapping("/board_rewrite.do")
	public ModelAndView board_rewrite(@PathVariable("study_address") String study_address,
				@RequestParam("b_no") int b_no){
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
	public ModelAndView board_read(@RequestParam("b_no") int b_no, @PathVariable("study_address") String study_address){
		m_boardservice.board_hitPlus(b_no);
		int study_no = m_firstservice.get_studyNo(study_address);	
		String admin = m_firstservice.get_Admin(study_no);
		ModelAndView mav = new ModelAndView();
		M_boardVO b_detail =  m_boardservice.getBoardDetail(b_no);
		List<M_boardReplyVO> b_reply =m_boardservice.getBoardReply(b_no);
		mav.addObject("b_detail", b_detail);
		mav.addObject("b_reply",b_reply);
		mav.addObject("admin",admin);
		mav.setViewName("management/board_read");
		return mav;
	}


	// 게시글 등록시 이동 경로
	@RequestMapping(value="/m_album.do", method=RequestMethod.POST)	
	public String albumAdd(@PathVariable("study_address") String study_address,
			@RequestParam("title")String title,
			@RequestParam("contents")String contents,
			@RequestParam("albumphoto")MultipartFile photofile,  HttpSession session){
		
		int study_no = m_firstservice.get_studyNo(study_address);
		String login_id = (String) session.getAttribute("LOGIN_ID");
		
		title=title.trim().replaceAll("&", "&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;");
		contents=contents.trim().replaceAll("&", "&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;");
		M_galleryVO m_gallery = new M_galleryVO();
		String photoname = m_galleryservice.m_albumImageUpload(photofile);
		System.out.println(photoname);
		m_gallery.setG_title(title);
		m_gallery.setG_content(contents);
		m_gallery.setImageName(photoname);
		m_gallery.setStudy_no(study_no);
		m_gallery.setG_writer(login_id);
		
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
	public HashMap<String, Integer> getPrevNext(@PathVariable("study_address") String study_address,
												@RequestParam("g_no") int g_no){
		int study_no = m_firstservice.get_studyNo(study_address);
		M_galleryVO m_gallery = new M_galleryVO();
		m_gallery.setStudy_no(study_no);
		m_gallery.setG_no(g_no);
		return m_galleryservice.getPrevNext(m_gallery);
	}
	
	@RequestMapping("/board_writesave.do")
	public String board_writesave(@PathVariable("study_address") String study_address,
			@RequestParam("title")String title,
			@RequestParam("content")String content,HttpSession session){
		
		int study_no = m_firstservice.get_studyNo(study_address);
		String login_id = (String) session.getAttribute("LOGIN_ID");
		
		title = title.trim().replaceAll("&", "&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;");
		M_boardVO m_board = new M_boardVO();
		m_board.setStudy_no(study_no);
		m_board.setB_title(title);
		m_board.setB_content(content);
		m_board.setB_writer(login_id);
		
		m_boardservice.addBoard(m_board);
		//int_b_no=m_boardservice.nowAdd_no(b_writer;)
		// 차후 작성글 바로 보기로 페이지 변경
		return "redirect:m_border.do";
	}
	@RequestMapping("/board_del.do")	
	public String board_del(@RequestParam("b_no")int b_no){					
		m_boardservice.delBoard(b_no);			
		return "redirect:m_border.do";
	}
	@RequestMapping("/board_resave.do")
	public String board_resave(@PathVariable("study_address") String study_address,
			@RequestParam("title")String title,
			@RequestParam("content")String content,
			@RequestParam("b_no") int b_no){
		title = title.replaceAll("&", "&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;");
		M_boardVO m_board = new M_boardVO();
		m_board.setB_title(title);
		m_board.setB_content(content);
		m_board.setB_no(b_no);
		
		m_boardservice.reBoard(m_board);
		// 차후 작성글 바로 보기로 페이지 변경
		return "redirect:board_read.do?b_no="+b_no;
	}
	
	// 덧글 등록 삭제 수정 기능 
	@RequestMapping(value="/boardreply_add.do" ,method=RequestMethod.POST)	
	public String boardreply_save(@RequestParam("b_no")int b_no,
			@RequestParam("content")String content,HttpSession session){
		content = content.replaceAll("&", "&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;");
		String login_id = (String) session.getAttribute("LOGIN_ID");
		M_boardReplyVO m_boardreply = new M_boardReplyVO();
		m_boardreply.setB_no(b_no);
		m_boardreply.setRe_content(content);
		m_boardreply.setRe_writer(login_id);
				
		m_boardservice.addBoardReply(m_boardreply);
		return "redirect:board_read.do?b_no="+b_no;
	}
	@RequestMapping("/boardreply_del.do")	
	public String boardreply_del(@RequestParam("re_no")int re_no, @RequestParam("b_no")int b_no){					
		m_boardservice.delBoardReply(re_no);	
		return "redirect:board_read.do?b_no="+b_no;
	}
	@RequestMapping("/boardreply_rewrite.do")	
	public String boardreply_rewrite(@RequestParam("re_no")int re_no, 
						@RequestParam("re_content")String re_content,
						@RequestParam("b_no")int b_no){
		re_content = re_content.replaceAll("&", "&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;");
		M_boardReplyVO b_reply = new M_boardReplyVO();
		b_reply.setRe_no(re_no);
		b_reply.setRe_content(re_content);
		m_boardservice.reBoardReply(b_reply);	
		return "redirect:board_read.do?b_no="+b_no;
	}
	// 덧글 등록 삭제 수정 끝 
	
	
	@RequestMapping("/notice_writesave.do")
	public String notice_writesave(@PathVariable("study_address") String study_address,
			@RequestParam("title")String title,
			@RequestParam("content")String content,HttpSession session){		
		// 차후 작성글 바로 보기로 페이지 변경
		int study_no = m_firstservice.get_studyNo(study_address);
		String login_id = (String) session.getAttribute("LOGIN_ID");
		
		title = title.trim().replaceAll("&", "&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;");		
		System.out.println(title + content + " 1번");
		M_noticeVO m_notice = new M_noticeVO();
		m_notice.setN_title(title);
		m_notice.setN_content(content);
		m_notice.setStudy_no(study_no);
		m_notice.setN_writer(login_id);
		
		m_noticeservice.addNotice(m_notice);

		return "redirect:m_main.do";
	}
	
	@RequestMapping("/notice_resave.do")
	public String notice_resave(@RequestParam("title")String title,
			@RequestParam("content")String content,
			@RequestParam("n_no") int n_no){
		title = title.trim().replaceAll("&", "&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;");
		M_noticeVO m_notice = new M_noticeVO();
		m_notice.setN_title(title);
		m_notice.setN_content(content);
		m_notice.setN_no(n_no);
		
		m_noticeservice.reNotice(m_notice);
		// 차후 작성글 바로 보기로 페이지 변경
		return "redirect:m_main.do";
	}
	@RequestMapping("/notice_rewrite.do")
	public ModelAndView notice_rewrite(@RequestParam("n_no") int n_no){
		ModelAndView mav = new ModelAndView();
		M_noticeVO m_notice =  m_noticeservice.reNoticeInfo(n_no);		
		mav.addObject("m_notice", m_notice);		
		mav.setViewName("management/notice_rewrite");
		return mav;		
	}

	@RequestMapping("/comment_add.do")
	// 차후 작성자 아이디 도 가져와야함 writer
	public String comment_writesave(@PathVariable("study_address") String study_address,
					@RequestParam("content")String content,HttpSession session){		
		
		int study_no = m_firstservice.get_studyNo(study_address);
		String login_id = (String) session.getAttribute("LOGIN_ID");
		
		M_commentVO m_comment = new M_commentVO();
		content = content.replaceAll("&", "&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;");
		System.out.println(content);
		m_comment.setC_content(content);
		m_comment.setC_writer(login_id);
		m_comment.setStudy_no(study_no);
		m_commentservice.addComment(m_comment);
		// 차후 작성글 바로 보기로 페이지 변경
		return "redirect:m_comment.do";
	}
	@RequestMapping("/comment_del.do")	
	@ResponseBody
	public void comment_writesave(@RequestParam("c_no")int c_no){					
		m_commentservice.delComment(c_no);			
	}
	
	@RequestMapping("/comment_resave.do")	
	@ResponseBody
	public M_commentVO comment_rewrite(@RequestParam("c_no")int c_no,
						@RequestParam("c_content") String c_content){
		c_content = c_content.replaceAll("&", "&amp;").replaceAll("<","&lt;").replaceAll(">","&gt;");
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
	public View calEvent(Model model, @PathVariable("study_address") String study_address){	
		int study_no = m_firstservice.get_studyNo(study_address);
		
		List<M_calEventVO> eventList = m_calendarservice.getAllEvent(study_no);
		System.out.println(eventList.toString());
		model.addAttribute("eventList",eventList);

		return jsonView;
	}

	// 캘린더 이벤트 추가하는 곳
	@RequestMapping("/calEventAdd.do")
	@ResponseBody
	public void calEventAdd(@PathVariable("study_address") String study_address,
			@RequestParam("event_start") String event_start,
			@RequestParam("event_end") String event_end,
			@RequestParam("event_title") String event_title,
			@RequestParam("event_content") String event_content, 
			@RequestParam("event_color") String event_color, HttpSession session)throws ParseException{	
		int study_no = m_firstservice.get_studyNo(study_address);
		String login_id = (String) session.getAttribute("LOGIN_ID");
		
		SimpleDateFormat sd = new SimpleDateFormat(
				"yyyy.MM.dd aa hh시 mm분");
		System.out.println(event_start +"전");
//		
		System.out.println(sd.parse(event_start) +"후");
		M_calendarVO m_calendar = new M_calendarVO();
		m_calendar.setEvent_start(sd.parse(event_start));
		m_calendar.setEvent_end(sd.parse(event_end));
		m_calendar.setEvent_title(event_title);;
		m_calendar.setEvent_content(event_content);
		m_calendar.setEvent_color(event_color);
		m_calendar.setStudy_no(study_no);
		m_calendar.setEvent_writer(login_id);

		m_calendarservice.addCalEvent(m_calendar);			

	}
	
	// 캘린더 이벤트 수정하는 곳(드래그시&resize 시)
		@RequestMapping(value="/changeCalEvent.do" ,method=RequestMethod.POST)
		@ResponseBody
		public void calEventChange(@RequestParam("calEvent_id") int event_id,
				@RequestParam("event_start") String event_start,
				@RequestParam("event_end") String event_end) throws ParseException{	
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			M_calEventVO m_calEvent = new M_calEventVO();
			m_calEvent.setEvent_start(sd.parse(event_start));
			m_calEvent.setEvent_end(sd.parse(event_end));
			m_calEvent.setEvent_id(event_id);
			m_calendarservice.chagneCalEvent(m_calEvent);			
			
		}
	
	// 캘린더 이벤트 삭제하는 곳
	@RequestMapping("/calEventDel.do")
	@ResponseBody
	public void calEventDel(@RequestParam("calEvent_id") int event_id){				
		m_calendarservice.delCalEvent(event_id);			
		
	}
	
	
	
	@RequestMapping("/template.do")
	public String test() {
		return "template";
	}
	
	@RequestMapping("/testrollbook.do")
	public String testRollBook(Model model, @PathVariable("study_address") String study_address) {
		int studyNo =  m_firstservice.get_studyNo(study_address);
		model.addAttribute("studyNo", studyNo);
		
		List<UserInfoVO> memberList = rollbookService.getMemberListByStudyno(studyNo);
		model.addAttribute("memberList", memberList);
		
		return "management/m_rollbook";
	}
		
	@RequestMapping("/getSchedules.do")
	public View getSchedules(Model model,@RequestParam("studyNo")int studyNo) {
//		int studyNo = 3;		///이건 나중에 GET으로 받아올 값
		
		List<String> scheduleList = rollbookService.getSchedulesByStudyno(studyNo);
		model.addAttribute("scheduleList", scheduleList);
		logger.info("scheduleList: " + scheduleList);

		return jsonView;
	}
	
	@RequestMapping("/getAttendCounts.do")
	public View getAttendCountByStudyno(Model model,@RequestParam("studyNo")int studyNo) {
		HashMap<String, HashMap<String, Object>> attendCounts = rollbookService.getAttendCountByStudyno(studyNo);
		model.addAttribute("attendCounts", attendCounts);
		logger.info("attendCounts: " + attendCounts);
		return jsonView;
	}
	
	@RequestMapping("/getRollbookByDate.do")
	public View getRollbookByDate(Model model, @RequestParam("studyNo")int studyNo, @RequestParam("date")String date) throws ParseException {
		HashMap<String, M_RollbookVO> rollbook = rollbookService.getAttendByDay(studyNo, date);	//date must be pattern 'yyyy-mm-dd';
		model.addAttribute("rollbook", rollbook);
		logger.info("rollbook: " + rollbook);
		return jsonView;
	}
	
	@RequestMapping("/saveRollbookByRbno.do")
	public View saveRollbookByRbno(Model model, M_RollbookVO rollbook, HttpSession session) {
		logger.info(rollbook);
		
		String loginId = (String)session.getAttribute("LOGIN_ID");
		rollbook.setWriter(loginId);
		
		int attendCount = rollbookService.saveRollbookByRbno(rollbook);
		model.addAttribute("attendCount", attendCount);
		
		return jsonView;
	}
	
	@RequestMapping("/addRollbookByRbno.do")
	public View addRollbookByRbno(HttpSession session, Model model, M_RollbookVO rollbook, @RequestParam("date")String date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		rollbook.setAttendDay(sdf.parse(date));
		rollbook.setWriter((String)session.getAttribute("LOGIN_ID"));
		
		logger.info(date);
		logger.info(rollbook);

		HashMap<String, Integer> resultMap =  rollbookService.addRollbookByRbno(rollbook);
		model.addAttribute("rbNo", resultMap.get("rbNo"));
		model.addAttribute("attendCount", resultMap.get("attendCount"));
		
		return jsonView;
	}
	
	@RequestMapping("/xls.do")
		public ModelAndView excel(@RequestParam("excel_row") String[] excel_row){
	
		
		ModelAndView mav = new ModelAndView();
		ArrayList<E_rollbookVO> rollbooks = new ArrayList<E_rollbookVO>();		
			
		int cnt = 3;
		System.out.println(excel_row.length+"!");
		for(int i=0; i<(excel_row.length)/4; i++){
			if (i != 0) {
				E_rollbookVO rollbook = new E_rollbookVO();
			
				rollbook.setName(excel_row[i + cnt]);
				rollbook.setAttend(excel_row[i + 1 + cnt]);
				rollbook.setNote(excel_row[i + 2 + cnt]);
				rollbook.setAttend_rate(excel_row[i + 3 + cnt]);			
				cnt = cnt * 2;
				rollbooks.add(i, rollbook);				
				
			} else if (i == 0) {
				E_rollbookVO rollbook = new E_rollbookVO();				
				rollbook.setName(excel_row[i]);
				rollbook.setAttend(excel_row[i + 1]);
				rollbook.setNote(excel_row[i + 2]);
				rollbook.setAttend_rate(excel_row[i + 3]);
				rollbooks.add(i, rollbook);
			} else {
			}
			
		
		}
		
		mav.addObject("rollbooks", rollbooks);
		mav.setView(excelView);
		return mav;


//		rollbooks.add(new Contact(23,"이순신","010-1234-5678","lee@naver.com"));
//		contacts.add(new Contact(24,"강감찬","010-1111-2222","kang@naver.com"));
//		contacts.add(new Contact(25,"홍길동","010-3333-4444","hong@naver.com"));
//		contacts.add(new Contact(26,"김유신","010-5555-6666","kim@naver.com"));
//		contacts.add(new Contact(27,"을지문덕","010-7777-8888","eulzi@naver.com"));
		
		
		
		
	}

//	@RequestMapping("/importcalendar.do")
//	public String importcalendar(){
//		return "management/m_importcalendar";
//	}
}
