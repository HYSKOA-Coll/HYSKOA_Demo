package com.tao.entity;

public class Teacher {

	private int info_id;
	private int info_num;
	private String info_name;
	private String info_pwd;
	private String info_gender;
	private String info_phone;
	private int info_judge;
	
	public Teacher() {
		super();
	}

	public Teacher(int info_id, int info_num, String info_name, String info_pwd, String info_gender, String info_phone,
			int info_judge) {
		super();
		this.info_id = info_id;
		this.info_num = info_num;
		this.info_name = info_name;
		this.info_pwd = info_pwd;
		this.info_gender = info_gender;
		this.info_phone = info_phone;
		this.info_judge = info_judge;
	}

	@Override
	public String toString() {
		return "Info [info_id=" + info_id + ", info_num=" + info_num + ", info_name=" + info_name + ", info_pwd="
				+ info_pwd + ", info_gender=" + info_gender + ", info_phone=" + info_phone + ", info_judge="
				+ info_judge + "]";
	}

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}

	public int getInfo_num() {
		return info_num;
	}

	public void setInfo_num(int info_num) {
		this.info_num = info_num;
	}

	public String getInfo_name() {
		return info_name;
	}

	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}

	public String getInfo_pwd() {
		return info_pwd;
	}

	public void setInfo_pwd(String info_pwd) {
		this.info_pwd = info_pwd;
	}

	public String getInfo_gender() {
		return info_gender;
	}

	public void setInfo_gender(String info_gender) {
		this.info_gender = info_gender;
	}

	public String getInfo_phone() {
		return info_phone;
	}

	public void setInfo_phone(String info_phone) {
		this.info_phone = info_phone;
	}

	public int getInfo_judge() {
		return info_judge;
	}

	public void setInfo_judge(int info_judge) {
		this.info_judge = info_judge;
	}

	
}
