package com.tao.entity;

public class PlanTemplet {

	private int plan_templet_id;
	private int plan_id;
	private int media_id;
	private int packet_id;
	
	public PlanTemplet() {
		super();
	}

	public PlanTemplet(int plan_templet_id, int plan_id, int media_id, int packet_id) {
		super();
		this.plan_templet_id = plan_templet_id;
		this.plan_id = plan_id;
		this.media_id = media_id;
		this.packet_id = packet_id;
	}

	@Override
	public String toString() {
		return "PlanTemplet [plan_templet_id=" + plan_templet_id + ", plan_id=" + plan_id + ", media_id=" + media_id
				+ ", packet_id=" + packet_id + "]";
	}

	public int getPlan_templet_id() {
		return plan_templet_id;
	}

	public void setPlan_templet_id(int plan_templet_id) {
		this.plan_templet_id = plan_templet_id;
	}

	public int getPlan_id() {
		return plan_id;
	}

	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}

	public int getMedia_id() {
		return media_id;
	}

	public void setMedia_id(int media_id) {
		this.media_id = media_id;
	}

	public int getPacket_id() {
		return packet_id;
	}

	public void setPacket_id(int packet_id) {
		this.packet_id = packet_id;
	}
	
}
