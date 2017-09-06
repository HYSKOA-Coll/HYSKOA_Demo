package com.tao.dao.daoimpl;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.tao.bean.User;
import com.tao.dao.table.UserTable;
/**
 * 
 *		用户sql实现类
 */
public class UserDaoImpl implements UserTable {

	DataSource datas = new ComboPooledDataSource();
	QueryRunner runner = new QueryRunner(datas);

	//通过user 查询用户 判断数据库是否存在
	public Object checkLogin(String param) throws SQLException {

		System.out.println("--UserDaoImpl---checkLogin()-------");

		User use = runner.query(onselect, new BeanHandler<User>(User.class), param);
		System.out.println(use);

		return use;

	}
	
	//查询所有用户返回list
//	public List<User> selectUser() throws SQLException{
//			
//		List<User> list = runner.query(select, new BeanListHandler<User>(User.class));
//		
//		return list;
//	} 
	

	//添加用户
	public int checkRegister(User use) throws SQLException {
		//拿到use 的用户名 
		User user = (User) checkLogin(use.getUser());
		
		//如果拿到的用户名和数据库的用户名相同返回 0
			if(user != null) {
				System.out.println("---UserDaoImpl---checkRegister()----"+user);
				return 0;
			}
		
		System.out.println("执行sql 拿到的use"+use.getUser() +"   "+use.getPwd());
		
		//user不相同添加一个用户 ， 返回 1
		Object[] param = {use.getUser(),use.getPwd()};
		return runner.update(insert, param);

	}

}