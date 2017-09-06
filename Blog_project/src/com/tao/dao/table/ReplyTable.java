package com.tao.dao.table;

public interface ReplyTable {

	//添加数据
	public static final String insert = "insert into Reply (id,replies,user,time) values(?,?,?,?)";
	
	
	//条件查询
	public static final String idselect = "select * from Reply where id=?";
	
	//查询数据
	public static final String select = "select * from Reply";
	
	
	//条件删除
	public static final String iddelete = "delete from Reply where rep_id=?";
}
