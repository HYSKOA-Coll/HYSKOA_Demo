package com.tao.dao;


import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tao.entity.User;
import com.tao.util.jdbcUtils;

/**
 * 
 *	用户Dao层
 */
public class UserDao {

	public QueryRunner runner = new QueryRunner(jdbcUtils.getDataSource());
	
	
	//通过user 查询用户 判断数据库是否存在
		public Object checkLogin(String param) throws SQLException {

			System.out.println("--UserDaoImpl---checkLogin()-------");

			String sql = "select * from User where name=?";
			User user = runner.query(sql, new BeanHandler<User>(User.class), param);
			System.out.println(user);

			return user;

		}
		
		/*
		 * 添加用户
		 * 1、拿到要添加的用户名
		 * 2、调用用户名查询数据库是否已存在改用户
		 * 3、如果存在返回0，不存在添加进数据库返回1
		 */
		public int insertUser(User user) throws SQLException {
			
			System.out.println("----UserDao------insertUser----");

			User user1 = (User) checkLogin(user.getName());
			
			if(user1 != null) {
				System.out.println("---UserDao----insertUser-"+user1);
				return 0;
			}
			
			String sql = "insert into User(name,password) values(?,?)";
			
			return runner.update(sql,user.getName(),user.getPassword());
		}
	
}
