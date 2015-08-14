package com.cj.sroup.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cj.sroup.dao.M_rollbookDao;
import com.cj.sroup.vo.M_RollbookVO;
import com.cj.sroup.vo.UserInfoVO;

@Service
@Transactional
public class M_rollbookServiceImpl implements M_rollbookService {

	@Autowired
	private M_rollbookDao rollbookDao;
	
	@Override
	public List<String> getSchedulesByStudyno(int studyNo) {
		// TODO Auto-generated method stub
		return rollbookDao.getSchedulesByStudyno(studyNo);
	}

	public List<UserInfoVO> getMemberListByStudyno(int studyNo) {
		return rollbookDao.getMembersByStudyno(studyNo);
	}
	
	public HashMap<String, HashMap<String, Object>> getAttendCountByStudyno(int studyNo) {
		return rollbookDao.getAttendCountByStudyno(studyNo);
	}
	
	public HashMap<String, M_RollbookVO> getAttendByDay(int studyNo, String date) {
		HashMap<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("study_no", studyNo);
		searchOption.put("date", date);
		return rollbookDao.getAttendByDay(searchOption);		
	}
}
