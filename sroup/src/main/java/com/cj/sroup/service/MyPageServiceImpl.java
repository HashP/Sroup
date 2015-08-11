package com.cj.sroup.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cj.sroup.dao.MessageDao;
import com.cj.sroup.dao.StudyManagementDao;
import com.cj.sroup.dao.UserInfoDao;
import com.cj.sroup.vo.MessageVO;
import com.cj.sroup.vo.StudyManagementVO;
import com.cj.sroup.vo.UserInfoVO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private UserInfoDao userDao;
	@Autowired
	private StudyManagementDao studyManagementDao;
	@Autowired
	private MessageDao messageDao;
	
	@Override
	public UserInfoVO getUserInfoById(String id) {
		// TODO Auto-generated method stub
		return userDao.getUserById(id);
	}

	@Override
	public void updateUserInfo(UserInfoVO user) {
		// TODO Auto-generated method stub
		
		userDao.updateUserInfo(user);
	}

	@Override
	public boolean updatePassword(String id, String oldpwd, String newpwd) {
		
		UserInfoVO searchuser = userDao.getUserById(id);
		String encryptOldPwd = DigestUtils.sha256Hex(oldpwd);
		
		// 기존의 패스워드가 맞는지 아닌지 검사
		if(!encryptOldPwd.equals(searchuser.getPwd())) {
			return false;
		}
		
		// 새로운 패스워드를 암호화
		String encryptNewPwd = DigestUtils.sha256Hex(newpwd);
	
		UserInfoVO user = new UserInfoVO();
		user.setId(id);
		user.setPwd(encryptNewPwd);
		
		return true;
	}

	@Override
	public List<StudyManagementVO> getCreateStudiesById(String id) {
		// TODO Auto-generated method stub
		return studyManagementDao.getCreateStudiesById(id);
	}

	@Override
	public List<StudyManagementVO> getAttendStudiesById(String id) {
		// TODO Auto-generated method stub
		return studyManagementDao.getAttendStudiesById(id);
	}

	@Override
	public List<StudyManagementVO> getFinishedCreateStudiesById(String id) {
		// TODO Auto-generated method stub
		return studyManagementDao.getFinishedCreateStudiesById(id);
	}

	@Override
	public List<StudyManagementVO> getFinishedAttendStudiesById(String id) {
		// TODO Auto-generated method stub
		return studyManagementDao.getFinishedAttendStudiesById(id);
	}

	@Override
	public List<MessageVO> getMessageByUserId(String id) {
		// TODO Auto-generated method stub
		return messageDao.getMessageByReceiver(id);
	}
	
	public void removeMessage(int no) {
		messageDao.removeMessage(no);
	}

}
