package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.M_calEventVO;
import com.cj.sroup.vo.M_calendarVO;


public interface M_calendarDao {
	void addCalEvent(M_calendarVO m_calendar);
	List<M_calEventVO> getAllEvent();
	
}
