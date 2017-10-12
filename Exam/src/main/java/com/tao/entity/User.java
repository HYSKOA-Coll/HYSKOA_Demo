package com.tao.entity;

public class User {

	private int admin_id;
	private String admin_name;
	private String admin_pwd;
	
	private int info_id;
	private int info_num;
	private String info_name;
	private String info_pwd;
	private String info_gender;
	private String info_phone;
	private int info_judge;

	private int clazz_id;
	private String calzz_name;
	
	public User() {
		super();
	}

	public User(int admin_id, String admin_name, String admin_pwd, int info_id, int info_num, String info_name,
			String info_pwd, String info_gender, String info_phone, int info_judge, int clazz_id, String calzz_name) {
		super();
		this.admin_id = admin_id;
		this.admin_name = admin_name;
		this.admin_pwd = admin_pwd;
		this.info_id = info_id;
		this.info_num = info_num;
		this.info_name = info_name;
		this.info_pwd = info_pwd;
		this.info_gender = info_gender;
		this.info_phone = info_phone;
		this.info_judge = info_judge;
		this.clazz_id = clazz_id;
		this.calzz_name = calzz_name;
	}

	@Override
	public String toString() {
		return "User [admin_id=" + admin_id + ", admin_name=" + admin_name + ", admin_pwd=" + admin_pwd + ", info_id="
				+ info_id + ", info_num=" + info_num + ", info_name=" + info_name + ", info_pwd=" + info_pwd
				+ ", info_gender=" + info_gender + ", info_phone=" + info_phone + ", info_judge=" + info_judge
				+ ", clazz_id=" + clazz_id + ", calzz_name=" + calzz_name + "]";
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getAdmin_pwd() {
		return admin_pwd;
	}

	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
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

	public int getClazz_id() {
		return clazz_id;
	}

	public void setClazz_id(int clazz_id) {
		this.clazz_id = clazz_id;
	}

	public String getCalzz_name() {
		return calzz_name;
	}

	public void setCalzz_name(String calzz_name) {
		this.calzz_name = calzz_name;
	}


	
}
