package com.cj.sroup.service;

import java.util.List;

import com.cj.sroup.vo.CalendarVO;
import com.cj.sroup.vo.JoinVO;
import com.cj.sroup.vo.MessageVO;
import com.cj.sroup.vo.StudyManagementVO;
import com.cj.sroup.vo.StudyVO;
import com.cj.sroup.vo.UserInfoVO;

public interface MyPageService {

	public UserInfoVO getUserInfoById(String id);
	
	public void updateUserInfo(UserInfoVO user);
	public boolean updatePassword(String id, String oldpwd, String newpwd);
	
	public List<StudyManagementVO> getCreateStudiesById (String id) ;
	public List<StudyManagementVO> getAttendStudiesById (String id) ;
	public List<StudyManagementVO> getFinishedCreateStudiesById (String id) ;
	public List<StudyManagementVO> getFinishedAttendStudiesById (String id) ;
	
	public List<MessageVO> getMessageByUserId(String id);
	public void removeMessage(int no);
	
	public List<JoinVO> getApplicantsByStudyNo(int studyNo);
	
	public void acceptUser(JoinVO join, String loginId);
	public void rejectUser(JoinVO join, String loginId);
	
	public List<CalendarVO> getCalendarEvents(String userid);
	public List<Integer> getStudyNoList(String userid);
	
	public StudyVO getStudyByStudyno(int studyNo);
}
