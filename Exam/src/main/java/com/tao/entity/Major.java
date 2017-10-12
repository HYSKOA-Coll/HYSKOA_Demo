package com.tao.entity;

public class Major {

	private int major_id;//专业id
	private String major_name;//专业名
	private int college_id;//学院id
	public Major(int major_id, String major_name, int college_id) {
		super();
		this.major_id = major_id;
		this.major_name = major_name;
		this.college_id = college_id;
	}
	public Major(){}
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
	@Override
	public String toString() {
		return "Major [major_id=" + major_id + ", major_name=" + major_name + ", college_id=" + college_id + "]";
	}
	
	
}
