package com.tao.bean;

import java.util.Date;

/**
 * 
 *	回帖类
 */
public class Reply {
	
	private int rep_id;
	private int id;
	private String replies;
	private String user;
	private Date time;
	
	
	public Reply() {
		super();
	}


	public Reply(int rep_id, int id, String replies, String user, Date time) {
		super();
		this.rep_id = rep_id;
		this.id = id;
		this.replies = replies;
		this.user = user;
		this.time = time;
	}


	@Override
	public String toString() {
		return "Reply [rep_id=" + rep_id + ", id=" + id + ", replies=" + replies + ", user=" + user + ", time=" + time
				+ "]";
	}


	public int getRep_id() {
		return rep_id;
	}


	public void setRep_id(int rep_id) {
		this.rep_id = rep_id;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getReplies() {
		return replies;
	}


	public void setReplies(String replies) {
		this.replies = replies;
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
