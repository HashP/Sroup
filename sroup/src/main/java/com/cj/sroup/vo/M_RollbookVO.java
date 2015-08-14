package com.cj.sroup.vo;

import java.util.Date;

public class M_RollbookVO {
	
	private int no;
	private int studyNo;
	private Date attendDay;
	private String name;
	private Date writeDay;
	private String writer;
	private String note;
	private String attend;
	
	public M_RollbookVO() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public Date getAttendDay() {
		return attendDay;
	}

	public void setAttendDay(Date attendDay) {
		this.attendDay = attendDay;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getWriteDay() {
		return writeDay;
	}

	public void setWriteDay(Date writeDay) {
		this.writeDay = writeDay;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getAttend() {
		return attend;
	}

	public void setAttend(String attend) {
		this.attend = attend;
	}

	@Override
	public String toString() {
		return "M_RollbookVO [no=" + no + ", studyNo=" + studyNo
				+ ", attendDay=" + attendDay + ", name=" + name + ", writeDay="
				+ writeDay + ", writer=" + writer + ", note=" + note
				+ ", attend=" + attend + "]";
	}
	
}
