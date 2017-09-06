package com.tao.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.tao.bean.Publish;
import com.tao.dao.daoimpl.PublishDaoImpl;
import com.tao.dao.daoimpl.UserDaoImpl;
import com.tao.dao.table.UserTable;

public class Test {

	public static void main(String[] args) {
		
		//测试SQL
	/*	String[] sqlStrings ={UserTable.insert,UserTable.onselect,UserTable.delete,UserTable.ondelete};
		
		for (String sql : sqlStrings) {
			System.out.println(sql);
		}*/
		
		
		
		try {
			
			//用户表测试
//			UserDaoImpl udi = new UserDaoImpl();
			
			
			
			//Publish表测试
			PublishDaoImpl pdi = new PublishDaoImpl();
			
			//测试PUblish查询
	/*		List list = pdi.selectPublish();
			 	System.out.println(list);*/
			
			
			
			//测试Publish添加
	/*		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date=sdf.parse(sdf.format(new Date()));
			Publish publish = new Publish(0, "这是标题", "这是内容", "aaa", date);
			
			int count =  pdi.insertPublish(publish);
			System.out.println(count);
			*/
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
	}

}