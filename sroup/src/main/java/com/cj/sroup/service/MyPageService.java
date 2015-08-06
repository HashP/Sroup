package com.cj.sroup.service;

import java.util.List;

import com.cj.sroup.vo.StudyManagementVO;
import com.cj.sroup.vo.UserInfoVO;

public interface MyPageService {

	public UserInfoVO getUserInfoById(String id);
	
	public void updateUserInfo(UserInfoVO user);
	public boolean updatePassword(String id, String oldpwd, String newpwd);
	
	public List<StudyManagementVO> getCreateStudiesById (String id) ;
	public List<StudyManagementVO> getAttendStudiesById (String id) ;
	public List<StudyManagementVO> getFinishedCreateStudiesById (String id) ;
	public List<StudyManagementVO> getFinishedAttendStudiesById (String id) ;
}
