package com.tao.entity;

//班级表：class
public class Clazz {

	private int clazz_id;		
	private String clazz_name;	//班级名
	private int major_id;		//专业表id
	
	public Clazz() {
		// TODO Auto-generated constructor stub
	}
	public Clazz(int clazz_id, String clazz_name, int major_id) {
		super();
		this.clazz_id = clazz_id;
		this.clazz_name = clazz_name;
		this.major_id = major_id;
	}
	
	@Override
	public String toString() {
		return "Class [clazz_id=" + clazz_id + ", clazz_name=" + clazz_name + ", major_id=" + major_id + "]";
	}
	public int getClazz_id() {
		return clazz_id;
	}
	public void setClass_id(int clazz_id) {
		this.clazz_id = clazz_id;
	}
	public String getClazz_name() {
		return clazz_name;
	}
	public void setClazz_name(String clazz_name) {
		this.clazz_name = clazz_name;
	}
	public int getMajor_id() {
		return major_id;
	}
	public void setMajor_id(int major_id) {
		this.major_id = major_id;
	}
}
