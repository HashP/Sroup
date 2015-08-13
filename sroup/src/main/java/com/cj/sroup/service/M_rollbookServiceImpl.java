package com.cj.sroup.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cj.sroup.dao.M_rollbookDao;

@Service
@Transactional
public class M_rollbookServiceImpl implements M_rollbookService {

	@Autowired
	M_rollbookDao rollbookDao;
	
	@Override
	public List<String> getSchedulesByStudyno(int studyNo) {
		// TODO Auto-generated method stub
		return rollbookDao.getSchedulesByStudyno(studyNo);
	}

}
