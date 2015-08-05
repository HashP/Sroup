package com.cj.sroup.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cj.sroup.service.MyPageService;
import com.cj.sroup.vo.UserInfoVO;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Value("${profile.image.path}")
	private String filepath;
	
	@Autowired
	private MyPageService service;
	
	//회원가입수정
	@RequestMapping("/profileupdate.do")
	public String profileupdate(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		if(loginId == null) {
			return "redirect:/login/login.do";
		}
		
		model.addAttribute("current_page", "profileupdate");
		model.addAttribute("userinfo", service.getUserInfoById(loginId));
		
		filepath = filepath.replace("C:\\Users\\jhta\\git\\sroup\\sroup\\src\\main\\webapp\\", "\\sroup\\");
		
		model.addAttribute("imgpath", filepath);
		return "mypage/profileupdate";
	}
	
	//회원정보 수정
	@RequestMapping(value="/profileupdate.do", method=RequestMethod.POST)
	public String profileupdate(UserInfoVO user
							,@RequestParam(value="photofile", required=false) MultipartFile photofile
							, HttpSession session) throws IOException {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		if(loginId == null) {
			return "redirect:/login/login.do";
		}
		
		user.setId(loginId);
		if(!photofile.isEmpty()) {		// 첨부파일이 없어도 null이 아님. 그래서 isEmpty로 파일 유무를 검사해준다. 
			// 첨부파일 정보 조회하기
			String filename = photofile.getOriginalFilename();
			filename = System.currentTimeMillis() + filename;		//이름이 같은 파일끼리의 겹침을 방지하기 위해 이름에 시간정보를 같이 넣어줌
			//String filepath = session.getServletContext().getContextPath();
			//업로드 된 파일을 지정된 폴더에 저장하기
			byte[] filedata = photofile.getBytes();
			File file = new File(filepath + filename);
			FileCopyUtils.copy(filedata, file);

			user.setProfilephoto(filename);
		}
		
		service.updateUserInfo(user);		
		
		return "redirect:profileupdate.do";
	}
	
	@RequestMapping("/pwdupdate.do")
	public String pwdupdate(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");

		if(loginId == null) {
			return "redirect:/login/login.do";
		}
		model.addAttribute("current_page", "pwdupdate");
		
		return "mypage/pwdupdate";
	}
	
	@RequestMapping(value="/pwdupdate.do", method=RequestMethod.POST)
	public String pwdupdate() {
		
		
		
		
		return "redirect:pwdupdate.do";
	}
	
	@RequestMapping("/mystudy.do")
	public String mystudy(@RequestParam(value="cate", defaultValue="create", required=false)String cate
						, Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");

		if(loginId == null) {
			return "redirect:/login/login.do";
		}
		
		model.addAttribute("cate", cate);
		model.addAttribute("current_page", cate + "study");
		return "mypage/mystudy";
	}
	
	
	@RequestMapping("/calendar.do")
	public String calendar(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");

		if(loginId == null) {
			return "redirect:/login/login.do";
		}
		model.addAttribute("current_page", "studycalendar");
		return "mypage/calendar";
	}
	
	
	
	@RequestMapping("/finished-study.do")
	public String finished(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");

		if(loginId == null) {
			return "redirect:/login/login.do";
		}
		model.addAttribute("current_page", "finished-study");
		return "mypage/finished-study";
	}

}
