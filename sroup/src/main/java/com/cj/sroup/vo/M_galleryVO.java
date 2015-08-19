package com.cj.sroup.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class M_galleryVO {
	private int study_no;
	private String list_name;
	private int g_no;
	private String g_writer;
	private Date g_write_day;
	private String g_title;
	private String g_content;
	private String imageName;
	private int g_like;
	private int g_hit;
	private String photoname;
	
	
	public String getPhotoname() {
		return photoname;
	}
	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}
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
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public String getG_writer() {
		return g_writer;
	}
	public void setG_writer(String g_writer) {
		this.g_writer = g_writer;
	}
	public String getG_write_day() {
		SimpleDateFormat sf = new SimpleDateFormat("yy.MM.dd");
		return sf.format(g_write_day);
	}
	public void setG_write_day(Date g_write_day) {
		this.g_write_day = g_write_day;
	}
	public String getG_title() {
		return g_title;
	}
	public void setG_title(String g_title) {
		this.g_title = g_title;
	}
	public String getG_content() {
		return g_content;
	}
	public void setG_content(String g_content) {
		this.g_content = g_content;
	}
	public int getG_like() {
		return g_like;
	}
	public void setG_like(int g_like) {
		this.g_like = g_like;
	}
	public int getG_hit() {
		return g_hit;
	}
	public void setG_hit(int g_hit) {
		this.g_hit = g_hit;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	
	
}
