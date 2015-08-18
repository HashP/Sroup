package com.cj.sroup.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class M_commentVO {
	private int study_no;
	private String list_name;
	private int c_no;
	private Date c_write_day;
	private String c_writer;
	private String c_content;
	
	
	public int getStudy_no() {
		return study_no;
	}
	public void setStudy_no(int study_no) {
		this.study_no = study_no;
	}
	public String getList_name() {
		return list_name;
	}
	public void setList_name(String list_name) {
		this.list_name = list_name;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_write_day() {
		SimpleDateFormat sf = new SimpleDateFormat("yy.MM.dd");
		return sf.format(c_write_day);
	}
	public void setC_write_day(Date c_write_day) {
		this.c_write_day = c_write_day;
	}
	public String getC_writer() {
		return c_writer;
	}
	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	

	
}
