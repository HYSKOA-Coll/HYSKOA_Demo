package com.tao.dao;

import java.sql.SQLException;
import java.util.List;

import com.tao.entity.Publish;
import com.tao.entity.User;

public class Test {

	public static void main(String[] args) {
		
		try {
			
			/*
			 * 用户Dao测试
			 */
			/*UserDao userDao = new UserDao();
			userDao.checkLogin("admin");*/
			
			
			
			/*
			 * Publish 测试
			 */
			PublishDao publishDao = new PublishDao();
			
			//publish 添加
			Object[] param = {"admin","融侨紫微新苑","3","1","1","120","8","12","1200","丈八东路 电子城 高新 融侨馨苑 三室精装全配 拎包入住","这是房源描述","这是图片地址","2017-01-23 12:18:04","222","333","444"};
			int count = publishDao.insertlist(param);
			System.out.println(count);	
			
			//publish 条件查询
/*			Object[] param = {1,1000,2500};
			List list1 = publishDao.selectrent(1000,2000);
			System.out.println(list1);*/
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
