package com.tao.entity;

import java.util.Date;

public class Media {

	private int media_id;
	private String media_name;
	private String media_path;
	private String media_level;
	private String media_type;
	private float media_size;
	private Date media_time;
	private int info_id;
	private String info_name;
	
	public Media() {
		super();
	}

	public Media(int media_id, String media_name, String media_path, String media_level, String media_type,
			float media_size, Date media_time, int info_id, String info_name) {
		super();
		this.media_id = media_id;
		this.media_name = media_name;
		this.media_path = media_path;
		this.media_level = media_level;
		this.media_type = media_type;
		this.media_size = media_size;
		this.media_time = media_time;
		this.info_id = info_id;
		this.info_name = info_name;
	}

	@Override
	public String toString() {
		return "Media [media_id=" + media_id + ", media_name=" + media_name + ", media_path=" + media_path
				+ ", media_level=" + media_level + ", media_type=" + media_type + ", media_size=" + media_size
				+ ", media_time=" + media_time + ", info_id=" + info_id + ", info_name=" + info_name + "]";
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

	public String getMedia_path() {
		return media_path;
	}

	public void setMedia_path(String media_path) {
		this.media_path = media_path;
	}

	public String getMedia_level() {
		return media_level;
	}

	public void setMedia_level(String media_level) {
		this.media_level = media_level;
	}

	public String getMedia_type() {
		return media_type;
	}

	public void setMedia_type(String media_type) {
		this.media_type = media_type;
	}

	public float getMedia_size() {
		return media_size;
	}

	public void setMedia_size(float media_size) {
		this.media_size = media_size;
	}

	public Date getMedia_time() {
		return media_time;
	}

	public void setMedia_time(Date media_time) {
		this.media_time = media_time;
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

	
}

