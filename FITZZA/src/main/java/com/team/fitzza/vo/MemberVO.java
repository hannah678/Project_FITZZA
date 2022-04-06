package com.team.fitzza.vo;

public class MemberVO {
	
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_nickname;
	private String email;
	private String email1;
	private String email2;
	private String tel;
	private String register_date;
	private int point;
	private String profile_image;
	private String permission;
	private int report_hit;
	private String leave_forced;
	
	
	
	public String getLeave_forced() {
		return leave_forced;
	}
	public void setLeave_forced(String leave_forced) {
		this.leave_forced = leave_forced;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getEmail() {
		email = email1 +"@"+ email2;
		return email;
	}
	public void setEmail(String email) {
		String emailSp[] = email.split("@");
		email1 = emailSp[0];
		email2 = emailSp[1];
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public int getReport_hit() {
		return report_hit;
	}
	public void setReport_hit(int report_hit) {
		this.report_hit = report_hit;
	}
	
	
	
}
