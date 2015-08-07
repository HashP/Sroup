package com.cj.sroup.vo;

import java.util.Date;

public class M_calendarVO {
	private int study_no;
	private int cal_no;	
	private Date event_start;
	private	Date event_end;
	private	String event_title;
	private	String event_content;
	private String event_writer;
	private String event_color;
	
	public int getStudy_no() {
		return study_no;
	}
	public void setStudy_no(int study_no) {
		this.study_no = study_no;
	}
	public int getCal_no() {
		return cal_no;
	}
	public void setCal_no(int cal_no) {
		this.cal_no = cal_no;
	}
	public Date getEvent_start() {
		return event_start;
	}
	public void setEvent_start(Date event_start) {
		this.event_start = event_start;
	}
	public Date getEvent_end() {
		return event_end;
	}
	public void setEvent_end(Date event_end) {
		this.event_end = event_end;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public String getEvent_writer() {
		return event_writer;
	}
	public void setEvent_writer(String event_writer) {
		this.event_writer = event_writer;
	}
	public String getEvent_color() {
		return event_color;
	}
	public void setEvent_color(String event_color) {
		this.event_color = event_color;
	}
	
		
	
	
}
