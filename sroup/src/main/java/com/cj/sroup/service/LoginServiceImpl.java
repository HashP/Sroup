package com.cj.sroup.service;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cj.sroup.dao.UserInfoDao;
import com.cj.sroup.vo.UserInfoVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private UserInfoDao userDao;
	
	@Override
	public boolean loginCheck(UserInfoVO user) {
		// TODO Auto-generated method stub
		
		UserInfoVO searchuser = userDao.getUserById(user.getId());
		String encryptPwd = DigestUtils.sha256Hex(user.getPwd());
		
		if(searchuser.getPwd().equals(encryptPwd)) {
			return true;
		} else {
			
			return false;
		}
	}

	@Override
	public void register(UserInfoVO user) {
		// TODO Auto-generated method stub
		
		String encryptPwd = DigestUtils.sha256Hex(user.getPwd());
		user.setPwd(encryptPwd);
		
		userDao.addNewUser(user);
		
		
	}

	@Override
	public boolean isDuplicatedId(String id) {
		// TODO Auto-generated method stub
		
		UserInfoVO searchuser = userDao.getUserById(id);
		
		if(searchuser == null) {
			// 아이디 괜찮음
			return true;
		} else {
			// 중복된 아이디
			return false;
		}
	}

	@Override
	public String getUserName(String id) {
		// TODO Auto-generated method stub
		UserInfoVO user = userDao.getUserById(id);
		return user.getName();
	}

	

}
