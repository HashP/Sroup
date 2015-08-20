package com.cj.sroup.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class M_boardReplyVO {
	private int b_no;
	private int re_no;
	private String re_writer;
	private Date re_writer_day;
	private String re_content;
	private int re_writer_no;
	private String writer_profilephoto;
	private String photoname;

	public String getPhotoname() {
	return photoname;
}
public void setPhotoname(String photoname) {
	this.photoname = photoname;
}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getRe_writer() {
		return re_writer;
	}
	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}
	public String getRe_writer_day() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
		return sf.format(re_writer_day);
	}
	public void setRe_writer_day(Date re_writer_day) {
		this.re_writer_day = re_writer_day;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public int getRe_writer_no() {
		return re_writer_no;
	}
	public void setRe_writer_no(int re_writer_no) {
		this.re_writer_no = re_writer_no;
	}
	public String getWriter_profilephoto() {
		return writer_profilephoto;
	}
	public void setWriter_profilephoto(String writer_profilephoto) {
		this.writer_profilephoto = writer_profilephoto;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	
	
}
