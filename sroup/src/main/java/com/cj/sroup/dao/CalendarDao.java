package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.CalendarVO;

public interface CalendarDao {
	
	public List<CalendarVO> getCalendarEvents(String userid);
	
	public List<Integer> getStudyNoList(String userid);
}
