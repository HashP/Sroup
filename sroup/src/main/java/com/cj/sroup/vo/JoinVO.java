package com.cj.sroup.vo;

import java.util.Date;

public class JoinVO {

	private StudyVO study;
	private UserInfoVO applicant;
	private Date regDate;
	private String admit;
	
	public JoinVO() {
		// TODO Auto-generated constructor stub
	}

	public StudyVO getStudy() {
		return study;
	}

	public void setStudy(StudyVO study) {
		this.study = study;
	}

	public UserInfoVO getApplicant() {
		return applicant;
	}

	public void setApplicant(UserInfoVO applicant) {
		this.applicant = applicant;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getAdmit() {
		return admit;
	}

	public void setAdmit(String admit) {
		this.admit = admit;
	}

	@Override
	public String toString() {
		return "JoinVO [study=" + study + ", applicant=" + applicant
				+ ", regDate=" + regDate + ", admit=" + admit + "]";
	}
	
}
