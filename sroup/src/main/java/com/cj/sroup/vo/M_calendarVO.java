package com.cj.sroup.vo;

import java.util.Date;

public class M_calendarVO {
	private int study_no;
	private int cal_no;	
	private Date cal_start;
	private	Date cal_end;
	private	String cal_title;
	private	String cal_content;
	private String cal_writer;
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
	public Date getCal_start() {
		return cal_start;
	}
	public void setCal_strart(Date cal_start) {
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
