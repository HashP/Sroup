package com.cj.sroup.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cj.sroup.dao.JoinDao;
import com.cj.sroup.dao.MessageDao;
import com.cj.sroup.dao.StudyManagementDao;
import com.cj.sroup.dao.UserInfoDao;
import com.cj.sroup.vo.JoinVO;
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
	@Autowired
	private JoinDao joinDao;
	
	/****회원정보수정******************************************/
	/****회원정보수정******************************************/
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

	/****비밀번호변경******************************************/
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

	/****스터디 관리******************************************/
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

	/****메시지함******************************************/
	@Override
	public List<MessageVO> getMessageByUserId(String id) {
		// TODO Auto-generated method stub
		return messageDao.getMessageByReceiver(id);
	}
	
	public void removeMessage(int no) {
		messageDao.removeMessage(no);
	}

	/****스터디 신청 관리******************************************/
	@Override
	public List<JoinVO> getApplicantsByStudyNo(int studyNo) {
		// TODO Auto-generated method stub
		return joinDao.getApplicantsByStudyNo(studyNo);
	}

	public void acceptUser(JoinVO join, String loginId) {
		
		// 스터디에 가입시킴
		StudyManagementVO studyManagementVO = new StudyManagementVO();
		studyManagementVO.setStudy(join.getStudy());
		studyManagementVO.setUser(join.getApplicant());
		studyManagementVO.setGrade("NORMAL");
		studyManagementDao.addNewMember(studyManagementVO);
		
		//Join table에서 해당 행 삭제
		joinDao.deleteRequest(join);
		
		//승인 메시지 보내기
		UserInfoVO sender = new UserInfoVO();
		sender.setId(loginId);
		MessageVO message = new MessageVO();
		message.setType("ACCEPT");
		message.setReceiver(join.getApplicant().getId());
		message.setSender(sender);
		message.setStudy(join.getStudy());
		messageDao.sendMessage(message);
	}
	
	public void rejectUser(JoinVO join, String loginId) {
		//Join table에서 해당 행 삭제
		joinDao.deleteRequest(join);
			
		//거절 메시지 보내기
		UserInfoVO sender = new UserInfoVO();
		sender.setId(loginId);
		MessageVO message = new MessageVO();
		message.setType("REJECT");
		message.setReceiver(join.getApplicant().getId());
		message.setSender(sender);
		message.setStudy(join.getStudy());
		messageDao.sendMessage(message);
	}
}
