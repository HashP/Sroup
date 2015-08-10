package com.cj.sroup.vo;

import java.util.Date;

public class MessageVO {

	private int no;
	private UserInfoVO sender;
	private String receiver;
	
	private StudyVO study;
	private String type;
	private String checkRead;
	private Date writeDate;
	
	public MessageVO() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public UserInfoVO getSender() {
		return sender;
	}

	public void setSender(UserInfoVO sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public StudyVO getStudy() {
		return study;
	}

	public void setStudy(StudyVO study) {
		this.study = study;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCheckRead() {
		return checkRead;
	}

	public void setCheckRead(String checkRead) {
		this.checkRead = checkRead;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "MessageVO [no=" + no + ", sender=" + sender + ", receiver="
				+ receiver + ", study=" + study + ", type=" + type
				+ ", checkRead=" + checkRead + ", writeDate=" + writeDate + "]";
	}

}
