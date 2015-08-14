package com.cj.sroup.service;

import java.util.HashMap;
import java.util.List;

import com.cj.sroup.vo.M_RollbookVO;
import com.cj.sroup.vo.UserInfoVO;

public interface M_rollbookService {

	public List<String> getSchedulesByStudyno(int studyNo);
	public List<UserInfoVO> getMemberListByStudyno(int studyNo);
	
	public HashMap<String, HashMap<String, Object>> getAttendCountByStudyno(int studyNo);
	public HashMap<String, M_RollbookVO> getAttendByDay(int studyNo, String date);
}
