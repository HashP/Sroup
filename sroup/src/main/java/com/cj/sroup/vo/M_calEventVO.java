package com.cj.sroup.vo;

import java.util.Date;

public class M_calEventVO {
	private Date cal_strart;
	private	Date cal_end;
	private	String cal_title;
	private	String cal_content;
	private String cal_writer;
	
	public Date getCal_strart() {
		return cal_strart;
	}
	public void setCal_strart(Date cal_strart) {
		this.cal_strart = cal_strart;
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
