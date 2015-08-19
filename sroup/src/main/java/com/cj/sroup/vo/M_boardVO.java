package com.cj.sroup.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class M_boardVO {
	private int study_no;
	private String list_name;
	private int b_no; 
	private Date b_write_day; 
	private String b_writer;
	private String b_title; 
	private String b_content;
	private int b_hit;
	private String photoname;
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
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_write_day() {
		SimpleDateFormat sf = new SimpleDateFormat("yy.MM.dd");
		return sf.format(b_write_day); 
	}
	public void setB_write_day(Date b_write_day) {
		this.b_write_day = b_write_day;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	public String getPhotoname() {
		return photoname;
	}
	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}
	
	

}
