package com.tao.bean;

import java.util.Date;
/**
 * 
 *	帖子类
 */
public class Publish {

	private int id;
	private String title;
	private String content;
	private String user;
	private Date time;
	
	public Publish() {
		super();
	}

	public Publish(int id, String title, String content, String user, Date time) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.user = user;
		this.time = time;
	}

	@Override
	public String toString() {
		return "Publish [id=" + id + ", title=" + title + ", content=" + content + ", user=" + user + ", time=" + time
				+ "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
	
	
	
}
