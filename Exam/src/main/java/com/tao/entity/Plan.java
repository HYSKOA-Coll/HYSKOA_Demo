package com.tao.entity;

import java.sql.Timestamp;

public class Plan {

	private int plan_id;
	private String plan_name;
	private Timestamp plan_time;
	private int info_id;
	private String info_name;
	private String plan_apply;
	
	public Plan() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Plan(int plan_id, String plan_name, Timestamp plan_time, int info_id, String info_name, String plan_apply) {
		super();
		this.plan_id = plan_id;
		this.plan_name = plan_name;
		this.plan_time = plan_time;
		this.info_id = info_id;
		this.info_name = info_name;
		this.plan_apply = plan_apply;
	}

	@Override
	public String toString() {
		return "Plan [plan_id=" + plan_id + ", plan_name=" + plan_name + ", plan_time=" + plan_time + ", info_id="
				+ info_id + ", info_name=" + info_name + ", plan_apply=" + plan_apply + "]";
	}

	public int getPlan_id() {
		return plan_id;
	}

	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}

	public String getPlan_name() {
		return plan_name;
	}

	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}

	public Timestamp getPlan_time() {
		return plan_time;
	}

	public void setPlan_time(Timestamp plan_time) {
		this.plan_time = plan_time;
	}

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}

	public String getInfo_name() {
		return info_name;
	}

	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}

	public String getPlan_apply() {
		return plan_apply;
	}

	public void setPlan_apply(String plan_apply) {
		this.plan_apply = plan_apply;
	}
	
	}