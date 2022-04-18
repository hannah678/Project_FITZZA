package com.team.fitzza.vo;

import java.util.List;

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
	private int exp;
	private String profile_image;
	private String permission;
	private int report_hit;
	private String leave_forced;
	private int grade;
	private int exp_min;
	private int exp_max;
	private String frame_img;
	private List<String> ChkList;
	
	
	
	public List<String> getChkList() {
		return ChkList;
	}
	public void setChkList(List<String> chkList) {
		ChkList = chkList;
	}
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	public int getExp_min() {
		return exp_min;
	}
	public void setExp_min(int exp_min) {
		this.exp_min = exp_min;
	}
	public int getExp_max() {
		return exp_max;
	}
	public void setExp_max(int exp_max) {
		this.exp_max = exp_max;
	}
	public String getFrame_img() {
		return frame_img;
	}
	public void setFrame_img(String frame_img) {
		this.frame_img = frame_img;
	}
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
