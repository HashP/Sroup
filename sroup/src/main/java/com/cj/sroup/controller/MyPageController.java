package com.cj.sroup.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cj.sroup.service.MyPageService;
import com.cj.sroup.vo.JoinVO;
import com.cj.sroup.vo.MessageVO;
import com.cj.sroup.vo.StudyManagementVO;
import com.cj.sroup.vo.StudyVO;
import com.cj.sroup.vo.UserInfoVO;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Value("${profile.image.path}")
	private String filepath;
	
	@Autowired
	private MyPageService service;
	
	/**
	 * 회원정보 수정 폼으로 이동
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/profileupdate.do")
	public String profileupdate(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		model.addAttribute("current_page", "profileupdate");
		model.addAttribute("userinfo", service.getUserInfoById(loginId));
		
		String imagepath = "\\sroup\\"+filepath;
		
		model.addAttribute("imgpath", imagepath);
		return "mypage/profileupdate";
	}
	
	/**
	 * 폼에 입력된 데이터를 받아 회원정보를 수정
	 * @param user
	 * @param photofile
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/profileupdate.do", method=RequestMethod.POST)
	public String profileupdate(UserInfoVO user
							,@RequestParam(value="photofile", required=false) MultipartFile photofile
							, HttpSession session) throws IOException {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		user.setId(loginId);
		if(!photofile.isEmpty()) {		// 첨부파일이 없어도 null이 아님. 그래서 isEmpty로 파일 유무를 검사해준다. 
			// 첨부파일 정보 조회하기
			String filename = photofile.getOriginalFilename();
			filename = System.currentTimeMillis() + filename;		//이름이 같은 파일끼리의 겹침을 방지하기 위해 이름에 시간정보를 같이 넣어줌
			String rootpath = session.getServletContext().getRealPath("/");
			//업로드 된 파일을 지정된 폴더에 저장하기
			byte[] filedata = photofile.getBytes();
			String uploadpath = rootpath + filepath;
			System.out.println(uploadpath);
			File file = new File(uploadpath + filename);
			FileCopyUtils.copy(filedata, file);

			user.setProfilephoto(filename);
		}
		
		service.updateUserInfo(user);		
		
		return "redirect:profileupdate.do";
	}
	
	/**
	 * 패스워드 수정 폼으로 이동
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/pwdupdate.do")
	public String pwdupdate(Model model, HttpSession session) {

		Boolean updateResult = (Boolean) session.getAttribute("updateResult");
		session.removeAttribute("updateResult");
		
		model.addAttribute("current_page", "pwdupdate");
		model.addAttribute("updateResult", updateResult);	
		
		return "mypage/pwdupdate";
	}
	
	/**
	 * 새로운 패스워드 정보를 받아 확인 후 수정 
	 * @param oldpwd
	 * @param newpwd
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/pwdupdate.do", method=RequestMethod.POST)
	public String pwdupdate(@RequestParam("oldpwd")String oldpwd
							, @RequestParam("newpwd")String newpwd
							, HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		boolean updateResult = service.updatePassword(loginId, oldpwd, newpwd);
		session.setAttribute("updateResult", updateResult);
		
		return "redirect:pwdupdate.do";
	}
	
	/**
	 * 나의 스터디 목록을 받아 목록페이지로 이동
	 * @param cate
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/mystudy.do")
	public String mystudy(@RequestParam(value="cate", defaultValue="create", required=false)String cate
						, Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		List<StudyManagementVO> createStudy = service.getCreateStudiesById(loginId);
		List<StudyManagementVO> attendStudy = service.getAttendStudiesById(loginId);
		
		model.addAttribute("createStudy", createStudy);
		model.addAttribute("attendStudy", attendStudy);
		
//		System.out.println("create: " + createStudy);
//		System.out.println("attend: " + attendStudy);
		
		model.addAttribute("cate", cate);
		model.addAttribute("current_page", cate + "study");
		return "mypage/mystudy";
	}
	
	/**
	 * 스터디 일정 정보를 받아 캘린더 페이지로 이동
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/calendar.do")
	public String calendar(Model model, HttpSession session) {
		model.addAttribute("current_page", "studycalendar");
		return "mypage/calendar";
	}
	
	/**
	 * 이미 종료된 스터디 정보를 받아 목록페이지로 이동
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/finished-study.do")
	public String finished(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		List<StudyManagementVO> createStudy = service.getFinishedCreateStudiesById(loginId);
		List<StudyManagementVO> attendStudy = service.getFinishedAttendStudiesById(loginId);
		
		model.addAttribute("createStudy", createStudy);
		model.addAttribute("attendStudy", attendStudy);
		
		model.addAttribute("current_page", "finished-study");
		return "mypage/finished-study";
	}

	/**
	 * 쪽지함 페이지로 이동
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/messagebox.do")
	public String messagebox(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		List<MessageVO> messageList = service.getMessageByUserId(loginId);
		model.addAttribute("messageList", messageList);
		
		System.out.println(messageList);
		
		model.addAttribute("current_page", "messagebox");
		return "mypage/messagebox";
	}
	
	/**
	 * ajax 요청으로 message no를 전달시 메시지를 삭제해줌 
	 * @param no  message no
	 * @return
	 */
	@RequestMapping("/ajax/remove-message.do")
	@ResponseBody
	public String removeMessage(@RequestParam("msgNo")int no) {
		//System.out.println(no);
		service.removeMessage(no);		
		
		return "success";
	}
	
	@RequestMapping("/join-manage.do")
	public String joinManage(@RequestParam(value="studyno", required=false)int studyNo, HttpSession session, Model model) {
		
		List<JoinVO> applicationList = service.getApplicantsByStudyNo(studyNo);
		model.addAttribute("applicantList", applicationList);
		//System.out.println(applicationList);
		
		return "mypage/join-manage";
	}
	
	@RequestMapping("/ajax/accept-member.do")
	@ResponseBody
	public String acceptMember(HttpSession session, 
							@RequestParam("userid")String userId,
							@RequestParam("studyno")int studyNo) {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		System.out.println("accept : " + userId);
		UserInfoVO user = new UserInfoVO();
		user.setId(userId);
		
		StudyVO study = new StudyVO();
		study.setStudy_no(studyNo);
		
		JoinVO join = new JoinVO();
		join.setApplicant(user);
		join.setStudy(study);
		
		service.acceptUser(join, loginId);
		
		return "success";
	}
	
	@RequestMapping("/ajax/reject-member.do")
	@ResponseBody
	public String rejectMember(HttpSession session, 
							@RequestParam("userid")String userId,
							@RequestParam("studyno")int studyNo) {
		String loginId = (String) session.getAttribute("LOGIN_ID");
		if(loginId == null) {
			return "redirect:/login/login.do";
		}
		
		System.out.println("reject : " + userId);
		UserInfoVO user = new UserInfoVO();
		user.setId(userId);
		
		StudyVO study = new StudyVO();
		study.setStudy_no(studyNo);
		
		JoinVO join = new JoinVO();
		join.setApplicant(user);
		join.setStudy(study);
		
		service.rejectUser(join, loginId);
		
		return "success";
	}
}