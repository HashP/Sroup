package com.cj.sroup.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.cj.sroup.service.LoginService;
import com.cj.sroup.vo.UserInfoVO;

@Controller
@RequestMapping("/login")
public class LoginController {
 
	@Autowired
	private LoginService service;
	private Logger logger= Logger.getLogger(LoginController.class);
	
	@Autowired
	private MappingJackson2JsonView jsonView;
	
	@Value("${profile.image.path}")
	private String filepath;
	
	
	@RequestMapping("/login.do")
	public String login(HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		logger.info("loginId : [" + loginId + "]");
		if(loginId != null) {
			return "redirect:/mypage/profileupdate.do";
		}
		
		return "login/login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserInfoVO user
					,HttpSession session) {
		//로그인처리
		
		if(service.loginCheck(user)) {
			session.setAttribute("LOGIN_ID", user.getId());
			return "redirect:/mypage/profileupdate.do";
		} else {
			
			return "redirect:login.do";
		}
	}
	
	
	@RequestMapping("/signup.do")
	public String signup() {
		return "login/signup";
	}
	
	@RequestMapping(value=("/register.do"), method=RequestMethod.POST)
	public String register(UserInfoVO user
						,@RequestParam(value="photofile", required=false) MultipartFile photofile
						,HttpSession session
						) throws IOException {
		
		if(!photofile.isEmpty()) {		// 첨부파일이 없어도 null이 아님. 그래서 isEmpty로 파일 유무를 검사해준다. 
			// 첨부파일 정보 조회하기
			String filename = photofile.getOriginalFilename();
			filename = System.currentTimeMillis() + filename;		//이름이 같은 파일끼리의 겹침을 방지하기 위해 이름에 시간정보를 같이 넣어줌
			logger.info("filename : " + filename);
			String rootpath = session.getServletContext().getRealPath("/");
			//업로드 된 파일을 지정된 폴더에 저장하기
			byte[] filedata = photofile.getBytes();
			String uploadpath = rootpath + filepath;
			logger.info(uploadpath);
			File file = new File(uploadpath + filename);
			FileCopyUtils.copy(filedata, file);

			user.setProfilephoto(filename);
		} else {
			user.setProfilephoto("default_profile.jpg");
		}
		System.out.println("register : " + user);
		service.register(user);
		
		return "redirect:login.do";
	}
	
	
	@RequestMapping("/idduplication.do")
	public View duplicationcheck(@RequestParam("id")String id
								, Model model) {
		boolean isOk = service.isDuplicatedId(id);
		model.addAttribute("isIdOk", isOk);
		
		return jsonView;
	}
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("LOGIN_ID");
		
		return "redirect:login.do";
	}
}
