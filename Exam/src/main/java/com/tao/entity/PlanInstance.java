package com.tao.entity;

import java.util.Date;
import java.util.List;

public class PlanInstance {

	private int instance_id;
	private int plan_id;
	private int clazz_id;
	private int info_id;
	private String plan_name;
	private String info_name;
	private String token;
	private Date start_time;
	private int instance_judge;
	
	public PlanInstance() {
		super();
	}

	public PlanInstance(int instance_id, int plan_id, int clazz_id, int info_id, String plan_name, String info_name,
			String token, Date start_time, int instance_judge) {
		super();
		this.instance_id = instance_id;
		this.plan_id = plan_id;
		this.clazz_id = clazz_id;
		this.info_id = info_id;
		this.plan_name = plan_name;
		this.info_name = info_name;
		this.token = token;
		this.start_time = start_time;
		this.instance_judge = instance_judge;
	}

	@Override
	public String toString() {
		return "PlanInstance [instance_id=" + instance_id + ", plan_id=" + plan_id + ", clazz_id=" + clazz_id
				+ ", info_id=" + info_id + ", plan_name=" + plan_name + ", info_name=" + info_name + ", token=" + token
				+ ", start_time=" + start_time + ", instance_judge=" + instance_judge + "]";
	}

	public int getInstance_id() {
		return instance_id;
	}

	public void setInstance_id(int instance_id) {
		this.instance_id = instance_id;
	}

	public int getPlan_id() {
		return plan_id;
	}

	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}

	public int getClazz_id() {
		return clazz_id;
	}

	public void setClazz_id(int clazz_id) {
		this.clazz_id = clazz_id;
	}

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}

	public String getPlan_name() {
		return plan_name;
	}

	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}

	public String getInfo_name() {
		return info_name;
	}

	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public int getInstance_judge() {
		return instance_judge;
	}

	public void setInstance_judge(int instance_judge) {
		this.instance_judge = instance_judge;
	}

}
