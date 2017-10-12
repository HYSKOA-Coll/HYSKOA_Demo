package com.tao.entity;

public class Questionp {

	private int packet_id;
	private String packet_name;
	private String packet_type;
	private String packet_level;
	private String packet_prompt;
	private int info_id;
	private int media_id;
	private String media_name;
	private String info_name;
	
	public Questionp() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Questionp(int packet_id, String packet_name, String packet_type, String packet_level, String packet_prompt,
			int info_id, int media_id, String media_name, String info_name) {
		super();
		this.packet_id = packet_id;
		this.packet_name = packet_name;
		this.packet_type = packet_type;
		this.packet_level = packet_level;
		this.packet_prompt = packet_prompt;
		this.info_id = info_id;
		this.media_id = media_id;
		this.media_name = media_name;
		this.info_name = info_name;
	}

	@Override
	public String toString() {
		return "Questionp [packet_id=" + packet_id + ", packet_name=" + packet_name + ", packet_type=" + packet_type
				+ ", packet_level=" + packet_level + ", packet_prompt=" + packet_prompt + ", info_id=" + info_id
				+ ", media_id=" + media_id + ", media_name=" + media_name + ", info_name=" + info_name + "]";
	}

	public int getPacket_id() {
		return packet_id;
	}

	public void setPacket_id(int packet_id) {
		this.packet_id = packet_id;
	}

	public String getPacket_name() {
		return packet_name;
	}

	public void setPacket_name(String packet_name) {
		this.packet_name = packet_name;
	}

	public String getPacket_type() {
		return packet_type;
	}

	public void setPacket_type(String packet_type) {
		this.packet_type = packet_type;
	}

	public String getPacket_level() {
		return packet_level;
	}

	public void setPacket_level(String packet_level) {
		this.packet_level = packet_level;
	}

	public String getPacket_prompt() {
		return packet_prompt;
	}

	public void setPacket_prompt(String packet_prompt) {
		this.packet_prompt = packet_prompt;
	}

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}

	public int getMedia_id() {
		return media_id;
	}

	public void setMedia_id(int media_id) {
		this.media_id = media_id;
	}

	public String getMedia_name() {
		return media_name;
	}

	public void setMedia_name(String media_name) {
		this.media_name = media_name;
	}

	public String getInfo_name() {
		return info_name;
	}

	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}
	
	
	
}
	
