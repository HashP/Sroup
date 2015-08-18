package com.cj.sroup.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.cj.sroup.service.MyPageService;
import com.cj.sroup.service.StudyService;
import com.cj.sroup.vo.CategoryVO;
import com.cj.sroup.vo.CheckVO;
import com.cj.sroup.vo.JoinVO;
import com.cj.sroup.vo.ListVO;
import com.cj.sroup.vo.StudyManagementVO;
import com.cj.sroup.vo.StudyVO;
import com.cj.sroup.vo.UserInfoVO;

@Controller
public class ListController {

	@Autowired
	StudyService service;

	@Autowired
	private MappingJackson2JsonView jsonView;
	
	@Autowired
	MyPageService myService;
	@RequestMapping("/map2.do")
	public void map2(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		resp.setContentType("text/plain;charset=utf-8;");

		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		String latlng = lng+","+lat;
		System.out.println(latlng);
		URL urlMy=new URL("http://openapi.map.naver.com/api/reversegeocode?key=5c2814aa90dac61ea095ac66fe8cda82&encoding=utf-8&coord=latlng&output=json&query="+ latlng);
		URLConnection tc = urlMy.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(tc.getInputStream()));
		String line = "";
		String str;
		while((str = in.readLine()) != null) {
			line += str;
		}

		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().print(line);
	}

	@RequestMapping("/studyAdd.do")
	public String studyAdd(Model model, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date endDate = transFormat.parse(req.getParameter("endDate"));
		Date startDate = transFormat.parse(req.getParameter("startDate"));
		Date periodDate = transFormat.parse(req.getParameter("appPeriodDate"));
		String checkRule = req.getParameter("checkRule");
		
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		String c_area = req.getParameter("c_area");
		String maxPerson = req.getParameter("maxPerson");
		
		System.out.println("c_area: " + c_area);
		
		if(c_area.length() == 4) {
			String a = c_area.substring(0, 1);
			String b = c_area.substring(2, 3);
			c_area = a+b;
		} else if(c_area.length() > 4){
			c_area = c_area.substring(0, 2);
		} else if(1 < c_area.length() && c_area.length() < 4) {
			c_area = c_area.substring(0, 2);
		} else {
			c_area = "서울";
		}
		String user_id = req.getParameter("user_id");
		System.out.println("user_id" + user_id);

		StudyVO study = new StudyVO();
		
		String subject = service.getSubjectByNo(req.getParameter("category"));
		
		int study_no = service.getStudyNo();
		
		StudyManagementVO studyManagement = new StudyManagementVO();
		UserInfoVO user = new UserInfoVO();
		user.setId(user_id);
		studyManagement.setStudy(study);
		studyManagement.setUser(user);
		studyManagement.setGrade("ADMIN");
		
		String join_able = "y";
		if((Integer.parseInt(maxPerson)-1) < 1) {
			join_able = "n";
		}
		
		
		study.setJoin_able(join_able);
		study.setUser_id(user_id);
		study.setStudy_no(study_no);
		study.setC_subject(subject);
		study.setStudy_name(req.getParameter("title"));
		study.setS_summary(req.getParameter("summary"));
		study.setC_area(c_area);
		study.setS_image(req.getParameter("s_image"));
		study.setS_detail(req.getParameter("textEditor"));
		study.setS_admit_method(checkRule);
		study.setS_max_person(Integer.parseInt(maxPerson));
		study.setS_dues(req.getParameter("dues"));
		study.setStart_date(startDate);
		study.setStart_date_time(req.getParameter("startDateTime"));
		study.setEnd_date(endDate);
		study.setEnd_date_time(req.getParameter("endDateTime"));
		study.setS_application_period(periodDate);
		study.setS_application_period_time(req.getParameter("appPeriodDateTime"));
		study.setS_area(req.getParameter("location"));
		study.setMap_lat(lat);
		study.setMap_lng(lng);
		study.setP_address(req.getParameter("pAddr"));

		service.addStudy(study);
		service.addStudyManagement(studyManagement);

		return "redirect:list.do";
	}
	
	@RequestMapping("/hidden.do")
	public void studyHidden(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int study_no = Integer.parseInt(req.getParameter("study_no"));
		StudyVO study = service.getAvailable(study_no);
		String returnValue = "";
		
		System.out.println("참여가능인원 : " + study.getAvailable());
		System.out.println("최대인원 : " + study.getS_max_person());
		if( (study.getS_max_person() - study.getAvailable()) == 1 ) {
			returnValue = "Y";
			resp.getWriter().write(returnValue);
			service.studyHidden(study_no);
		} else {
			returnValue = "N";
			resp.getWriter().write(returnValue);
		}
	}
	
	@RequestMapping("/modify.do")
	public String modify(Model model, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date endDate = transFormat.parse(req.getParameter("endDate"));
		Date startDate = transFormat.parse(req.getParameter("startDate"));
		Date periodDate = transFormat.parse(req.getParameter("appPeriodDate"));
		String checkRule = req.getParameter("checkRule");
		
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		String c_area = req.getParameter("c_area");
		String maxPerson = req.getParameter("maxPerson");
		
		System.out.println("c_area: " + c_area);
		
		if(c_area.length() == 4) {
			String a = c_area.substring(0, 1);
			String b = c_area.substring(2, 3);
			c_area = a+b;
		} else if(c_area.length() > 4){
			c_area = c_area.substring(0, 2);
		} else if(1 < c_area.length() && c_area.length() < 4) {
			c_area = c_area.substring(0, 2);
		} else {
			c_area = "서울";
		}
		String user_id = req.getParameter("user_id");
		System.out.println("user_id" + user_id);

		StudyVO study = new StudyVO();
		
		String subject = service.getSubjectByNo(req.getParameter("category"));
		
		int study_no = Integer.parseInt(req.getParameter("study_no"));
		
		StudyManagementVO studyManagement = new StudyManagementVO();
		UserInfoVO user = new UserInfoVO();
		user.setId(user_id);
		studyManagement.setStudy(study);
		studyManagement.setUser(user);
		studyManagement.setGrade("ADMIN");
		
		String join_able = "y";
		if((Integer.parseInt(maxPerson)-1) < 1) {
			join_able = "n";
		}
		
		
		study.setJoin_able(join_able);
		study.setUser_id(user_id);
		study.setStudy_no(study_no);
		
		study.setC_subject(subject);
		study.setStudy_name(req.getParameter("title"));
		System.out.println(req.getParameter("title"));
		study.setS_summary(req.getParameter("summary"));
		study.setC_area(c_area);
		study.setS_image(req.getParameter("s_image"));
		study.setS_detail(req.getParameter("textEditor"));
		study.setS_admit_method(checkRule);
		study.setS_max_person(Integer.parseInt(maxPerson));
		study.setS_dues(req.getParameter("dues"));
		study.setStart_date(startDate);
		study.setStart_date_time(req.getParameter("startDateTime"));
		study.setEnd_date(endDate);
		study.setEnd_date_time(req.getParameter("endDateTime"));
		study.setS_application_period(periodDate);
		study.setS_application_period_time(req.getParameter("appPeriodDateTime"));
		study.setS_area(req.getParameter("location"));
		study.setMap_lat(lat);
		study.setMap_lng(lng);
		study.setP_address(req.getParameter("pAddr"));

		service.studyModify(study);

		return "redirect:list.do";
	}
	
	@RequestMapping("/list.do")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		List<CategoryVO> categories = service.getCategories();
		List<CategoryVO> area = service.getArea();
		List<ListVO> lists = new ArrayList<ListVO>();
		lists = service.getAllStudiesDefault();
		
		mav.addObject("lists", lists);
		mav.addObject("categories", categories);
		mav.addObject("area", area);
		mav.setViewName("list/list");
		
		return mav;
	}
	@RequestMapping("/list2.do")
	public ModelAndView list2(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		ModelAndView mav = new ModelAndView();
		String keyword = req.getParameter("keyword");
		System.out.println(keyword);
		
		String orderby = req.getParameter("orderby");
		String[] category = req.getParameterValues("category");
		String[] region = req.getParameterValues("region");
		String[] cost = req.getParameterValues("cost");
		
		Map<String, Object> param = new HashMap<String, Object>();

		System.out.println("orderby : " + orderby);
		System.out.println("category : " + category);
		System.out.println("region : " + region);
		System.out.println("cost : " + cost);
		
		if(category != null) {
			param.put("item1", category);
		}
		
		if(region != null) {
			param.put("item2", region);
		}
		if(cost != null) {
			param.put("min", Integer.parseInt(cost[0]));
			
			if(cost[0].equals("0")) {
				param.put("max", 10000);
			} else if(cost[0].equals("10000")) {
				param.put("max", 25000);
			} else if(cost[0].equals("25000")) {
				param.put("max", 40000);
			} else if(cost[0].equals("40000")) {
				param.put("max", 1000000);
			}
			
		}
		if(orderby == null) {
			orderby = "s_hit";
		}
		String sort = "desc";
		
		if(orderby.equals("s_application_period")) {
			sort = "asc";
		}
		
		param.put("orderby", orderby);
		param.put("sort", sort);
		
		List<ListVO> lists = service.getAllStudies(param);
		
		if(keyword != null) {
			lists = service.getAllStudiesBySearch(keyword);
		}
		
		mav.addObject("lists", lists);
		mav.setView(jsonView);
		
		return mav;
	}
	
	@RequestMapping("/search.do")
	public ModelAndView search(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		ModelAndView mav = new ModelAndView();
		String keyword = req.getParameter("keyword");
		List<ListVO> lists = new ArrayList<ListVO>();
		System.out.println(keyword);
		
		if(keyword != null) {
			lists = service.getAllStudiesBySearch(keyword);
		}
		
		mav.addObject("lists", lists);
		mav.setView(jsonView);
		
		return mav;
	}
	
	@RequestMapping("/detail.do")
	public ModelAndView detail(HttpServletRequest req, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("LOGIN_ID");
		if(loginId == null) {
			loginId = "a";
		}
		int study_no = Integer.parseInt(req.getParameter("no"));
		
		mav.setViewName("list/detail");
		service.studyHit(study_no);
		StudyVO studyInfo = service.getStudyInfoByNo(study_no);
		StudyVO available = service.getAvailable(study_no);
		UserInfoVO userInfo = myService.getUserInfoById(studyInfo.getUser_id());
		List<ListVO> lists = service.getAllStudiesDefault();
		mav.addObject("studyInfo", studyInfo);
		mav.addObject("available", available);
		mav.addObject("userInfo", userInfo);
		mav.addObject("lists", lists);
		mav.addObject("loginId", loginId);
		
		return mav;
	}
	@RequestMapping("/joinCancel.do")
	public void joinCancel(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int study_no = Integer.parseInt(req.getParameter("study_no"));
		String user_id = req.getParameter("user_id");
		String returnValue = "";
		
		StudyVO study = new StudyVO();
		study.setStudy_no(study_no);
		
		UserInfoVO user = new UserInfoVO();
		user.setId(user_id);
		
		JoinVO join = new JoinVO();
		join.setStudy(study);
		join.setApplicant(user);
		JoinVO joinCheck = service.getJoinInfo(join);
		if(joinCheck != null) {
			service.deleteJoin(join);
			returnValue = "Y";
			resp.getWriter().write(returnValue);
		} else {
			returnValue = "N";
			resp.getWriter().write(returnValue);
		}
		
		
	}
	
	@RequestMapping("/join.do")
	public void join(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String returnValue = "";
		int study_no = Integer.parseInt(req.getParameter("study_no"));
		String user_id = req.getParameter("user_id");
		String admit = req.getParameter("admit");
		
		StudyVO study = new StudyVO();
		study.setStudy_no(study_no);
		
		UserInfoVO user = new UserInfoVO();
		user.setId(user_id);
		String grade = "";
		
		JoinVO join2 = new JoinVO();
		join2.setStudy(study);
		join2.setApplicant(user);
		
		
		StudyManagementVO studyManage = new StudyManagementVO();
		StudyManagementVO studyManage2 = new StudyManagementVO();
		
		studyManage.setStudy(study);
		studyManage.setUser(user);
		studyManage2.setStudy(study);
		studyManage2.setUser(user);
		grade = "ADMIN";
		studyManage.setGrade(grade);
		grade = "NORMAL";
		studyManage2.setGrade(grade);
		
		StudyManagementVO studyJoin = service.getStudyManagementInfo(studyManage);
		StudyManagementVO studyJoin2 = service.getStudyManagementInfo(studyManage2);
		
		JoinVO join3 = service.getJoinInfo(join2);
		
		if(studyJoin != null) {
			returnValue = "SELF";
			resp.getWriter().write(returnValue);
		} else if (studyJoin2 != null || join3 != null) {
			returnValue = "N";
			resp.getWriter().write(returnValue);
		}else {
			returnValue = "Y";
			resp.getWriter().write(returnValue);
		}
		
		if(returnValue.equals("Y")) {
			JoinVO join = new JoinVO();
			join.setStudy(study);
			join.setApplicant(user);
			StudyManagementVO autoJoin = new StudyManagementVO();
			autoJoin.setUser(user);
			autoJoin.setStudy(study);
			autoJoin.setGrade("NORMAL");
			if(admit.equals("check")) {
				join.setAdmit("WAITING");
				service.addJoin(join);
			} else if (admit.equals("auto")) {
				service.addStudyManagement(autoJoin);
			}
		}
	}
	
	@RequestMapping("/add.do")
	public ModelAndView add(HttpSession session, Model model) {
		ModelAndView mav = new ModelAndView();
		
		String loginId = (String) session.getAttribute("LOGIN_ID");

		if(loginId == null) {
			session.setAttribute("needLogin", "NEED");
			mav.setViewName("redirect:/login/login.do");
			return mav;			
		}
		
		
		List<CategoryVO> categories = service.getCategories();
		mav.addObject("userinfo", myService.getUserInfoById(loginId));
		mav.addObject("categories", categories);
		mav.setViewName("list/add");

		return mav;
	}
	@RequestMapping("/mod.do")
	public ModelAndView mod(HttpSession session, Model model, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		String loginId = (String) session.getAttribute("LOGIN_ID");

		if(loginId == null) {
			session.setAttribute("needLogin", "NEED");
			mav.setViewName("redirect:/login/login.do");
			return mav;			
		}
		int study_no = Integer.parseInt(req.getParameter("no"));
		StudyVO study = service.getStudyInfoByNo(study_no);
		String sub_value = service.getSubValueyByCategory(study.getC_subject());
		List<CategoryVO> categories = service.getCategories();
		mav.addObject("userinfo", myService.getUserInfoById(loginId));
		mav.addObject("categories", categories);
		mav.addObject("studyInfo", study);
		mav.addObject("sub_value", sub_value);
		
		mav.setViewName("list/mod");

		return mav;
	}
	@RequestMapping(value=("/upload.do"), method = RequestMethod.POST)  
	@ResponseBody
	public String upload(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {

		String responseStr = "";
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		// 获取前台传值
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		// String ctxPath =
		// request.getSession().getServletContext().getRealPath("/")+ "\\" +
		// "images\\";
		String configPath = File.separator + "upload" + File.separator;
		String ctxPath = req.getSession().getServletContext().getRealPath("/");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year = sdf.format(new Date());
		configPath += year + File.separator;
		sdf = new SimpleDateFormat("MM");
		String month = sdf.format(new Date());
		configPath += month + File.separator;

		ctxPath += configPath;
		// 创建文件夹
		File file = new File(ctxPath);
		if (!file.exists()) {
			file.mkdirs();
		}
		String fileName = null;
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			// 上传文件名
			// System.out.println("key: " + entity.getKey());
			MultipartFile mf = entity.getValue();
			fileName = mf.getOriginalFilename();

			String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
			responseStr = configPath + newFileName + "|" + fileName;
			File uploadFile = new File(ctxPath + newFileName);
			try {
				FileCopyUtils.copy(mf.getBytes(), uploadFile);
			} catch (IOException e) {
				responseStr = "上传失败";
				e.printStackTrace();
			}

		}
		resp.setHeader("Content-type", "text/html;charset=UTF-8");  
		//这句话的意思，是告诉servlet用UTF-8转码，而不是用默认的ISO8859  
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(responseStr); 
		System.out.println(ctxPath);
		return null;
	}


	@RequestMapping("/uploadify.do")
	public String uploadify() {
		return "list/uploadify";
	}
	@RequestMapping("/map.do")
	public void map(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/plain;charset=utf-8;");

		String addr = req.getParameter("addr");
		URL urlMy=new URL("http://maps.google.kr/maps/api/geocode/json?address="+ addr);
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

	@RequestMapping("/sms.do")
	public void SendSMS(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		SMS sms = new SMS();

		sms.appversion("TEST/1.0");
		sms.charset("utf8");
		//sms.setuser("wysee", "zxcv1234");				// coolsms 계정 입력해주시면되요

		String phone = req.getParameter("phone");
		String user_id = req.getParameter("user_id");


		System.out.println("phone : " +phone);
		System.out.println("user_id : " + user_id);
		String number[] = new String[1];                                  // 받을 사람 폰번호
		number[0] = phone;

		Random r = new Random();
		int ran = 100000+r.nextInt(900000);
		System.out.println("중복 전 : " + ran);
		CheckVO checkUser = service.userCheck(user_id);

		if(checkUser == null) {
			CheckVO check = new CheckVO();
			check.setUser_id(user_id);
			check.setCheck_code(Integer.toString(ran));
			System.out.println("스트링으로 변환 : "+Integer.toString(ran));

			service.addCheck(check);
		} else if(checkUser != null) {
			ran = 100000+r.nextInt(900000);
			CheckVO reCheck = new CheckVO();
			reCheck.setUser_id(user_id);
			reCheck.setCheck_code(Integer.toString(ran));
			reCheck.setCheck_y_or_n("N");
			System.out.println("중복 후 : " + ran);

			service.modifyCheck(reCheck);
		}

		for( int i = 0 ; i < number.length ; i ++ ) {
			SmsMessagePdu pdu = new SmsMessagePdu();
			pdu.type = "SMS";
			pdu.destinationAddress = number[i];
			pdu.scAddress = phone;                   // 발신자 번호          
			pdu.text = "[SROUP] 본인 확인 서비스입니다. 인증 번호는 " + ran + " 입니다.";					    // 보낼 메세지 내용
			sms.add(pdu);
			System.out.println("그냥 : " + ran);
			//try {
			//sms.connect();
			//sms.send();
			//sms.disconnect();

			//} catch (IOException e) {
			//     System.out.println(e.toString());
			//}
			//sms.printr();
			//sms.emptyall();
		}

	}

	@RequestMapping("/check.do")
	public void checkCode(HttpServletRequest req, HttpServletResponse resp) throws Exception{

		String phone = req.getParameter("phone");
		String user_id = req.getParameter("user_id");

		CheckVO user = service.userCheck(user_id);
		String check_code = req.getParameter("code");
		String returnValue = "";

		if(user.getCheck_code().equals(check_code)) {
			CheckVO checkCode = new CheckVO();
			checkCode.setUser_id(user_id);
			checkCode.setCheck_code(user.getCheck_code());
			checkCode.setCheck_y_or_n("Y");

			service.modifyCheck(checkCode);

			returnValue = "Y";
			resp.getWriter().write(returnValue);

			return;

		} else if(user.getCheck_code() != check_code) {
			returnValue = "N";
			resp.getWriter().write(returnValue);

			return;
		}
	}

	@RequestMapping("/pAddrCheck.do")
	public void pAddrCheck(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String pAddr = req.getParameter("pAddr");
		service.pAddrCheck(pAddr);
		String returnValue = "";

		if(service.pAddrCheck(pAddr) == null) {
			returnValue = "Y";
			resp.getWriter().write(returnValue);

			return;
		} else {
			returnValue = "N";
			resp.getWriter().write(returnValue);

			return;
		}
	}

}
