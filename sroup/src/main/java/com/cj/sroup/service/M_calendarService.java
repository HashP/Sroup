package com.cj.sroup.service;

import java.util.List;

import com.cj.sroup.vo.M_calEventVO;
import com.cj.sroup.vo.M_calendarVO;

public interface M_calendarService {
	List<M_calEventVO> getAllEvent();
	void chagneCalEvent(M_calEventVO m_calendar);
	void addCalEvent(M_calendarVO m_calendar);
	void delCalEvent(int event_id);
}
