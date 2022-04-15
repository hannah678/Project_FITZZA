package com.team.fitzza.vo;

public class BoardVO {
	
	private int board_num;
	private int type_num;	  //1,2,3,4,5,6
	private String type_name; //오늘의코디, 스타일추천, 중고거래, 구매후기, QnA, 오늘뭐입지?
	private String user_id;
	private String title;
	private String content;
	private int hit;
	private String write_date;
	private String ip;
	private String gender_type;	//W,M,U
	private String gender_name;	//여성의류, 남성의류, 남녀공용
	
	private String file1;
	private String file2;
	private String file3;
	private String file4;
	private String file5;
	private String delFile[];
	
	private int old_price;
	private String city;
	private String old_name;
	
	private String user_nickname;
	private String report_hit;
	private String profile_image;
	private int exp;
	private String frame_img;
	
	private int state_num;	   //1,2,3
	private String state_name; //판매중, 예약중, 거래완료
	private String trade_date;
	
	private int report_num;
	private String report_content;
	private int category_num;	  //1,2,3,4
	private String category_name; //광고, 사기거래, 욕설/비방, 사칭
	private String report_time;
	
	
	
	

	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	public String getFrame_img() {
		return frame_img;
	}
	public void setFrame_img(String frame_img) {
		this.frame_img = frame_img;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public String[] getDelFile() {
		return delFile;
	}
	public void setDelFile(String[] delFile) {
		this.delFile = delFile;
	}
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getReport_time() {
		return report_time;
	}
	public void setReport_time(String report_time) {
		this.report_time = report_time;
	}
	public int getState_num() {
		return state_num;
	}
	public void setState_num(int state_num) {
		this.state_num = state_num;
	}
	public String getState_name() {
		return state_name;
	}
	public void setState_name(String state_name) {
		this.state_name = state_name;
	}
	public String getTrade_date() {
		return trade_date;
	}
	public void setTrade_date(String trade_date) {
		this.trade_date = trade_date;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getGender_name() {
		return gender_name;
	}
	public void setGender_name(String gender_name) {
		this.gender_name = gender_name;
	}
	public String getReport_hit() {
		return report_hit;
	}
	public void setReport_hit(String report_hit) {
		this.report_hit = report_hit;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getOld_name() {
		return old_name;
	}
	public void setOld_name(String old_name) {
		this.old_name = old_name;
	}
	public int getOld_price() {
		return old_price;
	}
	public void setOld_price(int old_price) {
		this.old_price = old_price;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	public String getFile3() {
		return file3;
	}
	public void setFile3(String file3) {
		this.file3 = file3;
	}
	public String getFile4() {
		return file4;
	}
	public void setFile4(String file4) {
		this.file4 = file4;
	}
	public String getFile5() {
		return file5;
	}
	public void setFile5(String file5) {
		this.file5 = file5;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getType_num() {
		return type_num;
	}
	public void setType_num(int type_num) {
		this.type_num = type_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getGender_type() {
		return gender_type;
	}
	public void setGender_type(String gender_type) {
		this.gender_type = gender_type;
	}
	
	
}
	