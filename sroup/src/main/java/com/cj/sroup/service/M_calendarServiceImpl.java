package com.cj.sroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cj.sroup.dao.M_calendarDao;
import com.cj.sroup.vo.M_calEventVO;
import com.cj.sroup.vo.M_calendarVO;

@Service
@Transactional
public class M_calendarServiceImpl implements M_calendarService{

	@Autowired
	M_calendarDao m_calendardao;
	
	public List<M_calEventVO> getAllEvent() {		
		return m_calendardao.getAllEvent();
	}

	@Override
	public void addCalEvent(M_calendarVO m_calendar) {
		m_calendardao.addCalEvent(m_calendar);
		
	}

	@Override
	public void delCalEvent(int event_id) {
		m_calendardao.delCalEvent(event_id);
	}

	@Override
	public void chagneCalEvent(M_calEventVO m_calendar) {
		m_calendardao.chagneCalEvent(m_calendar);
		
	}
	
}
