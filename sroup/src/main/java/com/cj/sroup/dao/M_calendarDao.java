package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.M_calEventVO;


public interface M_calendarDao {
	void addCalEvent(M_calEventVO m_calEvent);
	List<M_calEventVO> getAllEvent();
	
}
