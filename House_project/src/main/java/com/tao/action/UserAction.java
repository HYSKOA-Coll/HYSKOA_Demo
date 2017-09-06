package com.tao.action;

import java.sql.SQLException;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.dao.UserDao;
import com.tao.entity.User;

/**
 * 
 * @author hyskoa
 *	用户 Action类
 */
public class UserAction extends ActionSupport implements ModelDriven<User>{

	private User user = new User();
	private UserDao userdao = new UserDao(); 
	private Object responseJSON;
	
	public Object getResponseJSON() {
		return responseJSON;
	}

	public void setResponseJSON(Object responseJSON) {
		this.responseJSON = responseJSON;
	}


	@Override
	public User getModel() {
	
		return user;
	}
	/**
	 * 用户登录
	 * 1、通过对象模型拿到用户名和密码
	 * 2、调用user.name查询数据库
	 * 3、如果返回的user不为空 name==name  password==password 存进session
	 * 4、否则 返回repeat
	 * 5、 json return 返回session接收
	 */
	public String login() {

		System.out.println("----------UserAction------login---------");
		try {
			
				String name = user.getName();
				String password = user.getPassword();
				System.out.println("name:"+name +" password:"+password);
				
				user = (User) userdao.checkLogin(name);
				System.out.println("user"+user);
				
				if(name != null && user != null && user.getPassword().equals(password)) {
				
				Map<String,Object> map = ActionContext.getContext().getSession();
				System.out.println("session------name-----"+name);
				map.put("name", name);

				Object name1 =  map.get("name");
				System.out.println("get session----name1-:"+name1);
				
				setResponseJSON("success");
				System.out.println("success-----responseJSON；"+responseJSON);
				return "success";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			setResponseJSON("repeat");
			System.out.println("repeat-----responseJSON；"+responseJSON);
			return "success";	
	}

	/**
	 * 用户退出
	 * 1、清空session
	 * 2、
	 */
	public String logout() {
		
		System.out.println("-----UserAction------logout--------");
		
		ActionContext.getContext().getSession().clear();
		
	/*	String name;
		//获取session
		HttpSession session = request.getSession(false);
		if(session != null){
		//取出名字
		name = (String) session.getAttribute("name");
		//销毁
		session.invalidate();*/
		
		setResponseJSON("success");
		return "success";
	}
	/**
	 * 
	 * @return
	 * 用户注册
	 * 1、拿到用户名和密码
	 * 2、count==1 返回成功
	 * 3、否则返回失败
	 */
	public String register(){

		System.out.println("-----UserAction------register--------");
		
		try {
		String name = user.getName();
		String password = user.getPassword();
		System.out.println("name:"+name +" password:"+password);

			int count = userdao.insertUser(user);
			System.out.println(count);
			if(count == 1) {
				
				setResponseJSON("success");
				return "success";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		setResponseJSON("repeat");
		return "success";
	}
}
