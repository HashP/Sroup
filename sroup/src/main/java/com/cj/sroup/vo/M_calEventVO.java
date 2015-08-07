package com.cj.sroup.vo;

import java.util.Date;

public class M_calEventVO {
	private int event_id;
	private Date event_start;
	private	Date event_end;
	private	String event_title;
	private	String event_content;
	private String event_writer;
	private String event_color;
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
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
