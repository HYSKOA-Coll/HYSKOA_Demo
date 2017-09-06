package com.tao.entity;

import java.util.List;

public class PageBean<T> {

	private int pageNow = 1;//当前第几页
	private int pageNum = 3;//每页显示多少条
	
	private int totalNum;//总共多少条记录  从数据库查询
	private int totalPage;//总共多少页  totalNum pageNum
	private List<T> data;//查询得到的集合
	
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	
	public int getTotalPage() {

		if(totalNum%pageNum==0){
			totalPage = totalNum/pageNum;
		}else{
			totalPage = totalNum/pageNum+1;
		}
		
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	
}
