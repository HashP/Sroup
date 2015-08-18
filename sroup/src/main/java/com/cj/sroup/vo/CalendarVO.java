package com.cj.sroup.vo;

import java.util.Date;

public class CalendarVO {

	private int eventId;
	private StudyVO study;
	private Date eventStart;
	private Date eventEnd;
	private String eventTitle;
	
	public CalendarVO() {
		// TODO Auto-generated constructor stub
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public StudyVO getStudy() {
		return study;
	}

	public void setStudy(StudyVO study) {
		this.study = study;
	}

	public Date getEventStart() {
		return eventStart;
	}

	public void setEventStart(Date eventStart) {
		this.eventStart = eventStart;
	}

	public Date getEventEnd() {
		return eventEnd;
	}

	public void setEventEnd(Date eventEnd) {
		this.eventEnd = eventEnd;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	@Override
	public String toString() {
		return "CalendarVO [eventId=" + eventId + ", study=" + study
				+ ", eventStart=" + eventStart + ", eventEnd=" + eventEnd
				+ ", eventTitle=" + eventTitle + "]";
	}
	
}
