package com.cj.sroup.dao;

import com.cj.sroup.vo.UserInfoVO;

public interface UserInfoDao {
	
	public void addNewUser(UserInfoVO user);
	
	public UserInfoVO getUserById(String id);
	
	public void updateUserInfo(UserInfoVO user);
	public void updateUserPwd(UserInfoVO user);
}
