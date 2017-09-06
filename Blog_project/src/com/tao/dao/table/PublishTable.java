package com.tao.dao.table;

public interface PublishTable {

	//添加并返回主健ID
//	public static final String inserts = "INSERT INTO table_name (title,content,user,time) VALUES(?,?,?,?)  SELECT @@IDENTITY AS ID";
	
	//添加数据
	public static final String insert = "insert into Publish(title,content,user,time) values (?,?,?,?)";
	
	
	//查询数据
	public static final String select = "select * from Publish";
	
	//id查询
	public static final String onselect = "select * from Publish where id=?";
	
	//删除数据
	public static final String delete = "delete from Publish where id=?";
}
