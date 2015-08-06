package com.cj.sroup.vo;

import java.util.Date;

public class M_calEventVO {
	private int event_id;
	private Date cal_start;
	private	Date cal_end;
	private	String cal_title;
	private	String cal_content;
	private String cal_writer;
		
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}	
	public Date getCal_start() {
		return cal_start;
	}
	public void setCal_start(Date cal_start) {
		this.cal_start = cal_start;
	}
	public Date getCal_end() {
		return cal_end;
	}
	public void setCal_end(Date cal_end) {
		this.cal_end = cal_end;
	}
	public String getCal_title() {
		return cal_title;
	}
	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}
	public String getCal_content() {
		return cal_content;
	}
	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}
	public String getCal_writer() {
		return cal_writer;
	}
	public void setCal_writer(String cal_writer) {
		this.cal_writer = cal_writer;
	}
	
	
	
}
