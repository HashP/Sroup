package com.cj.sroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cj.sroup.dao.M_calendarDao;
import com.cj.sroup.vo.M_calEventVO;

@Service
@Transactional
public class M_calendarServiceImpl implements M_calendarService{

	@Autowired
	M_calendarDao m_calendardao;
	
	public List<M_calEventVO> getAllEvent() {		
		return m_calendardao.getAllEvent();
	}
	
}
