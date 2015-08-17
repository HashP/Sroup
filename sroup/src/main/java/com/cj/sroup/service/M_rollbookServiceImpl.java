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
	
	public int saveRollbookByRbno(M_RollbookVO rollbook) {
		//db에 정보를 update하고 
		rollbookDao.updateRollbook(rollbook);		
		//오늘까지의 총 출석일수를 가져와 반환 	
		return rollbookDao.getAttendCountByUserid(rollbook);
	}
	
	public HashMap<String, Integer> addRollbookByRbno(M_RollbookVO rollbook) {
		int rbNo = rollbookDao.getNewRbNo();
		rollbook.setNo(rbNo);
		
		rollbookDao.addNewRollbook(rollbook);
		int attendCount = rollbookDao.getAttendCountByUserid(rollbook);
		
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		resultMap.put("rbNo", rbNo);
		resultMap.put("attendCount", attendCount);
		
		return resultMap;
	}
}
