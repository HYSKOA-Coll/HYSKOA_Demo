package com.tao.entity;

import java.security.KeyStore.PrivateKeyEntry;

//学生/老师信息表：info
/**
 * @author wxm
 *
 */
public class Info {

	private int info_id;				
	private int info_num;			//学号/工号
	private String info_name;		//学生名/老师名
	private String info_gender;	//学生性别
	private String info_phone;		//学生电话
	private int info_judge;			//判断是老师/学生(0:老师 1：学生)
	private String info_pwd;		//登陆密码
	private int clazz_id;			//班级id
	private String clazz_name;
	private int major_id;
	private String major_name;
	private int college_id;
	private String college_name;
	
	public Info() {
		super();
	}
	public Info(int info_id, int info_num, String info_name, String info_gender, String info_phone, int info_judge,
			String info_pwd,int clazz_id) {
		super();
		this.info_id = info_id;
		this.info_num = info_num;
		this.info_name = info_name;
		this.info_gender = info_gender;
		this.info_phone = info_phone;
		this.info_judge = info_judge;
		this.info_pwd = info_pwd;
		this.clazz_id = clazz_id;
	}
	
	
	@Override
	public String toString() {
		return "Info [info_id=" + info_id + ", info_num=" + info_num + ", info_name=" + info_name + ", info_gender="
				+ info_gender + ", info_phone=" + info_phone + ", info_judge=" + info_judge + ", info_pwd=" + info_pwd
				+ ", clazz_id=" + clazz_id + ", clazz_name=" + clazz_name + ", major_id=" + major_id + ", major_name="
				+ major_name + ", college_id=" + college_id + ", college_name=" + college_name  + "]";
	}
	public int getMajor_id() {
		return major_id;
	}
	public void setMajor_id(int major_id) {
		this.major_id = major_id;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	public int getCollege_id() {
		return college_id;
	}
	public void setCollege_id(int college_id) {
		this.college_id = college_id;
	}
	public String getCollege_name() {
		return college_name;
	}
	public void setCollege_name(String college_name) {
		this.college_name = college_name;
	}
	public String getClazz_name() {
		return clazz_name;
	}
	public void setClazz_name(String clazz_name) {
		this.clazz_name = clazz_name;
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
	public String getInfo_pwd() {
		return info_pwd;
	}
	public void setInfo_pwd(String info_pwd) {
		this.info_pwd = info_pwd;
	}
	public int getClazz_id() {
		return clazz_id;
	}
	public void setClazz_id(int clazz_id) {
		this.clazz_id = clazz_id;
	}
	
}
