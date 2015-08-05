package com.cj.sroup.service;

import com.cj.sroup.vo.UserInfoVO;

public interface MyPageService {

	public UserInfoVO getUserInfoById(String id);
	
	public void updateUserInfo(UserInfoVO user);
	public boolean updatePassword(String id, String oldpwd, String newpwd);
	
}
