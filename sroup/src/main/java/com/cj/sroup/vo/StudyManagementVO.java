package com.cj.sroup.vo;

public class StudyManagementVO {

	private StudyVO study;
	private UserInfoVO user;
	private String grade;
	
	public StudyManagementVO() {	}

	public StudyVO getStudy() {
		return study;
	}

	public void setStudy(StudyVO study) {
		this.study = study;
	}

	public UserInfoVO getUser() {
		return user;
	}

	public void setUser(UserInfoVO user) {
		this.user = user;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "StudyManagementVO [study=" + study + ", user=" + user
				+ ", grade=" + grade + "]";
	}
	
}
