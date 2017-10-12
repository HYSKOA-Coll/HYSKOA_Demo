package com.tao.entity;

import java.util.List;

public class College {
	
	private int college_id;
	private String college_name;
	private List<Major> majorList;
	private String major_name;
	private int major_id;
	
	public College(int college_id, String college_name,List<Major> majorList) {
		super();
		this.college_id = college_id;//学院id
		this.college_name = college_name;//学院名
		this.majorList= majorList;
	}
	public College(){}
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
	
	public List<Major> getMajorList() {
		return majorList;
	}
	public void setMajorList(List<Major> majorList) {
		this.majorList = majorList;
	}
	
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	
	public int getMajor_id() {
		return major_id;
	}
	public void setMajor_id(int major_id) {
		this.major_id = major_id;
	}
	@Override
	public String toString() {
		return "College [college_id=" + college_id + ", college_name="
	+ college_name + ",majorList="+majorList+",]";
	}
	
	
}
