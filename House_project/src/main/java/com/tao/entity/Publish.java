package com.tao.entity;

import java.util.Date;

/**
 * 
 * @author hyskoa
 *		发布房源实体类
 */
public class Publish {

	private int id;
	private String name;
	private String aname;
	private int hroom;
	private int hhall;
	private int hwei;
	private int hrice;
	private int fthis;
	private int fall;
	private int rent;
	private String title;
	private String hsay;
	private String picture;
	private Date time;
	private String position;
	private String divice;
	private String genre;
	public Publish() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Publish(int id, String name, String aname, int hroom, int hhall, int hwei, int hrice, int fthis, int fall,
			int rent, String title, String hsay, String picture, Date time, String position, String divice,
			String genre) {
		super();
		this.id = id;
		this.name = name;
		this.aname = aname;
		this.hroom = hroom;
		this.hhall = hhall;
		this.hwei = hwei;
		this.hrice = hrice;
		this.fthis = fthis;
		this.fall = fall;
		this.rent = rent;
		this.title = title;
		this.hsay = hsay;
		this.picture = picture;
		this.time = time;
		this.position = position;
		this.divice = divice;
		this.genre = genre;
	}
	@Override
	public String toString() {
		return "Publish [id=" + id + ", name=" + name + ", aname=" + aname + ", hroom=" + hroom + ", hhall=" + hhall
				+ ", hwei=" + hwei + ", hrice=" + hrice + ", fthis=" + fthis + ", fall=" + fall + ", rent=" + rent
				+ ", title=" + title + ", hsay=" + hsay + ", picture=" + picture + ", time=" + time + ", position="
				+ position + ", divice=" + divice + ", genre=" + genre + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public int getHroom() {
		return hroom;
	}
	public void setHroom(int hroom) {
		this.hroom = hroom;
	}
	public int getHhall() {
		return hhall;
	}
	public void setHhall(int hhall) {
		this.hhall = hhall;
	}
	public int getHwei() {
		return hwei;
	}
	public void setHwei(int hwei) {
		this.hwei = hwei;
	}
	public int getHrice() {
		return hrice;
	}
	public void setHrice(int hrice) {
		this.hrice = hrice;
	}
	public int getFthis() {
		return fthis;
	}
	public void setFthis(int fthis) {
		this.fthis = fthis;
	}
	public int getFall() {
		return fall;
	}
	public void setFall(int fall) {
		this.fall = fall;
	}
	public int getRent() {
		return rent;
	}
	public void setRent(int rent) {
		this.rent = rent;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getHsay() {
		return hsay;
	}
	public void setHsay(String hsay) {
		this.hsay = hsay;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDivice() {
		return divice;
	}
	public void setDivice(String divice) {
		this.divice = divice;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}

}
