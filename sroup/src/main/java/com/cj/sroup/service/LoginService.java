package com.cj.sroup.service;

import com.cj.sroup.vo.UserInfoVO;

public interface LoginService {
	
	public boolean loginCheck(UserInfoVO user);
	public void register(UserInfoVO user);
	
	public boolean isDuplicatedId(String id);
}
