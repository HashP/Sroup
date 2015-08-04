package com.cj.sroup.vo;

public class UserInfoVO {

	private String id;
	private String pwd;
	private String name;
	private String nickname;
	private String phone;
	private String email;
	private String profilephoto;
	
	public UserInfoVO() {}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getProfilephoto() {
		return profilephoto;
	}
	
	public void setProfilephoto(String profilephoto) {
		this.profilephoto = profilephoto;
	}

	@Override
	public String toString() {
		return "UserInfoVO [id=" + id + ", pwd=" + pwd + ", name=" + name
				+ ", nickname=" + nickname + ", phone=" + phone + ", email="
				+ email + ", profilephoto=" + profilephoto + "]";
	}
	
}
