package com.cj.sroup.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
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
	public String login(HttpSession session, Model model) {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		logger.info("loginId : [" + loginId + "]");
		if(loginId != null) {
			return "redirect:/list.do";
		}
		
		String loginResult = (String) session.getAttribute("loginResult");
		session.removeAttribute("loginResult");
		
		String signResult = (String) session.getAttribute("signResult");
		session.removeAttribute("signResult");
		
		String needLogin = (String) session.getAttribute("needLogin");
		session.removeAttribute("needLogin");
		
		model.addAttribute("loginResult", loginResult);
		model.addAttribute("signResult", signResult);
		model.addAttribute("needLogin", needLogin);
		
		model.addAttribute("pagetitle", "로그인");
		return "login/login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserInfoVO user
					,HttpSession session) {
		//로그인처리
		
		if(service.loginCheck(user)) {
			session.setAttribute("LOGIN_ID", user.getId());
			session.setAttribute("LOGIN_NAME", service.getUserName(user.getId()));
			
			return "redirect:/main.do";
		} else {
			session.setAttribute("loginResult", "FAILED");
			return "redirect:login.do";
		}
	}
	
	
	@RequestMapping("/signup.do")
	public String signup(Model model) {
		model.addAttribute("pagetitle", "회원가입");
		return "login/signup";
	}
	
	@RequestMapping(value=("/register.do"), method=RequestMethod.POST)
	public String register(UserInfoVO user
//						,@RequestParam(value="photofile", required=false) MultipartFile photofile
						,HttpSession session
						) throws IOException {
		
//		if(!photofile.isEmpty()) {		// 첨부파일이 없어도 null이 아님. 그래서 isEmpty로 파일 유무를 검사해준다. 
//			// 첨부파일 정보 조회하기
//			String filename = photofile.getOriginalFilename();
//			filename = System.currentTimeMillis() + filename;		//이름이 같은 파일끼리의 겹침을 방지하기 위해 이름에 시간정보를 같이 넣어줌
//			logger.info("filename : " + filename);
//			String rootpath = session.getServletContext().getRealPath("/");
//			//업로드 된 파일을 지정된 폴더에 저장하기
//			byte[] filedata = photofile.getBytes();
//			String uploadpath = rootpath + filepath;
//			logger.info(uploadpath);
//			File file = new File(uploadpath + filename);
//			FileCopyUtils.copy(filedata, file);
//
//			user.setProfilephoto(filename);
//		} else {
//			user.setProfilephoto("default_profile.jpg");
//		}
		
		
		
		System.out.println("register : " + user);
		service.register(user);
		
		session.setAttribute("signResult", "SUCCESS");
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
		session.removeAttribute("LOGIN_NAME");
		
		return "redirect:login.do";
	}
	
	@RequestMapping(value="/img_save_to_file.do", method=RequestMethod.POST)
	public View imgFileSave(Model model, HttpSession session, @RequestParam("img")MultipartFile img) throws IOException {
		
		ArrayList<String> allowdExts = new ArrayList<String>(); 
		allowdExts.add("gif");
		allowdExts.add("jpeg");
		allowdExts.add("jpg");
		allowdExts.add("png");
		allowdExts.add("GIF");
		allowdExts.add("JPEG");
		allowdExts.add("JPG");
		allowdExts.add("PNG");
		
		if(img.isEmpty()) {
			model.addAttribute("status", "error");
			model.addAttribute("message", "image is empty");
			
			return jsonView;	
		}
		
		
		// 첨부파일 정보 조회하기
		String filename = img.getOriginalFilename();
		System.out.println("filename: [" + filename + "]");
		String[] temp = filename.split("\\.");
		
		
		String extension = temp[temp.length-1];
		if(allowdExts.indexOf(extension) == -1) {
			model.addAttribute("status", "error");
			model.addAttribute("message", "invalid_extension");
			
			return jsonView;	
		}
		
//		filename = System.currentTimeMillis() + filename;		//이름이 같은 파일끼리의 겹침을 방지하기 위해 이름에 시간정보를 같이 넣어줌
		filename = System.currentTimeMillis() + "." + extension;		
		logger.info("filename : " + filename);
		String rootpath = session.getServletContext().getRealPath("/");
		//업로드 된 파일을 지정된 폴더에 저장하기
		byte[] filedata = img.getBytes();
		String uploadpath = rootpath + filepath;
		logger.info(uploadpath);
		File file = new File(uploadpath + filename);
		FileCopyUtils.copy(filedata, file);

		//user.setProfilephoto(filename);
		
		
		String imageurl = "\\sroup\\"+ filepath + filename;
		ImageIcon image = new ImageIcon(filedata);
		
		int width = 0;
		int height = 0;
					
		width = image.getIconWidth(); //width
		height = image.getIconHeight(); // height
		
		model.addAttribute("status", "success");
		model.addAttribute("url", imageurl);
		model.addAttribute("width", width);
		model.addAttribute("height", height);
		
						
		return jsonView;
	}
	
	@RequestMapping(value="/img_crop_to_file.do", method=RequestMethod.POST)
	public View imgFileCrop(Model model, HttpSession session
							, @RequestParam("imgUrl")String imgUrl
							, @RequestParam("imgInitW")int imgInitW
							, @RequestParam("imgInitH")int imgInitH
							, @RequestParam("imgW")double imgW 
							, @RequestParam("imgH")double imgH
							, @RequestParam("imgY1")int imgY1
							, @RequestParam("imgX1")int imgX1
							, @RequestParam("cropW")int cropW
							, @RequestParam("cropH")int cropH
							, @RequestParam("rotation")double angle
							) throws IOException {
		
		System.out.println("========================img_crop_to_file.do=============================");
		
		String[] temp = imgUrl.split("\\.");
		String type = temp[temp.length-1];
		String output_filename = "croppedImg_" + System.currentTimeMillis() + "." + type;
		
//		System.out.println("imgUrl : " + imgUrl);
//		System.out.println("output_filename: " + output_filename);
//		System.out.println("imgInitW: " + imgInitW);
//		System.out.println("imgInitH: " + imgInitH);
//		System.out.println("imgW: " + imgW);
//		System.out.println("imgH: " + imgH);
//		System.out.println("imgY1: " + imgY1);
//		System.out.println("imgX1: " + imgX1);
//		System.out.println("cropW: " + cropW);
//		System.out.println("cropH: " + cropH);
//		System.out.println("angle: " + angle);
		
		String rootpath = session.getServletContext().getRealPath("/");
		String tmppath = rootpath.replace("\\sroup\\", "");
		
		//System.out.println("rootpath : " + tmppath + imgUrl);
		
		BufferedImage image = ImageIO.read(new File(tmppath + imgUrl));
		BufferedImage scaledImage = Scalr.resize(image, (int)Math.round(imgW), (int)Math.round(imgH), Scalr.OP_ANTIALIAS);
		BufferedImage cropped = scaledImage.getSubimage(imgX1, imgY1, cropW, cropH);
		
		//업로드 된 파일을 지정된 폴더에 저장하기
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(cropped, type, baos);
		byte[] filedata = baos.toByteArray();
		
		String uploadpath = rootpath + filepath;
		logger.info(uploadpath);
		File file = new File(uploadpath + output_filename);
		FileCopyUtils.copy(filedata, file);

		//user.setProfilephoto(filename);
		
		
		String croppedImageUrl = "\\sroup\\"+ filepath + output_filename;
		System.out.println(croppedImageUrl);
		model.addAttribute("status", "success");
		model.addAttribute("url", croppedImageUrl);
		
		return jsonView;
	}
}
